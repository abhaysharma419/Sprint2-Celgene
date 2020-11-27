INSERT INTO jp2_int.intd_sorg_bp_prd_seg_evnt_ct_mnthly
SELECT DISTINCT bb.rpt_sorg_sk,
				nvl(aa.bp_par_sk,s.bp_par_sk) AS bp_par_sk, 
				nvl(aa.bp_sk,s.bp_sk) AS bp_sk,
				nvl(aa.pset_sk,s.pset_sk) AS pset_sk, 
				aa.dr_seg_sk  AS dr_seg_sk, 
				nvl(left(s.cald_dt_sk,6),left(aa.strt_cald_dt_sk,6))   AS time_bckt_sk, 
				xref.seg_sk 				as tier_sk,
				xref.src_trgt_cd            AS tier,
                'MR Detail' AS chnl_type_id, 
				Case when aa.bp_par_sk is not null then 'Target'  else 'Non Target' end AS target_type, 
				CASE 
					 WHEN upper(tb.cmpny) = 'CO'  THEN 'Co-Visit' 
					 WHEN upper(tb.cmpny) = 'BMS'  THEN 'BMS Solo' 
					 WHEN upper(tb.cmpny) = 'CO-PRO' THEN 'Co-Pro Solo'
					 ELSE tb.cmpny 
				END   AS co_pro_flag,
                count(DISTINCT s.presn_id) AS evnt_ct 
FROM            ( 
                           SELECT     n.*
                           FROM       (   	select f.* from (select * from jp3a_cdw.s_bp_prd_presn_dtl where dtl_ind = 'MR Detail') f
                                                      WHERE  to_date(left(f.cald_dt_sk,6), 'yyyymmdd') <= (SELECT To_date(cur_mth, 'yyyymm') FROM jp_ops.cntl_refh) 
													  AND To_date(left(f.cald_dt_sk,6), 'yyyymmdd') >= ( SELECT Dateadd(month, -11, To_date(cur_mth, 'yyyymm')) FROM jp_ops.cntl_refh))n )s 
FULL OUTER JOIN (

	select * from 
(
SELECT abc.pset_sk pset_sk, 
		   sls_wrkr_sk, 
			left(strt_cald_dt_sk,6) as strt_cald_dt_sk,
		   bp_sk, 
		   bp_par_sk, 
		   dr_seg_sk, 
		   plan_dtl_ct, 
		   segn_sk 
		FROM   jp2a_cdw.xref_rpt_trgt_dr abc 
		   
			WHERE to_date(left(abc.strt_cald_dt_sk,6), 'yyyymmdd') <= (SELECT To_date(cur_mth, 'yyyymm') FROM jp_ops.cntl_refh) 
			AND To_date(left(abc.strt_cald_dt_sk,6), 'yyyymmdd') >= (SELECT Dateadd(month, -11, To_date(cur_mth, 'yyyymm')) FROM jp_ops.cntl_refh) 
union all
SELECT abc.pset_sk pset_sk, 
		   sls_wrkr_sk, 
			case when MAX(left(strt_cald_dt_sk,6)) over (partition by pset_sk) =(SELECT replace(left(Dateadd(MONTH, -1, To_date(cur_mth, 'yyyymm')),7),'-','')  FROM jp_ops.cntl_refh) then 
				  (SELECT cur_mth  FROM jp_ops.cntl_refh) else '999901' end as strt_cald_dt_sk,
		   bp_sk, 
		   bp_par_sk, 
		   dr_seg_sk, 
		   plan_dtl_ct, 
		   segn_sk 
		FROM   jp2a_cdw.xref_rpt_trgt_dr abc 
		   
			WHERE to_date(left(abc.strt_cald_dt_sk,6), 'yyyymmdd') <= (SELECT To_date(cur_mth, 'yyyymm') FROM jp_ops.cntl_refh) 
			AND To_date(left(abc.strt_cald_dt_sk,6), 'yyyymmdd') >= (SELECT Dateadd(month, -1, To_date(cur_mth, 'yyyymm')) FROM jp_ops.cntl_refh) 
) where strt_cald_dt_sk <>'999901' 			
	 
		) aa 
