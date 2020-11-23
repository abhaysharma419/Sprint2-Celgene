Insert into jp3a_cdw.dg_insn_bp_prd_trgt
select *, $cycl_time_id$ AS cycl_time_id, $scen_id$ AS scen_id,  getdate() AS inrt_dt,'$inrt_by$' AS inrt_by,  getdate() AS modf_dt,'$inrt_by$' AS modf_by from 
(Select bp_par_sk,  bp_sk, pset_sk as pset_sk, strt_Cald_Dt_sk  , segn_sk ,dr_cd,insn_cd,src_trgt_cd,  src_trgt_type  from jp2a_cdw.xref_insn_dr_trgt a
union all 

select bp_par_sk,bp_sk,pset_sk,strt_Cald_Dt_sk,segn_sk,dr_cd,insn_cd,src_trgt_cd,src_trgt_type from (
select a.*, 
rank() over (partition by bp_par_sk,bp_sk,pset_sk ,src_trgt_cd,strt_Cald_dt_sk
order by  prio.segn_prio ) as  rank from (
Select distinct bp_par_sk, bp_sk,    case when dp2.pset_sk is null then a.pset_sk else dp2.pset_sk end as pset_sk , strt_Cald_Dt_sk , segn_sk ,dr_cd,insn_cd, src_trgt_cd, src_trgt_type   from jp2a_cdw.xref_insn_dr_trgt a 
left outer join jp2a_cdw.d_pset dp  on a.pset_sk=dp.pset_sk 
left outer join jp_ops.m_pset_prd_grp  pg on dp.pset_id=pg.pset_id 
left outer join jp2a_cdw.d_pset dp2  on pg.prd_grp_id=dp2.pset_id 
where  subj_area_nm in ('agreed_target_list'))
a
left outer join  jp_ops.trgt_dr_seg_tier_prio_config prio on a.src_trgt_cd = prio.segn_ds and prio.subj_area_nm  in ('insn_list','tier','doctor_segment')) where rank=1 

) ;