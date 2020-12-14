INSERT INTO jp2_int.ITMD_2_S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY
SELECT DISTINCT 
ALIGT.sorg_unit_sk 				AS SORG_UNIT_SK,
SMRY.BP_PAR_SK 					AS BP_PAR_SK,  
SMRY.BP_SK						AS BP_SK, 
SMRY.PSET_SK					AS PSET_SK,
SMRY.PRD_GRP_SK					AS PRD_GRP_SK, 
SMRY.mth_cald_dt_sk				AS mth_cald_dt_sk,
SMRY.STRT_CALD_DT_SK			AS STRT_CALD_DT_SK,
DSW_terr.bms_id					AS sls_wrkr_cd,
DSW_terr.lcl_wrkr_last_nm||'　'||DSW_terr.lcl_wrkr_frst_nm as  SLS_WRKR_NM,
aligt.terr_seq_num				AS  SLS_WRKR_DUAL_FLAG, 
BP.BP_CD 						AS INSN_CD ,
ULT.bp_extl_idnty_val_txt  		AS SRC_INSN_CD,
BP.BP_NM 						AS INSN_NM,
case when TRGT.TRGT_IND IN ('Co-Visit BMS','Co-Visit Co-Pro') THEN 'Co-Visit' ELSE TRGT.TRGT_IND END AS INSN_TRGT_TYPE_CD,
SEG.segn_cd 					AS INSN_TIER_CD,
BP.bp_sls_chnl_ds 				AS INSN_SLS_CHNL_CD, 
DR.bp_extl_idnty_val_txt 		AS SRC_DR_CD , 
DR.BP_NM 						AS DR_NM,
DR_SEG.SEGN_CD 					AS DR_SEG_CD,
CASE WHEN TRGTDR.bp_par_sk is not null then 1 else 0 end as TRGT_FLAG, 
DP.PRD_SHRT_DS 					AS PRD_SHRT_DS,
dp2.prd_shrt_ds					AS PRD_GRP_NM,
aligt.bu_cd	 					AS bus_unit_cd,	
null 							AS bus_unit_nm,	
aligt.regn_cd					AS regn_cd,  
null 							AS REGN_NM, 
aligt.DST_CD					AS DST_CD, 
null 			 				AS dst_nm, 
aligt.terr_cd 					AS terr_cd, 
null 							AS terr_nm,
aligt.bu_lcl_nm	 				AS bus_unit_lcl_nm,				
aligt.regn_lcl_nm				AS REGN_lcl_NM,  
aligt.dst_lcl_nm				AS dst_lcl_nm, 
aligt.terr_lcl_nm				AS terr_lcl_nm, 
SMRY.qstn_txt					AS qstn_txt,
/*Fix applied in order number to fix the random behviour at frontend level. Observed during Integartion Batch -2 UAT --2020-12-14*/
case when smry.pset_sk=796 and smry.ord_num=5 then 10 else SMRY.ord_num end 	AS ord_num,
SMRY.mtrc_nm					AS mtrc_nm,
SMRY.mtrc_lcl_lang_nm			AS mtrc_lcl_lang_nm,
SMRY.last_modf_ts				AS last_modf_ts,
SMRY.pat_ct 					AS TOTL_PAT_NUM
FROM jp2_int.ITMD_1_S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY SMRY
INNER JOIN  jp2_int.itmd_3_s_sorg_sls_wrkr_bp_prd_time_bckt_srvy aligt on smry.bp_par_sk=aligt.bp_sk and smry.pset_sk=aligt.pset_Sk  
-- AND terr_seq_num = 1  -- Filter for one of the territory 
/* This is to get the institution related information */
LEFT OUTER JOIN (
SELECT BP_SK, BP_NM, BP_CD, bp_sls_chnl_ds FROM JP2A_CDW.D_BP  WHERE BP_TYPE_NM = 'ORGANIZATION' ) BP ON SMRY.BP_PAR_SK=BP.BP_SK
left JOIN jp2a_cdw.d_bp_extl_idnty ULT ON BP.BP_SK=ULT.BP_SK and bp_extl_idnty_type_nm='ULTMARC ID'
/* This is check if Targetted doctor  */
lEFT OUTER JOIN JP2A_CDW.xref_rpt_trgt_dr TRGTDR ON SMRY.bp_par_sk=TRGTDR.bp_par_sk  AND SMRY.bp_sk=TRGTDR.bp_sk AND SMRY.pset_sk=TRGTDR.PSET_SK  AND TRGTDR.STRT_CALD_DT_SK IN ( SELECT max_strt_dt_cald_sk FROM JP_OPS.cntl_refh_max_cycl_plan)
/*This is to get the target institution type and its display name*/
LEFT OUTER JOIN (Select distinct bp_sk, pset_sk,src_trgt_cd as  trgt_ind  from jp3a_cdw.dg_insn_prd_trgt where src_trgt_cd is not null  ) TRGT ON smry.bp_par_sk=TRGT.BP_SK AND smry.pset_sk=TRGT.PSET_SK 
--LEFT OUTER JOIN jp_ops.m_co_pro_flag DRTIT ON TRGT.TRGT_IND =DRTIT.trgt_flag  
/*This is to get the target tier type and its display name*/
LEFT OUTER JOIN jp3a_cdw.dg_insn_prd_trgt_tier bpt on smry.bp_par_sk=bpt.bp_sk and smry.pset_Sk=bpt.pset_sk  and bpt.src_trgt_type_ds='TIER' 
and (TO_CHAR(bpt.src_strt_dt,'YYYYMMDD')::int) <= ( SELECT max_strt_dt_cald_sk FROM JP_OPS.cntl_refh_max_cycl_plan) and  (TO_CHAR(bpt.src_end_dt,'YYYYMMDD')::int) > ( SELECT max_strt_dt_cald_sk FROM JP_OPS.cntl_refh_max_cycl_plan)
LEFT OUTER JOIN JP2A_CDW.d_segn SEG ON SEG.segn_sk=BPT.SEGN_SK  AND SEG.SEGN_TYPE_dS='TIER'
 /* This is to get the Doctor related information */