ON              aa.bp_par_sk = s.bp_par_sk 
AND             aa.bp_sk = s.bp_sk 
AND             aa.pset_sk = s.pset_sk
AND             LEFT(aa.strt_cald_dt_sk,6) = LEFT(s.cald_dt_sk,6)

LEFT JOIN 		(
	   SELECT CASE 
         WHEN prd.pset_sk IS NULL THEN abc.pset_sk 
         ELSE prd.pset_sk 
       END AS pset_sk, 
       cmpny, 
       bp_par_sk, 
       strt_cald_dt_sk, 
       rec_type 
FROM   jp2_int.trgt_insn_base abc 
       LEFT OUTER JOIN jp2_int.prd_rlup_brd_mlti_temp prd 
                    ON abc.pset_sk = prd.prd_brd_grp_sk ) tb
						ON  tb.bp_par_sk = nvl(aa.bp_par_sk,s.bp_par_sk)
						AND  LEFT(tb.strt_cald_dt_sk,6) = nvl(LEFT(aa.strt_cald_dt_sk,6),LEFT(s.cald_dt_sk,6))
						AND UPPER (tb.rec_type) = 'A_I' 
AND tb.pset_sk = nvl(aa.pset_sk,s.pset_sk)
LEFT JOIN ( Select  pset_sk as prd_sk, src_trgt_cd,  bp_sk,segn_sk as seg_sk ,src_trgt_type_ds as src_trgt_type, src_strt_dt, src_end_dt from jp3a_cdw.dg_insn_prd_trgt_tier ) xref
ON xref.bp_sk = nvl(aa.bp_par_sk,s.bp_par_sk)
AND to_date(nvl(left(s.cald_dt_sk,6),left(aa.strt_cald_dt_sk,6)),'YYYYMMDD') BETWEEN xref.src_strt_dt AND xref.src_end_dt 
AND xref.prd_sk = nvl(aa.pset_sk,s.pset_sk)
AND upper(xref.src_trgt_type)  = 'TIER'				
INNER JOIN 
								( SELECT DISTINCT b.bp_sk, 
														ds.sorg_sk AS rpt_sorg_sk, 
														b.eff_strt_dt,
														b.eff_end_dt,
														CASE WHEN de.pset_sk IS NOT NULL THEN de.pset_sk ELSE b.pset_sk END AS t_pset_sk
										FROM   jp3a_cdw.xref_bp_sorg_prd_aligt b				
											   --LEFT JOIN jp_rpt_v.v_d_rpt_sorg dp --active sorgs
												--	  ON dp.sorg_unit_sk = b.sorg_sk 
											   INNER JOIN jp2a_cdw.d_sorg ds 
													   ON b.sorg_sk = ds.sorg_sk
											   LEFT JOIN 
											   ( SELECT pset_sk,prd_brd_grp_sk FROM jp2_int.rpt_prd_rolup_aligt_temp 
											   where prd_brd_grp_sk NOT IN (319,680,1850)
											   UNION 
											   
											    SELECT pset_sk,prd_brd_grp_sk FROM jp_ops.rpt_prd_rolup_op_to_io
												) de ON b.pset_sk = de.prd_brd_grp_sk
													WHERE Upper(ds.sorg_type_nm) = 'DISTRICT'
														  --AND Upper(dp.sorg_lvl_type_nm) = 'DISTRICT' --- acting as inner join 
														  AND b.eff_strt_dt >= (SELECT Dateadd(MONTH, -12, To_date(cur_mth, 'yyyymm'))	FROM jp_ops.cntl_refh)
										) bb
						   ON         NVL(aa.bp_par_sk,s.bp_par_sk) = bb.bp_sk 
                           AND        bb.t_pset_sk = nvl(aa.pset_sk,s.pset_sk)
						   AND last_day(to_date(nvl(left(aa.strt_cald_dt_sk,6),left(s.cald_dt_sk,6)),'YYYYMMDD')) BETWEEN bb.eff_strt_dt AND bb.eff_end_dt
GROUP BY 1,2,3,4,5,6,7,8,9,10,11;