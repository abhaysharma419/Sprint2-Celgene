insert into jp2_int.dr_insn_actv_all_ntrgt_daily
select sorg_sk,sls_wrkr_sk, s.pset_sk, cald_dt_sk, bi.bp_extl_idnty_val_txt as dcf_dsf_cd,bp.bp_Sk as bp_par_sk, bp.bp_cd as par_bp_cd,bp.bp_nm as par_bp_nm,
trgt.src_trgt_cd as trgt_type,bp.bp_sls_chnl_ds  as chnl_type, tier.src_trgt_cd as tier, bi_dr.bp_extl_idnty_val_txt as dr_id,bi_dr.bp_sk as bp_sk,dr_bp.bp_cd as dr_cd,dr_bp.bp_nm as 

dr_nm,trgt_flag,
 seg_dr.segn_ds as dr_segn,terr_seq_num, presn_p2p_cnt,web_cnt,approved_mail_cnt,iva_cnt,actual_detail_cnt,covisit_cnt, 

appnt_cnt,exp_cnt, trgt_cnt
from
(
select s.sorg_sk,s.sls_wrkr_sk  , s.pset_sk ,cast (s.cald_dt_sk as integer )  as cald_Dt_sk , s.bp_par_Sk as bp_par_sk, 
s.bp_Sk as bp_sk,seg.segn_sk as dr_seg_sk,terr_seq_num, sum

(presn_p2p_cnt)as presn_p2p_cnt,sum(web_cnt)as web_cnt,
sum(approved_mail_cnt)as approved_mail_cnt,sum(iva_cnt)as iva_cnt,sum(actual_detail_cnt)as actual_detail_cnt,sum(covisit_cnt)as 

covisit_cnt, sum(appnt_cnt)as appnt_cnt,
sum(exp_cnt)as exp_cnt,sum(trgt_cnt) as trgt_cnt, case when sp.bp_par_sk is not null then 1 else 0 end as trgt_flag from 
(              
Select e.sorg_sk,e.bp_par_sk,e.bp_sk,e.pset_sk,0 as dr_seg_sk,terr_seq_num,e.cald_dt_sk::int as cald_dt_sk,sls_wrkr_sk ,count

(distinct prsnl_pevt_id) as presn_p2p_cnt,
0 as web_cnt, 0 as approved_mail_cnt, 0 as iva_cnt,
0 as actual_detail_cnt, 0 as covisit_cnt, 0 as appnt_cnt, 0 as exp_cnt,0 as trgt_cnt,0 as trgt_flag
                              from jp2_int.dr_evnt_atvy_temp e where e.chnl_type_id='P2Pセミナー' group by 1,2,3,4,5,6,7,8 
                              union
                              Select e.sorg_sk,e.bp_par_sk,e.bp_sk,e.pset_sk,0,terr_seq_num,e.cald_dt_sk :: int ,sls_wrkr_sk ,0 as 

presn_p2p_cnt,count(distinct prsnl_pevt_id) as web_cnt,
							  0 as approved_mail_cnt, 0 as iva_cnt, 0,0,0,0,0,0
                              from jp2_int.dr_evnt_atvy_temp e where e.chnl_type_id='WEBセミナー' group by 1,2,3,4,5,6,7,8 
                              union 
                               
							   -- IVA and email
                              Select e.sorg_sk,e.bp_par_sk,e.bp_sk,e.pset_sk,0,terr_seq_num, e.cald_dt_sk :: int,sls_wrkr_sk,0,0,count

(distinct presn_id) as approved_mail_cnt, 0 as iva_cnt,0,0,0,0,0,0
                              from jp2_int.dr_email_iva_atvy_temp e where chnl_type_id='APPROVED E-MAIL' group by 1,2,3,4,5,6,7,8 
                              union
                              Select e.sorg_sk,e.bp_par_sk,e.bp_sk,e.pset_sk,0,terr_seq_num, e.cald_dt_sk :: int,sls_wrkr_sk,0,0,0, count

(distinct presn_id) as iva_cnt,0,0,0,0,0,0
                              from jp2_int.dr_actl_pln_atvy_temp e where chnl_type_id='IVA' group by 1,2,3,4,5,6,7,8 
                              union all
                              --dtl_count/app/super
                              Select  e.sorg_sk,e.bp_par_sk,e.bp_sk,e.pset_sk,0,terr_seq_num,e.cald_dt_sk,sls_wrkr_sk,0,0,0,0,count

(distinct presn_id) as actual_detail_cnt,0 as covisit_cnt,0 as appnt_cnt,0 ,0,0
                              from jp2_int.dr_actl_pln_atvy_temp e where e.chnl_type_id='DETAIL' group by 1,2,3,4,5,6,7,8 
                              union
                              Select  e.sorg_sk,e.bp_par_sk,e.bp_sk,e.pset_sk,0,terr_seq_num, e.cald_dt_sk :: int,sls_wrkr_sk,0,0,0,0,0,count

(distinct presn_id) as covisit_cnt,0 as appnt_cnt,0,0,0
                              from jp2_int.dr_actl_pln_atvy_temp e where e.chnl_type_id='CO-VISITS WITH SUPERVISOR' group by 1,2,3,4,5,6,7,8 
                              union
                              Select  e.sorg_sk,e.bp_par_sk,e.bp_sk,e.pset_sk,0,terr_seq_num, 

e.cald_dt_sk :: int,sls_wrkr_sk,0,0,0,0,0,0,count(distinct presn_id) as appnt_cnt,0,0,0
                              from jp2_int.dr_actl_pln_atvy_temp e where e.chnl_type_id='APPOINTMENT DETAIL' group by 1,2,3,4,5,6,7,8 
                              Union                   
                              --presn 
                              Select e.sorg_sk,e.bp_par_sk,e.bp_sk,e.pset_sk,0,terr_seq_num,

e.cald_dt_sk :: int,sls_wrkr_sk,0,0,0,0,0,0,0,count(distinct presn_id) as exp_cnt,0,0
                              from jp2_int.dr_presn_atvy_temp e group by 1,2,3,4,5,6,7,8 
                              union
                              select sorg_sk,bp_par_sk,bp_sk,d_pset_sk,0,terr_seq_num, strt_cald_dt_sk :: int ,sls_wrkr_sk 

,0,0,0,0,0,0,0,0,sum(plan_dtl_ct) as Trgt_val,1 from
jp2_int.dr_pln_dtl_atvy_all_temp sp -- left join jp_rpt_v.v_d_rpt_sorg sg on sg.src_sk=sp.sls_wrkr_sk and sorg_lvl_type_nm='MR'
                              group by 1,2,3,4,5,6,7,8 ) s 
left join
(select distinct pset_sk,bp_par_sk,bp_sk,dr_seg_sk from 
jp2a_cdw.xref_rpt_trgt_dr sp
               WHERE 
                              LEFT (sp.strt_cald_dt_sk,6)>=(select cast((substring(cur_mth,1,4)-2||'01') as integer) from jp_ops.cntl_refh) and 
							  sp.strt_cald_dt_sk=(select max_strt_dt_cald_sk from 

jp_ops.cntl_refh_max_cycl_plan)) sp 
                              on sp.pset_sk=s.pset_sk and s.bp_par_Sk=sp.bp_par_sk 
							  and s.bp_Sk=sp.bp_sk
left join (select distinct  a.pset_sk   AS d_pset_sk,
  a.bp_Sk , a.par_bp_sk as bp_par_sk  ,a.segn_sk from jp3a_cdw.dg_insn_bp_prd_seg a 
  
  where segn_sk<>-1)seg
on          s.pset_sk=seg.d_pset_sk and s.bp_par_Sk=seg.bp_par_Sk and s.bp_Sk=seg.bp_sk
group by 1,2,3,4,5,6,7,8,18
)s 

