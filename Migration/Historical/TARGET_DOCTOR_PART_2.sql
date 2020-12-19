create table    jp_sandbox_ops.rpt_trgt_dr_temp_2_hist_hema_mm_3 as
select * from (
select sorg_sk,pset_sk,sls_wrkr_sk,strt_cald_dt_sk,bp_sk,bp_par_sk,dr_seg_sk,plan_dtl_ct,segn_sk, dsegn.cycl_time_id, dsegn.scen_id, dsegn.inrt_dt, dsegn.inrt_by, 
dsegn.modf_dt, dsegn.modf_by ,rank() over (partition by bp_par_sk,bp_sk,pset_sk ,strt_cald_dt_sk
order by prio.segn_prio ) as  rank  from 
(
Select sorg_sk, case when prd_grp.pset_sk is null then s.pset_sk else prd_grp.pset_sk end as pset_sk, s.sls_wrkr_sk, s.strt_cald_dt_sk, 
s.bp_sk, s.bp_par_sk,  s.dr_seg_sk as dr_seg_sk, max(plan_dtl_ct) as plan_dtl_ct , s.segn_sk, s.cycl_time_id, s.scen_id, s.inrt_dt, s.inrt_by, 
s.modf_dt, s.modf_by 
from jp_sandbox_ops.rpt_trgt_dr_temp_2_hist_hema_mm_2 s 
LEFT JOIN jp_rpt_v.v_d_pset prd1 
on s.pset_sk = prd1.pset_sk 
left join jp_ops.m_pset_prd_grp map 
on map.pset_id = prd1.pset_id 
left join jp_rpt_v.v_d_pset prd_grp 
on prd_grp.pset_id = map.prd_grp_id 
where map.subj_area_nm='target_doctor' and s.pset_sk in (1728,3080,1798) AND   S.strt_cald_dt_sk>=20200701
group by 1,2,3,4,5,6,7,9,10,11,12,13,14,15) dsegn
left outer join  jp_sandbox_ops.trgt_dr_seg_tier_prio_config_hist_abhay_1219 prio on dsegn.dr_seg_sk::INT = prio.segn_ds::INT and prio.subj_area_nm = 'doctor_segment_hist')
 WHERE   rank=1 ;
 
 
 create table    jp_sandbox_ops.rpt_trgt_dr_temp_2_hist_hema_lym_3 as
select * from (
select sorg_sk,pset_sk,sls_wrkr_sk,strt_cald_dt_sk,bp_sk,bp_par_sk,dr_seg_sk,plan_dtl_ct,segn_sk, dsegn.cycl_time_id, dsegn.scen_id, dsegn.inrt_dt, dsegn.inrt_by, 
dsegn.modf_dt, dsegn.modf_by ,rank() over (partition by bp_par_sk,bp_sk,pset_sk ,strt_cald_dt_sk
order by prio.segn_prio ) as  rank  from 
(
Select sorg_sk, case when prd_grp.pset_sk is null then s.pset_sk else prd_grp.pset_sk end as pset_sk, s.sls_wrkr_sk, s.strt_cald_dt_sk, 
s.bp_sk, s.bp_par_sk, s.dr_seg_sk as dr_seg_sk, max(plan_dtl_ct) as plan_dtl_ct , s.segn_sk, s.cycl_time_id, s.scen_id, s.inrt_dt, s.inrt_by, 
s.modf_dt, s.modf_by 
from jp_sandbox_ops.rpt_trgt_dr_temp_2_hist_hema_lym_2 s 
LEFT JOIN jp_rpt_v.v_d_pset prd1 
on s.pset_sk = prd1.pset_sk 
left join jp_ops.m_pset_prd_grp map 
on map.pset_id = prd1.pset_id 
left join jp_rpt_v.v_d_pset prd_grp 
on prd_grp.pset_id = map.prd_grp_id 
where map.subj_area_nm='target_doctor' and s.pset_sk in (3076,3078) AND   S.strt_cald_dt_sk>=20200701
group by 1,2,3,4,5,6,7,9,10,11,12,13,14,15) dsegn
left outer join  jp_sandbox_ops.trgt_dr_seg_tier_prio_config_hist_abhay_1219 prio on dsegn.dr_seg_sk::INT = prio.segn_ds::INT and prio.subj_area_nm = 'doctor_segment_hist')
 WHERE   rank=1 ;
 
 
 delete from jp_sandbox_ops.rpt_trgt_dr_temp_2_hist_hema_lym_3 where pset_sk in (3076,3078);
delete from jp_sandbox_ops.rpt_trgt_dr_temp_2_hist_hema_mm_3 where pset_sk in (1728,3080,1798);

 /*delete from jp2a_cdw.xref_rpt_trgt_dr where pset_sk in (3431,3429) AND strt_cald_dt_sk BETWEEN 20200701 AND 20201101; -- REPLACE WIITH CURRENT -1 MONTH */
alter table jp_sandbox_ops.rpt_trgt_dr_temp_2_hist_hema_lym_3 drop column rank;
alter table jp_sandbox_ops.rpt_trgt_dr_temp_2_hist_hema_mm_3 drop column rank;
