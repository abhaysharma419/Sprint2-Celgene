--step 1   //CHNAGE CALD_DT SK BETWEEN >> 202007 AND 202011
insert into jp_sandbox_ops.d_rpt_clear_ratio_dtl_1125  
SELECT DISTINCT b.sls_wrkr_sk, b.bp_par_sk, b.bp_sk, b.pset_sk1, cast(b.cald_dt AS INTEGER), CASE WHEN a.actual_dtl_ct IS NULL THEN 0 ELSE a.actual_dtl_ct END AS actual_dtl_ct,
CASE WHEN a.actual_dtl_ct > b.plan_dtl_ct THEN b.plan_dtl_ct ELSE CASE WHEN a.actual_dtl_ct IS NULL THEN 0 ELSE a.actual_dtl_ct END END AS capped_actl_dtl_ct, b.plan_dtl_ct, 
CASE WHEN cast(cast(a.actual_dtl_ct AS DECIMAL(18, 5)) / cast(b.plan_dtl_ct AS DECIMAL(18, 5)) * 100 AS DECIMAL(18, 5)) IS NULL THEN 0 ELSE cast(cast(a.actual_dtl_ct AS DECIMAL(18, 5)) / cast(b.plan_dtl_ct AS DECIMAL(18, 5)) * 100 AS DECIMAL(18, 5)) END AS CLER_RATO_BCKT
FROM (
 SELECT p.sls_wrkr_sk, p.par_bp_sk as bp_par_sk, p.bp_sk, p.pset_sk, left(p.cald_dt_sk, 6) AS cald_dt, COUNT(DISTINCT p.presn_id) AS actual_dtl_ct
 FROM jp3a_cdw.s_insn_bp_presn_dtl p
 WHERE LEFT(p.cald_dt_sk, 6) between 202005 and 202009 AND  STA_DS='Submitted_vod'
 GROUP BY p.sls_wrkr_sk,p.par_bp_sk, p.bp_sk, p.pset_sk, left(p.cald_dt_sk, 6)
 ) a
RIGHT OUTER JOIN (
 SELECT a.sls_wrkr_sk, a.bp_par_sk, a.bp_sk, CASE WHEN prd.pset_sk IS NULL THEN a.pset_sk 
 ELSE prd.pset_sk END AS pset_sk1, LEFT(a.strt_cald_dt_sk, 6) AS cald_dt, sum(a.plan_dtl_ct) AS plan_dtl_ct
 FROM (
  SELECT *
  FROM jp2a_cdw.xref_rpt_trgt_dr
  WHERE LEFT(strt_cald_dt_sk, 6)  between 202005 and 202009 
  ) a
 LEFT OUTER JOIN (
  SELECT *
  FROM jp2_int.rpt_prd_rolup_op_temp
  ) prd ON prd.prd_brd_grp_sk = a.pset_sk
 GROUP BY a.sls_wrkr_sk, a.bp_par_sk, a.bp_sk, pset_sk1, cald_dt
 ) b ON a.sls_wrkr_sk = b.sls_wrkr_sk AND a.bp_par_sk = b.bp_par_sk AND a.bp_sk = b.bp_sk AND a.pset_sk = b.pset_sk1 AND a.cald_dt = b.cald_dt;

--step 2