LEFT OUTER JOIN ( SELECT distinct  a.bp_sk,a.bp_nm ,  r.bp_extl_idnty_id, r.bp_extl_idnty_val_txt FROM   jp2a_cdw.d_bp a
inner join jp2a_cdw.d_bp_extl_idnty r on  a.bp_sk= r.bp_sk WHERE  a.bp_type_cd = 'INDV' and  bp_extl_idnty_type_nm='ULTMARC ID' ) DR ON DR.BP_SK=SMRY.BP_SK 
/* This is to get the doctor segment code*/
lEFT OUTER JOIN ( SELECT pset_sk, bp_sk, par_bp_sk as bp_par_Sk, segn_cd from jp3a_Cdw.dg_insn_bp_prd_seg seg
LEFT OUTER JOIN JP2A_CDW.d_segn DSEG ON SEG.SEGN_SK=DSEG.SEGN_SK AND SEGN_TYPE_DS='Doctor Rating') DR_SEG ON DR_SEG.BP_PAR_SK=SMRY.BP_PAR_SK AND DR_SEG.BP_SK=SMRY.BP_SK AND DR_SEG.PSET_sK=SMRY.PSET_sK
LEFT OUTER JOIN JP2A_CDW.D_PSET DP ON DP.PSET_SK = SMRY.PSET_SK 
LEFT OUTER JOIN JP2A_CDW.D_PSET DP2 ON DP2.PSET_SK = SMRY.PRD_GRP_SK 
/* This is to get the sales worker related attribute information */
LEFT OUTER JOIN JP2A_CDW.d_sls_wrkr DSW_terr ON DSW_terr.SLS_WRKR_SK=aligt.SRC_SORG_SLS_WRKR_SK;