left join jp2a_Cdw.d_bp bp on bp.bp_sk=s.bp_par_Sk
left join (select distinct bp_extl_idnty_val_txt, bp_sk from  jp2a_cdw.d_bp_extl_idnty where bp_extl_idnty_type_cd = 'ULT_ID' ) bi on bp.bp_sk=bi.bp_sk
left join (select distinct src_trgt_cd, pset_sk as pset_sk,bp_sk from jp3a_cdw.dg_insn_prd_trgt_tier trgt left join jp_ops.cntl_refh on 1=1 where 

src_trgt_type_ds='CO-PRO' and src_strt_dt<=refh_dt and refh_dt<=src_end_dt
union 
select distinct  src_trgt_cd, pset.pset_sk,bp_sk from jp3a_cdw.dg_insn_prd_trgt_tier  tgt left join jp_ops.cntl_refh on 1=1 left join 
jp2a_cdw.d_pset pset 
on 1=1 where src_trgt_type_ds='CO-PRO' and tgt.src_strt_dt<=refh_dt and refh_dt<=tgt.src_end_dt and pset.prd_shrt_ds 

='OR'
and tgt.pset_sk=(select pset_sk from jp2a_cdw.d_pset where prd_shrt_ds='OR IV')
) trgt on trgt.bp_sk=bp.bp_sk and s.pset_sk=trgt.pset_sk
left join (select distinct src_trgt_cd, pset_sk as pset_sk,bp_sk from jp3a_cdw.dg_insn_prd_trgt_tier left join jp_ops.cntl_refh on 1=1 where 
src_trgt_type_ds='TIER' and src_strt_dt<=refh_dt and refh_dt<=src_end_dt) tier on tier.bp_sk=bp.bp_sk and tier.pset_sk=s.pset_sk
left join jp2a_Cdw.d_bp dr_bp on dr_bp.bp_sk=s.bp_Sk 
left join jp2a_cdw.d_segn seg_dr on seg_dr.segn_sk=s.dr_seg_sk
left join (select distinct bp_extl_idnty_val_txt, bp_sk from  jp2a_cdw.d_bp_extl_idnty where bp_extl_idnty_type_cd = 'ULT_ID') bi_dr on dr_bp.bp_sk=bi_dr.bp_sk;