insert into  jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_inter_1125 
SELECT cast(NULL AS INTEGER), src.bp_par_sk, src.bp_sk,  src.pset_sk, src.sorg_unit_sk,  - 99, - 99, src.cald_dt, src.actual_dtl_ct, 
src.capped_actual_dtl_ct, src.plan_dtl_ct, tdfa.cler_rato_bckt_sk
from 
(select cr.bp_par_sk, cr.bp_sk, cr.pset_sk, sorg.sorg_unit_sk, cr.cald_dt, sum(cr.actual_dtl_ct) as actual_dtl_ct, sum(cr.capped_actual_dtl_ct) as capped_actual_dtl_ct, sum(cr.plan_dtl_ct)
as plan_dtl_ct,
case when sum(cr.actual_dtl_ct) is null or sum(cr.plan_dtl_ct) is null then 0
else cast(cast(sum(cr.actual_dtl_ct) AS DECIMAL(18, 5)) / cast(sum(cr.plan_dtl_ct) AS DECIMAL(18, 5)) * 100 AS DECIMAL(18, 5)) END as CLER_RATO_BCKT
FROM jp_sandbox_ops.d_rpt_clear_ratio_dtl_1125 cr, jp_rpt_v.v_d_rpt_sorg sorg, 
(select sorg_sk as sorg_unit_sk, asgnt_sls_wrkr_sk as sls_wrkr_sk from jp3a_cdw.sorg_sls_wrkr_asgnt_ext where lvl_nm='Territory'
) abc,(select distinct sorg_sk, sls_wrkr_sk from jp2a_cdw.xref_rpt_trgt_dr where strt_cald_dt_sk= (select (refh_mth||'01')::integer from jp_ops.cntl_refh)) dr
WHERE cr.sls_wrkr_sk = abc.sls_wrkr_sk AND upper(sorg.sorg_lvl_type_nm)='TERRITORY' AND  sorg.sorg_unit_sk = abc.sorg_unit_sk 
and abc.sorg_unit_sk=dr.sorg_sk and abc.sls_wrkr_sk=dr.sls_wrkr_sk --AND cast(cr.cald_dt || '01' AS INTEGER)>= abc.src_eff_dt 
group by cr.bp_par_sk, cr.bp_sk, cr.pset_sk, sorg.sorg_unit_sk, cr.cald_dt) src, 
jp_rpt_v.v_d_rpt_cler_rato_tdfa tdfa 
where src.CLER_RATO_BCKT >= cast(tdfa.cler_rato_bckt_strt_pct AS DECIMAL(18, 5)) AND src.CLER_RATO_BCKT <= cast(tdfa.cler_rato_bckt_end_pct AS DECIMAL(18, 5))


UNION

SELECT sls_wrkr_sk, bp_par_sk, bp_sk, pset_sk, rpt_sorg_sk, - 99, - 99, cald_dt, actual_dtl_ct, CASE WHEN actual_dtl_ct > plan_dtl_ct 
THEN plan_dtl_ct ELSE actual_dtl_ct END AS capped_actual_dtl_ct, plan_dtl_ct, tdfa.cler_rato_bckt_sk
FROM (
SELECT cast(NULL AS INTEGER) AS sls_wrkr_sk, cr.bp_par_sk, cr.bp_sk, cr.pset_sk, sorg.rpt_sorg_sk, - 99, - 99, cr.cald_dt, sum(cr.actual_dtl_ct)
AS actual_dtl_ct, sum(cr.plan_dtl_ct) AS plan_dtl_ct, CASE WHEN cast(cast(sum(actual_dtl_ct) AS DECIMAL(18, 5)) / cast(sum(plan_dtl_ct) AS DECIMAL(18, 5)) * 100 AS DECIMAL(18, 5))
IS NULL THEN cast(0 AS DECIMAL(18, 5)) ELSE cast(cast(sum(actual_dtl_ct) AS DECIMAL(18, 5)) / cast(sum(plan_dtl_ct) AS DECIMAL(18, 5)) * 100 AS DECIMAL(18, 5)) END AS CLER_RATO_BCKT
FROM jp_sandbox_ops.d_rpt_clear_ratio_dtl_1125 cr, (
   SELECT bsorg.pset_sk , bp_sk, sorg_lvl_type_nm, sorg_unit_sk as rpt_sorg_sk
   FROM jp3a_cdw.xref_rpt_sorg_bp_brd_seg bsorg
   WHERE bp_sk <> - 1
   ) sorg --, jp_rpt_v.v_d_rpt_cler_rato_tdfa tdfa
WHERE cr.bp_par_sk = sorg.bp_sk AND cr.pset_sk = sorg.pset_sk
AND upper(sorg_lvl_type_nm) IN ('REGION','DISTRICT','TEAM')--($sorg_lvl_type_nm$)
GROUP BY cr.bp_par_sk, cr.bp_sk, cr.pset_sk, sorg.rpt_sorg_sk, cr.cald_dt 
 )
