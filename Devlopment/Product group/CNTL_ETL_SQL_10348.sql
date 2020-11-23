Insert into jp3a_cdw.dg_insn_prd_trgt_tier
Select a.*, case when ((select refh_dt from jp_ops.cntl_refh) between bp_prd_trgt_strt_ts and  bp_prd_trgt_end_ts) then 1 else 0 end as actv_flag,
$cycl_time_id$ AS cycl_time_id, $scen_id$ AS scen_id,  getdate() AS inrt_dt,'$inrt_by$' AS inrt_by,  getdate() AS modf_dt,'$inrt_by$' AS modf_by 
 from 
(Select distinct bp_sk,  case when bp_eq_mlti_brd.pset_sk IS NOT NULL then bp_eq_mlti_brd.PSET_SK else a.pset_sk end as PSET_SK  , seg_sk as segn_sk, 
src_trgt_cd,src_trgt_type_ds as src_trgt_type_ds, bp_prd_trgt_strt_ts, 
bp_prd_trgt_end_ts from jp2a_Cdw.xref_bp_prd_trgt a
left outer join jp_ops.bp_eq_mlti_brd ON a.pset_sk=bp_eq_mlti_brd.prd_brd_grp_sk
union all 
select distinct bp_sk,pset_sk,segn_sk,src_trgt_cd,src_trgt_type_ds,bp_prd_trgt_strt_ts,bp_prd_trgt_end_ts from
(
select a.*,
rank() over (partition by bp_sk,pset_sk ,src_trgt_type_ds,bp_prd_trgt_strt_ts,bp_prd_trgt_end_ts
order by  prio.segn_prio ) as  rank  from
(
Select distinct bp_sk, case when dp2.pset_sk is null then tier.pset_sk   else dp2.pset_sk end as pset_sk , 
seg_sk as segn_sk, tier.src_trgt_cd,tier.src_trgt_type_ds as src_trgt_type_ds,  tier.bp_prd_trgt_strt_ts, 
tier.bp_prd_trgt_end_ts 
from jp2a_Cdw.xref_bp_prd_trgt tier
left outer join jp2a_cdw.d_pset dp  on tier.pset_sk=dp.pset_sk 
left outer join jp_ops.m_pset_prd_grp  pg on dp.pset_id=pg.pset_id 
left outer join jp2a_cdw.d_pset dp2  on pg.prd_grp_id=dp2.pset_id 
where  pg.subj_area_nm in ($subj_area_nm2$ )) a
left outer join  jp_ops.trgt_dr_seg_tier_prio_config prio on a.src_trgt_cd = prio.segn_ds and prio.subj_area_nm  in ('insn_list','tier'))
 where rank=1  )a  ;