-------------------------------------

insert into  jp2_int.regn_dst_terr_mr_dr_insn_actv_daily
(regn_id,regn_cd,regn_nm,dst_id,dst_cd,dst_nm,terr_id,terr_cd,terr_nm,mr_cd,mr_nm,sls_wrkr_sk,prd_sk,cald_dt_sk,dcf_dsf_cd,par_bp_cd,par_bp_nm,trgt_type,chnl_type,
tier,dr_id,dr_cd
,dr_nm,trgt_flag,dr_segn,sls_wrkr_seq_num,presn_p2p_cnt,web_cnt,approved_mail_cnt,iva_cnt,actual_detail_cnt,covisit_cnt,appnt_cnt,exp_cnt,trgt_cnt,bp_sk,bp_par_sk)
Select * from 
(Select regn.regn_Id, regn.regn_cd , regn_lcl_nm,dst.dst_id, dst.dst_cd ,dst_lcl_nm ,terr.terr_id,terr.terr_cd ,terr.terr_lcl_nm ,mr.bms_id as mr_id , 
mr.pfr_frst_nm AS mr_nm, all_atvy.sls_wrkr_sk,prd_sk,cald_dt_sk,dcf_dsf_cd,par_bp_cd,par_bp_nm,trgt_type,chnl_type,tier,dr_id,dr_cd,dr_nm,trgt_flag,dr_segn,terr_seq_num,
presn_p2p_cnt,web_cnt,approved_mail_cnt,iva_cnt,actual_detail_cnt,covisit_cnt,appnt_cnt,exp_cnt,trgt_cnt,bp_sk,bp_par_sk
from jp2_int.dr_insn_actv_all_ntrgt_daily all_atvy 
Left outer join 
(Select sls_wrkr_sk  , bms_id,lcl_wrkr_last_nm + '　' + lcl_wrkr_frst_nm AS pfr_frst_nm from jp2a_cdw.d_sls_wrkr where actv_flag=1 ) mr 
on mr.sls_wrkr_sk=all_atvy.sls_wrkr_sk 
Left Outer Join
(Select distinct terr_rpt_sk,terr_id ,terr_lcl_nm,terr_cd from jp_rpt_v.v_rpt_sorg_flat_hiery_terr ) terr 
ON terr.terr_rpt_sk=all_atvy.sorg_sk
Left outer join 
(Select distinct terr_rpt_sk, dst_rpt_sk ,dst_id ,dst_cd,dst_lcl_nm from jp_rpt_v.v_rpt_sorg_flat_hiery_terr ) dst 
on dst.terr_rpt_sk=terr.terr_rpt_sk
Left outer join (Select distinct regn_rpt_sk, dst_rpt_sk,regn_id,regn_cd,regn_lcl_nm from jp_rpt_v.v_rpt_sorg_flat_hiery_terr )regn 
on regn.dst_rpt_sk=dst.dst_rpt_sk );