INNER JOIN jp_rpt_v.v_d_rpt_cler_rato_tdfa tdfa ON CLER_RATO_BCKT >= cast(tdfa.cler_rato_bckt_strt_pct AS DECIMAL(18, 5)) 
AND CLER_RATO_BCKT <= cast(tdfa.cler_rato_bckt_end_pct AS DECIMAL(18, 5));

--step 3

INSERT INTO jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_1125
SELECT cr.sls_wrkr_sk, cr.bp_par_sk, cr.bp_sk, cr.pset_sk, cr.sorg_unit_sk, seg.segn_sk AS sls_chnl_sk, - 99 AS dr_segn_sk, cr.cald_dt, cr.actual_dtl_ct, cr.capped_actual_dtl_ct, 
cr.plan_dtl_ct, cr.cler_rato_bckt_sk
FROM jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_inter_1125 cr, jp2a_cdw.d_bp bp, jp2a_cdw.d_segn seg
WHERE bp.bp_sk = cr.bp_par_sk AND upper(seg.segn_cd) = upper(bp.bp_sls_chnl_ds) AND upper(seg.segn_type_ds) = 'SALES CHANNEL' AND upper(seg.segn_cd) != 'PO'

UNION

SELECT cr.sls_wrkr_sk, cr.bp_par_sk, cr.bp_sk, cr.pset_sk, cr.sorg_unit_sk, - 99 AS sls_chnl_sk, bs.segn_sk AS dr_segn_sk, cr.cald_dt, cr.actual_dtl_ct, cr.capped_actual_dtl_ct,
cr.plan_dtl_ct, cr.cler_rato_bckt_sk
FROM jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_inter_1125 cr, (
  SELECT bss.pset_sk , bss.bp_sk,  bss.segn_sk, bss.par_bp_sk
  FROM jp3a_cdw.dg_insn_bp_prd_seg bss
  ) bs
WHERE bs.bp_sk(+) = cr.bp_sk AND bs.par_bp_sk(+) = cr.bp_par_sk AND bs.pset_sk(+) = cr.pset_sk

UNION

SELECT cr.sls_wrkr_sk, cr.bp_par_sk, cr.bp_sk, cr.pset_sk, cr.sorg_unit_sk, seg.segn_sk AS sls_chnl_sk, bs.segn_sk AS dr_segn_sk, cr.cald_dt, cr.actual_dtl_ct, cr.capped_actual_dtl_ct, cr.plan_dtl_ct, cr.cler_rato_bckt_sk
FROM jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_inter_1125 cr, jp2a_cdw.d_bp bp, jp2a_cdw.d_segn seg, (
  SELECT bss.pset_sk , bss.bp_sk, bss.segn_sk, bss.par_bp_sk
  FROM jp3a_cdw.dg_insn_bp_prd_seg bss   
   ) bs
WHERE bp.bp_sk = cr.bp_par_sk AND upper(seg.segn_cd) = upper(bp.bp_sls_chnl_ds) AND upper(seg.segn_type_ds) = 'SALES CHANNEL' AND upper(seg.segn_cd) != 'PO'
AND bs.bp_sk(+) = cr.bp_sk AND bs.par_bp_sk(+) = cr.bp_par_sk AND bs.pset_sk(+) = cr.pset_sk

UNION

SELECT *
FROM jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_inter_1125;

--step 4

INSERT INTO jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_temp_1125
SELECT (select coalesce(max(snp_id),0)+1 snp_id from  jp_ops.cntl_rpt_snp where tbl_nm='rpt_sorg_prd_dtl_cler_rato_tdfa' and actv_flag=1), SORG_UNIT_SK, PRD_SK, SLS_CHNL_SK, DR_SEG_SK, cald_dt_sk, time_bckt_sk, CLER_RATO_BCKT_SK, CLER_RATO_BCKT_VAL_NUM, 1 AS cycl_time_id, 1 AS scen_id, '$inrt_by$' AS inrt_by, getdate() AS inrt_dt, '$inrt_by$' AS modf_by, getdate() AS modf_dt
FROM (
 SELECT cnt.sorg_unit_sk AS SORG_UNIT_SK, cnt.pset_sk AS PRD_SK, cnt.sls_chnl_sk AS SLS_CHNL_SK, cnt.dr_segn_sk AS DR_SEG_SK, cast(cnt.cald_dt || '01' AS INTEGER) AS cald_dt_sk, tb.time_bckt_sk, cnt.cler_rato_bckt_sk AS CLER_RATO_BCKT_SK, cast(cast(bp_cnt AS DECIMAL(18, 5)) / cast(totl_bp_cnt AS DECIMAL(18, 5)) AS DECIMAL(18, 5)) AS CLER_RATO_BCKT_VAL_NUM
 FROM (
  SELECT count(DISTINCT bp_par_sk || '-' || bp_sk) AS bp_cnt, sorg_unit_sk, pset_sk, sls_chnl_sk, dr_segn_sk, cald_dt, cler_rato_bckt_sk
  FROM jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_1125
  GROUP BY sorg_unit_sk, pset_sk, sls_chnl_sk, dr_segn_sk, cald_dt, cler_rato_bckt_sk
  ) cnt
 INNER JOIN (
  SELECT count(DISTINCT bp_par_sk || '-' || bp_sk) AS totl_bp_cnt, sorg_unit_sk, pset_sk, sls_chnl_sk, dr_segn_sk, cald_dt
  FROM jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_1125
  GROUP BY sorg_unit_sk, pset_sk, sls_chnl_sk, dr_segn_sk, cald_dt
  ) totl ON cnt.pset_sk = totl.pset_sk AND cnt.sorg_unit_sk = totl.sorg_unit_sk AND cnt.sls_chnl_sk = totl.sls_chnl_sk AND cnt.dr_segn_sk = totl.dr_segn_sk AND cnt.cald_dt = totl.cald_dt
 INNER JOIN jp_rpt_v.v_xref_time_bckt tb ON cast(cnt.cald_dt || '01' AS INTEGER) = tb.strt_cald_dt_sk
 WHERE upper(time_bckt_type) = 'MONTHLY' AND upper(time_bckt_src_nm) = 'ALL' AND cnt.dr_segn_sk <> - 1
 
 UNION
 
 SELECT sorg_unit_sk AS SORG_UNIT_SK, pset_sk AS PRD_SK, sls_chnl_sk AS SLS_CHNL_SK, dr_segn_sk AS DR_SEG_SK, cast(cald_dt || '01' AS INTEGER) AS cald_dt_sk, tb.time_bckt_sk, tdfa.cler_rato_bckt_sk AS CLER_RATO_BCKT_SK, cast(cast(sum(capped_actual_dtl_ct) AS DECIMAL(18, 5)) / cast(sum(plan_dtl_ct) AS DECIMAL(18, 5)) AS DECIMAL(18, 5)) AS CLER_RATO_BCKT_VAL_NUM
 FROM jp_sandbox_ops.d_rpt_clear_ratio_sk_dtl_1125 dtl, jp_rpt_v.v_d_rpt_cler_rato_tdfa tdfa, jp_rpt_v.v_xref_time_bckt tb
 WHERE upper(cler_rato_bckt_nm) = 'TDFA' AND cast(dtl.cald_dt || '01' AS INTEGER) = tb.strt_cald_dt_sk AND upper(time_bckt_type) = 'MONTHLY' AND upper(time_bckt_src_nm) = 'ALL' AND dr_segn_sk <> - 1
 GROUP BY sorg_unit_sk, pset_sk, sls_chnl_sk, dr_segn_sk, cald_dt, time_bckt_sk, tdfa.cler_rato_bckt_sk
 ) tbl1