-----------------------------------------

INSERT INTO jp2_int.rpt_sorg_prd_dr_insn_all_atvy_daily (regn_id, regn_cd, regn_nm, dst_id, dst_cd, dst_nm, terr_id, terr_cd, terr_nm, mr_cd, mr_nm, dcf_dsf_cd, bms_cd, insn_nm, trgt_type_cd, sls_chnl_cd, prd_shrt_ds, tier_cd, cald_dt_sk, yr_sem_nbr, data_lvl_ds, dr_id,dr_cd, dr_nm, trgt_dr_flag, dr_seg_cd, plan_dtl_cnt, actl_dtl_cnt, app_dtl_cnt, iva_dtl_cnt, co_vst_dtl_cnt, expl_mtg_dtl_cnt, web_semr_dtl_cnt, pp_dtl_cnt, open_email_dtl_cnt, dual_terr_flag, bp_par_Sk, bp_sk)
SELECT DISTINCT regn_id, regn_cd, regn_nm, dst_id, dst_cd, dst_nm, terr_id, terr_cd, terr_nm, mr_cd, mr_nm, dcf_dsf_cd, par_bp_cd AS bms_cd, par_bp_nm AS insn_nm, trgt_type AS trgt_type_cd, chnl_type AS sls_chnl_cd, prd_shrt_ds, tier AS tier_cd, cald_dt_sk AS cald_dt_sk, sem_nbr AS yr_sem_nbr, data_lvl AS data_lvl_ds, dr_id,dr_cd, dr_nm, trgt_flag AS trgt_dr_flag, dr_segn AS dr_seg_cd, trgt_cnt AS plan_dtl_cnt, actual_detail_cnt AS actl_dtl_cnt, appnt_cnt AS app_dtl_cnt, iva_cnt AS iva_dtl_cnt, covisit_cnt AS co_vst_dtl_cnt, exp_cnt AS expl_mtg_dtl_cnt, web_cnt AS web_semr_dtl_cnt, presn_p2p_cnt AS pp_dtl_cnt, approved_mail_cnt AS open_email_dtl_cnt, dual_mr_flag ,bp_par_Sk, bp_sk
FROM (
	WITH all_trgt AS (
			SELECT all_trgt.regn_id, regn_cd, all_trgt.regn_nm, dst_id, dst_cd, all_trgt.dst_nm, terr_id, terr_cd, terr_nm, mr_cd, mr_nm, dcf_dsf_cd, par_bp_cd, par_bp_nm, trgt_type, chnl_type, prd_shrt_ds, pset_id, tier, cald_dt_sk, substring(cald_dt_sk, 1, 4) || (
					CASE 
						WHEN substring(cald_dt_sk, 5, 2) IN ('01', '02', '03', '04', '05', '06')
							THEN ' 上期'
						ELSE ' 下期'
						END
					) AS sem_nbr, dr_id,dr_cd, dr_nm, trgt_flag, dr_segn, sls_wrkr_seq_num AS dual_mr_flag, trgt_cnt, actual_detail_cnt, appnt_cnt, iva_cnt, covisit_cnt, exp_cnt, web_cnt, presn_p2p_cnt, approved_mail_cnt, bu_nm, bp_par_sk, bp_sk
			FROM jp2_int.regn_dst_terr_mr_dr_insn_actv_daily all_trgt
			LEFT JOIN jp2a_cdw.d_pset pset ON pset.pset_sk = all_trgt.prd_sk
			LEFT JOIN (
				SELECT DISTINCT regn_id, bu_nm
				FROM jp_rpt_v.v_rpt_sorg_flat_hiery_terr
				) fh ON fh.regn_id = all_trgt.regn_id
			), all_trgt1 AS (
			SELECT DISTINCT all_trgt.regn_id, regn_cd, all_trgt.regn_nm, dcf_dsf_cd, par_bp_cd, par_bp_nm, trgt_type, chnl_type, prd_shrt_ds, pset_id, tier, cald_dt_sk, substring(cald_dt_sk, 1, 4) || (
					CASE 
						WHEN substring(cald_dt_sk, 5, 2) IN ('01', '02', '03', '04', '05', '06')
							THEN ' 上期'
						ELSE ' 下期'
						END
					) AS sem_nbr, dr_id,dr_cd, dr_nm, trgt_flag, dr_segn, sls_wrkr_seq_num AS dual_mr_flag, trgt_cnt, actual_detail_cnt, appnt_cnt, iva_cnt, covisit_cnt, exp_cnt, web_cnt, presn_p2p_cnt, approved_mail_cnt, bu_nm, bp_par_sk, bp_sk
			FROM jp2_int.regn_dst_terr_mr_dr_insn_actv_daily all_trgt
			LEFT JOIN jp2a_cdw.d_pset pset ON pset.pset_sk = all_trgt.prd_sk
			LEFT JOIN (
				SELECT DISTINCT regn_id, bu_nm
				FROM jp_rpt_v.v_rpt_sorg_flat_hiery_terr
				) fh ON fh.regn_id = all_trgt.regn_id
			)
	SELECT regn_id, regn_cd, regn_nm, dst_id, dst_cd, dst_nm, terr_id, terr_cd, terr_nm, mr_cd, mr_nm, dcf_dsf_cd, par_bp_cd, par_bp_nm, trgt_type, chnl_type, prd_shrt_ds, tier, cald_dt_sk, sem_nbr, 'Doctor' AS data_lvl, dr_id,dr_cd, dr_nm, trgt_flag, dr_segn, dual_mr_flag, trgt_cnt, actual_detail_cnt, appnt_cnt, iva_cnt, covisit_cnt, exp_cnt, web_cnt, presn_p2p_cnt, approved_mail_cnt, bp_par_sk, bp_sk
	FROM all_trgt
	WHERE 1 = (
			SELECT 1
			FROM jp_rpt_a.ref_rpt_prd_icln
			WHERE upper(rpt_tbl_nm) = UPPER('rpt_sorg_prd_dr_insn_all_atvy_dc')
				AND charindex('''' + upper(prd_shrt_ds) + '-' + all_trgt.pset_id + '''', upper(prd_list)) > 0
			)
	
	UNION ALL
	
	SELECT regn_id, regn_cd, regn_nm, dst_id, dst_cd, dst_nm, terr_id, terr_cd, terr_nm, mr_cd, mr_nm, NULL AS dcf_dsf_cd, NULL AS par_bp_cd, NULL AS par_bp_nm, trgt_type, NULL AS chnl_type, prd_shrt_ds, NULL AS tier, cald_dt_sk, sem_nbr, 'Territory' AS data_lvl, NULL AS dr_id, NULL AS dr_cd,NULL AS dr_nm, trgt_flag, NULL AS dr_segn, CAST(NULL AS INTEGER) AS dual_mr_flag, sum(trgt_cnt) AS trgt_cnt, sum(actual_detail_cnt) AS actual_detail_cnt, sum(appnt_cnt) AS appnt_cnt, sum(iva_cnt) AS iva_cnt, sum(covisit_cnt) AS covisit_cnt, sum(exp_cnt) AS exp_cnt, sum(web_cnt) AS web_cnt, sum(presn_p2p_cnt) AS presn_p2p_cnt, sum(approved_mail_cnt) AS approved_mail_cnt, NULL AS bp_par_sk, NULL AS bp_sk
	FROM all_trgt
	WHERE 1 = (
			SELECT 1
			FROM jp_rpt_a.ref_rpt_prd_icln
			WHERE UPPER(rpt_tbl_nm) = UPPER('rpt_sorg_prd_dr_insn_all_atvy_dc')
				AND charindex('''' + upper(prd_shrt_ds) + '-' + all_trgt.pset_id + '''', upper(prd_list)) > 0
			)
	GROUP BY regn_id, regn_cd, regn_nm, dst_id, dst_cd, dst_nm, terr_id, terr_cd, terr_nm, prd_shrt_ds, cald_dt_sk, sem_nbr, data_lvl, trgt_flag, mr_cd, mr_nm, trgt_type
	
	UNION ALL
	
	SELECT regn_id, regn_cd, regn_nm, dst_id, dst_cd, dst_nm, NULL AS terr_id, NULL AS terr_cd, NULL AS terr_nm, NULL AS mr_cd, NULL AS mr_nm, NULL AS dcf_dsf_cd, NULL AS par_bp_cd, NULL AS par_bp_nm, trgt_type, NULL AS chnl_type, prd_shrt_ds, NULL AS tier, cald_dt_sk, sem_nbr, 'District' AS data_lvl, NULL AS dr_id,NULL AS dr_cd, NULL AS dr_nm, trgt_flag, NULL AS dr_segn, cast(NULL AS INTEGER) AS dual_mr_flag, sum(trgt_cnt) AS trgt_cnt, sum(actual_detail_cnt) AS actual_detail_cnt, sum(appnt_cnt) AS appnt_cnt, sum(iva_cnt) AS iva_cnt, sum(covisit_cnt) AS covisit_cnt, sum(exp_cnt) AS exp_cnt, sum(web_cnt) AS web_cnt, sum(presn_p2p_cnt) AS presn_p2p_cnt, sum(approved_mail_cnt) AS approved_mail_cnt, NULL AS bp_par_sk, NULL AS bp_sk
	FROM all_trgt
	WHERE dual_mr_flag = 1
		AND 1 = (
			SELECT 1
			FROM jp_rpt_a.ref_rpt_prd_icln
			WHERE UPPER(rpt_tbl_nm) = UPPER('rpt_sorg_prd_dr_insn_all_atvy_dc')
				AND charindex('''' + upper(prd_shrt_ds) + '-' + all_trgt.pset_id + '''', upper(prd_list)) > 0
			)
	GROUP BY regn_id, regn_cd, regn_nm, dst_id, dst_cd, dst_nm, prd_shrt_ds, cald_dt_sk, sem_nbr, data_lvl, trgt_flag, trgt_type
	
	UNION ALL
	
	SELECT regn_id, regn_cd, regn_nm, NULL AS dst_id, NULL AS dst_cd, NULL AS dst_nm, NULL AS terr_id, NULL AS terr_cd, NULL AS terr_nm, NULL AS mr_cd, NULL AS mr_nm, NULL AS dcf_dsf_cd, NULL AS par_bp_cd, NULL AS par_bp_nm, trgt_type, NULL AS chnl_type, prd_shrt_ds, NULL AS tier, cald_dt_sk, sem_nbr, 'Region' AS data_lvl, NULL AS dr_id,NULL AS dr_cd, NULL AS dr_nm, trgt_flag, NULL AS dr_segn, cast(NULL AS INTEGER) AS dual_mr_flag, sum(trgt_cnt) AS trgt_cnt, sum(actual_detail_cnt) AS actual_detail_cnt, sum(appnt_cnt) AS appnt_cnt, sum(iva_cnt) AS iva_cnt, sum(covisit_cnt) AS covisit_cnt, sum(exp_cnt) AS exp_cnt, sum(web_cnt) AS web_cnt, sum(presn_p2p_cnt) AS presn_p2p_cnt, sum(approved_mail_cnt) AS approved_mail_cnt, NULL AS bp_par_sk, NULL AS bp_sk
	FROM all_trgt1
	WHERE dual_mr_flag = 1
		AND 1 = (
			SELECT 1
			FROM jp_rpt_a.ref_rpt_prd_icln
			WHERE UPPER(rpt_tbl_nm) = UPPER('rpt_sorg_prd_dr_insn_all_atvy_dc')
				AND charindex('''' + upper(prd_shrt_ds) + '-' + all_trgt1.pset_id + '''', upper(prd_list)) > 0
			)
	GROUP BY regn_id, regn_cd, regn_nm, prd_shrt_ds, cald_dt_sk, sem_nbr, data_lvl, trgt_flag, trgt_type
	);
--------------------------

insert into jp3a_cdw.RPT_INSN_DR_PRD_ALL_DAILY_ATVY
 SELECT  derived_table1.BP_PAR_SK				
,derived_table1.BP_SK					
,derived_table1.PSET_SK					
,derived_table1.CALD_DT_SK				
,derived_table1.INSN_CD		 			
,derived_table1.DR_CD				
,derived_table1.INSN_NM					
,derived_table1.DR_NM					
,derived_table1.PGRP_NM				
,derived_table1.ACTL_DTL_DAILY_CT		
,derived_table1.APNTT_DTL_DAILY_CT			
,derived_table1.APV_EMAIL_SENT_DAILY_CT 
,derived_table1.CO_VIST_DTL_DAILY_CT    
,derived_table1.EXPL_MTG_DTL_DAILY_CT   
,derived_table1.IVA_DTL_DALY_CT         
,derived_table1.P2P_DAILY_CT            
,derived_table1.WEB_SEMINAR_DAILY_CT    
,$cycl_time_id$ as CYCL_TIME_ID			
,$scen_id$ as SCEN_ID					
,getdate() as INRT_TS					
,'jp_ops' as INRT_BY_NM				
,getdate() as MODF_TS					
,'jp_ops' as MODF_BY_NM	
   FROM ( SELECT distinct a.bp_par_sk, a.bp_sk,c.pset_sk,a.cald_dt_sk, a.insn_cd,a.insn_nm,a.dr_cd, a.dr_nm,c.prd_shrt_ds as pgrp_nm, sum(a.plan_dtl_cnt) AS plan_dtl_cnt, sum(a.actl_dtl_cnt) AS ACTL_DTL_DAILY_CT, sum(a.app_dtl_cnt) AS APNTT_DTL_DAILY_CT, sum(a.open_email_dtl_cnt) AS APV_EMAIL_SENT_DAILY_CT, sum(a.co_vst_dtl_cnt) AS CO_VIST_DTL_DAILY_CT,sum(a.expl_mtg_dtl_cnt) AS EXPL_MTG_DTL_DAILY_CT, sum(a.iva_ctl_cnt) AS IVA_DTL_DALY_CT,sum(a.pp_dtl_cnt) AS P2P_DAILY_CT, sum(a.web_semr_dtl_cnt) AS WEB_SEMINAR_DAILY_CT
   from(   
     SELECT distinct a.bp_par_sk,a.bms_cd as insn_cd, a.insn_nm, a.cald_dt_sk::integer AS cald_dt_sk, a.bp_sk, a.dr_cd,a.dr_nm, (a.plan_dtl_cnt) AS plan_dtl_cnt, (a.actl_dtl_cnt) AS actl_dtl_cnt, (a.app_dtl_cnt) AS app_dtl_cnt, (a.iva_dtl_cnt) AS iva_ctl_cnt, (a.co_vst_dtl_cnt) AS co_vst_dtl_cnt, (a.expl_mtg_dtl_cnt) AS expl_mtg_dtl_cnt, (a.web_semr_dtl_cnt) AS web_semr_dtl_cnt, (a.pp_dtl_cnt) AS pp_dtl_cnt, (a.open_email_dtl_cnt) AS open_email_dtl_cnt,prd_shrt_ds,data_lvl_ds,dual_terr_flag
           FROM jp2_int.rpt_sorg_prd_dr_insn_all_atvy_daily a) a 
      
   LEFT JOIN jp2a_cdw.d_pset c ON upper(a.prd_shrt_ds::text) = upper(c.prd_shrt_ds::text)
   
  WHERE upper(a.data_lvl_ds::text) = 'DOCTOR'::character varying::text and a.dual_terr_flag=1
  AND 1 = (
  SELECT 1
  FROM jp_rpt_a.ref_rpt_prd_icln
  WHERE upper(rpt_tbl_nm) = 'INSN_DR_PRD_ALL_ATVY' AND charindex('''' + c.pset_id + '''', upper(prd_list)) > 0
  )  
  GROUP BY a.bp_sk, a.insn_nm, c.pset_sk, a.cald_dt_sk::integer, a.bp_par_sk, a.dr_nm,a.insn_cd,c.prd_shrt_ds,a.dr_cd) derived_table1;

-----------------------------------


insert into jp_rpt_A.RPT_INSN_DR_PRD_ALL_DAILY_ATVY
select *,(select coalesce(max(snp_id),0)+1 snp_id from  jp_ops.cntl_rpt_snp 
  where lower(tbl_nm)='rpt_insn_dr_prd_all_daily_atvy' and actv_flag=1) AS snp_id  from jp3a_cdw.RPT_INSN_DR_PRD_ALL_DAILY_ATVY;
-----------------------------------



CREATE OR REPLACE VIEW jp_rpt_v.v_rpt_insn_dr_prd_all_daily_atvy
(
  bp_par_sk,
  bp_sk,
  pset_sk,
  cald_dt_sk,
  insn_cd,
  dr_cd,
  insn_nm,
  dr_nm,
  pgrp_nm,
  actl_dtl_daily_ct,
  apntt_dtl_daily_ct,
  apv_email_sent_daily_ct,
  co_vist_dtl_daily_ct,
  expl_mtg_dtl_daily_ct,
  iva_dtl_daly_ct,
  p2p_daily_ct,
  web_seminar_daily_ct,
  cycl_time_id,
  scen_id,
  inrt_ts,
  inrt_by_nm,
  modf_ts,
  modf_by_nm,
  snp_id,
  yv_onc2_disp_ind
)
AS 
 SELECT rpt_insn_dr_prd_all_daily_atvy.bp_par_sk, rpt_insn_dr_prd_all_daily_atvy.bp_sk, rpt_insn_dr_prd_all_daily_atvy.pset_sk, rpt_insn_dr_prd_all_daily_atvy.cald_dt_sk, rpt_insn_dr_prd_all_daily_atvy.insn_cd, rpt_insn_dr_prd_all_daily_atvy.dr_cd, rpt_insn_dr_prd_all_daily_atvy.insn_nm, rpt_insn_dr_prd_all_daily_atvy.dr_nm, rpt_insn_dr_prd_all_daily_atvy.pgrp_nm, rpt_insn_dr_prd_all_daily_atvy.actl_dtl_daily_ct, rpt_insn_dr_prd_all_daily_atvy.apntt_dtl_daily_ct, rpt_insn_dr_prd_all_daily_atvy.apv_email_sent_daily_ct, rpt_insn_dr_prd_all_daily_atvy.co_vist_dtl_daily_ct, rpt_insn_dr_prd_all_daily_atvy.expl_mtg_dtl_daily_ct, rpt_insn_dr_prd_all_daily_atvy.iva_dtl_daly_ct, rpt_insn_dr_prd_all_daily_atvy.p2p_daily_ct, rpt_insn_dr_prd_all_daily_atvy.web_seminar_daily_ct, rpt_insn_dr_prd_all_daily_atvy.cycl_time_id, rpt_insn_dr_prd_all_daily_atvy.scen_id, rpt_insn_dr_prd_all_daily_atvy.inrt_ts, rpt_insn_dr_prd_all_daily_atvy.inrt_by_nm, rpt_insn_dr_prd_all_daily_atvy.modf_ts, rpt_insn_dr_prd_all_daily_atvy.modf_by_nm, rpt_insn_dr_prd_all_daily_atvy.snp_id, 'Y' AS yv_onc2_disp_ind
   FROM jp_rpt_a.rpt_insn_dr_prd_all_daily_atvy
     WHERE rpt_insn_dr_prd_all_daily_atvy.snp_id = (( SELECT "max"(cntl_rpt_snp.snp_id) AS "max"
           FROM jp_ops.cntl_rpt_snp
          WHERE lower(cntl_rpt_snp.tbl_nm)::text = 'rpt_insn_dr_prd_all_daily_atvy'::character varying::text));