INNER JOIN jp2a_cdw.d_pset p ON tbl1.prd_sk = p.pset_sk
WHERE 1 = (
SELECT 1
FROM jp_rpt_a.ref_rpt_prd_icln
WHERE upper(rpt_tbl_nm) = 'RPT_SORG_PRD_DTL_CLER_RATO_TDFA' AND charindex('''' + p.prd_shrt_ds+'-'+p.pset_id + '''', prd_list) > 0
);
  

  --step 5

  INSERT INTO jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_temp_1125
SELECT (select coalesce(max(snp_id),0)+1 snp_id from  jp_ops.cntl_rpt_snp where tbl_nm='rpt_sorg_prd_dtl_cler_rato_tdfa' and actv_flag=1), rpt.sorg_unit_sk, rpt.pset_sk, rpt.SLS_CHNL_SK, rpt.DR_SEG_SK, rpt.cald_dt_sk, tb.time_bckt_sk, rpt.cler_rato_bckt_sk, rpt.cler_rato_bckt_val_num, 1 AS cycl_time_id, 1 AS scen_id, '$inrt_by$' AS inrt_by, getdate() AS inrt_dt, '$inrt_by$' AS modf_by, getdate() AS modf_dt
FROM jp_rpt_v.v_rpt_sorg_prd_dtl_cler_rato_tdfa rpt, jp_rpt_v.v_xref_time_bckt tb, 
  (
  select sorg_sk as sorg_unit_sk, asgnt_sls_wrkr_sk as sls_wrkr_sk from jp3a_cdw.sorg_sls_wrkr_asgnt_ext where lvl_nm='Territory'
  ) sorg
WHERE rpt.cald_dt_sk = tb.strt_cald_dt_sk AND upper(tb.time_bckt_type) = 'MONTHLY' AND upper(tb.time_bckt_src_nm) = 'ALL' AND time_ago <= 6 AND rpt.cald_dt_sk NOT IN (
  SELECT DISTINCT cald_dt_sk
  FROM jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_temp_1125
  ) AND rpt.sorg_unit_sk = sorg.sorg_unit_sk --AND rpt.cald_dt_sk >= sorg.src_eff_dt 

UNION ALL

SELECT (select coalesce(max(snp_id),0)+1 snp_id from  jp_ops.cntl_rpt_snp where tbl_nm='rpt_sorg_prd_dtl_cler_rato_tdfa' and actv_flag=1), rpt.sorg_unit_sk, rpt.pset_sk, rpt.SLS_CHNL_SK, rpt.DR_SEG_SK, rpt.cald_dt_sk, tb.time_bckt_sk, rpt.cler_rato_bckt_sk, rpt.cler_rato_bckt_val_num, 1 AS cycl_time_id, 1 AS scen_id, '$inrt_by$' AS inrt_by, getdate() AS inrt_dt, '$inrt_by$' AS modf_by, getdate() AS modf_dt
FROM jp_rpt_v.v_rpt_sorg_prd_dtl_cler_rato_tdfa rpt, jp_rpt_v.v_xref_time_bckt tb, jp_rpt_v.v_d_rpt_sorg sorg
WHERE rpt.cald_dt_sk = tb.strt_cald_dt_sk AND upper(tb.time_bckt_type) = 'MONTHLY' AND upper(tb.time_bckt_src_nm) = 'ALL' AND time_ago <= 6 AND rpt.cald_dt_sk NOT IN (
  SELECT DISTINCT cald_dt_sk
  FROM jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_temp_1125
  ) AND rpt.sorg_unit_sk = sorg.sorg_unit_sk AND upper(sorg_lvl_type_nm) <> 'TERRITORY'; 

--step 6

INSERT INTO jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_inter_temp_1125
SELECT DISTINCT a.*
FROM (
 SELECT snp_id, sorg_unit_sk, prd_sk, sls_chnl_sk, dr_seg_sk, cald_dt_sk, time_bckt_sk, cler_rato_bckt_sk, cler_rato_bckt_val_num, cycl_time_id, scen_id, inrt_by, getdate() inrt_dt, modf_by, getdate() AS modf_dt
 FROM (
  SELECT *, rank() OVER (
    PARTITION BY snp_id, sorg_unit_sk, prd_sk, sls_chnl_sk, dr_seg_sk, cald_dt_sk, time_bckt_sk, cler_rato_bckt_sk, cycl_time_id, scen_id, inrt_by, modf_by ORDER BY cler_rato_bckt_val_num DESC
    ) r
  FROM (
   SELECT DISTINCT snp_id, sorg_unit_sk, prd_sk, sls_chnl_sk, dr_seg_sk, cald_dt_sk, time_bckt_sk, cler_rato_bckt_sk, cler_rato_bckt_val_num, cycl_time_id, scen_id, inrt_by, modf_by
   FROM jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_temp_1125 rpt
   
   UNION
   
   SELECT snp_id, sorg_unit_sk, prd_sk, sls_chnl_sk, dr_seg_sk, tdfa.strt_cald_dt_sk, tdfa.time_bckt_sk, tdfa.cler_rato_bckt_sk_all AS cler_rato_bckt_sk, 0, rpt.cycl_time_id, rpt.scen_id, rpt.inrt_by, rpt.modf_by
   FROM jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_temp_1125 rpt
   INNER JOIN (
    SELECT time_bckt_sk, strt_cald_dt_sk, cler_rato_bckt_sk AS cler_rato_bckt_sk_all
    FROM jp_rpt_v.v_xref_time_bckt tb, jp_rpt_a.d_rpt_cler_rato_tdfa 
    WHERE upper(time_bckt_type) = 'MONTHLY' AND upper(time_bckt_src_nm) = 'ALL' AND tb.time_ago <= 6 AND d_rpt_cler_rato_tdfa.cler_rato_bckt_sk <> - 1
    ) tdfa ON (cald_dt_sk || cler_rato_bckt_sk) != (strt_cald_dt_sk || cler_rato_bckt_sk_all)
   )
  )
 WHERE r = 1
 ) a;


 --step 7

 INSERT INTO jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_1125
SELECT DISTINCT a.*
FROM jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_inter_temp_1125 a
LEFT OUTER JOIN (
 SELECT DISTINCT dst_rpt_sk, bu_rpt_sk, bu_cd
 FROM jp_rpt_v.v_rpt_sorg_flat_hiery_terr
 ) b ON b.dst_rpt_sk = a.sorg_unit_sk
LEFT OUTER JOIN (
 SELECT DISTINCT terr_rpt_sk, bu_rpt_sk, bu_cd
 FROM jp_rpt_v.v_rpt_sorg_flat_hiery_terr
 ) c ON c.terr_rpt_sk = a.sorg_unit_sk
LEFT OUTER JOIN (
 SELECT DISTINCT regn_rpt_sk, bu_rpt_sk, bu_cd
 FROM jp_rpt_v.v_rpt_sorg_flat_hiery_terr
 ) d ON d.regn_rpt_sk = a.sorg_unit_sk
--  inner join jp_rpt_v.v_d_rpt_sorg ds on coalesce(d.bu_rpt_sk,b.bu_rpt_sk,c.bu_rpt_sk)=ds.sorg_unit_sk
INNER JOIN jp2a_cdw.d_pset p ON a.prd_sk = p.pset_Sk
WHERE 1 = (
  SELECT 1
  FROM jp_rpt_a.ref_rpt_prd_icln
  WHERE upper(rpt_tbl_nm) = upper('rpt_sorg_prd_dtl_cler_rato_tdfa_bu') AND charindex('''' + cast(coalesce(d.bu_cd, b.bu_cd, c.bu_cd) as varchar) + '-' + p.prd_shrt_ds + '''', prd_list) > 0
  )
  ;

 
 ---chnage cycle time id and macth with thw latest prod -----
 update jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_1125 set cycl_time_id=320201016 ,inrt_by='bms_ops' ,modf_by='bms_ops'
 ,snp_id =(select max(snp_id) from jp_rpt_a.rpt_sorg_prd_dtl_cler_rato_tdfa);

delete  from jp_rpt_a.rpt_sorg_prd_dtl_cler_rato_tdfa where prd_sk  in (3431,3434,3430,3433,3435)
 and  snp_id in (select max(snp_id) from jp_rpt_a.rpt_sorg_prd_dtl_cler_rato_tdfa) and time_bckt_sk<>301;


--//CHNAGE CALD_DT SK BETWEEN >> 202007 AND 202011
insert into jp_rpt_a.rpt_sorg_prd_dtl_cler_rato_tdfa 
select a.* from jp_sandbox_ops.rpt_sorg_prd_dtl_cler_rato_tdfa_1125
 a join jp2a_cdw.d_pset p on p.pset_sk=a.prd_sk where prd_shrt_ds in ('HEMA MM','HEM LYM','HEMA CML','HEMA HL','HEMA ATL','HEMA MDS')
 and cald_dt_sk between 20200501 and 20200901;

