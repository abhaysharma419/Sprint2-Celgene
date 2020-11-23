-- HEMA HL
 update jp2a_cdw.xref_rpt_trgt_dr
 set pset_sk =3433
 where pset_sk  = 2696 and strt_cald_dt_sk <= 20200901;

 -- HEMA ATL
 insert into  jp_sandbox_ops.xref_rpt_trgt_dr_hist
SELECT sorg_sk
       , 3435 as pset_sk
       , sls_wrkr_sk
       , strt_cald_dt_sk
       , bp_sk
       , bp_par_sk
       , dr_seg_sk
       , plan_dtl_ct
       , segn_sk
       , cycl_time_id
       , scen_id
       , inrt_dt
       , inrt_by
       , modf_dt
       , modf_by
 FROM cdwapacprod.jp2a_cdw.xref_rpt_trgt_dr where strt_cald_dt_sk <= 20200901 and pset_sk = 3227;
 
  -- HEMA MDS
  insert into  jp_sandbox_ops.xref_rpt_trgt_dr_hist
SELECT sorg_sk
       , 3430 as pset_sk
       , sls_wrkr_sk
       , strt_cald_dt_sk
       , bp_sk
       , bp_par_sk
       , dr_seg_sk
       , plan_dtl_ct
       , segn_sk
       , cycl_time_id
       , scen_id
       , inrt_dt
       , inrt_by
       , modf_dt
       , modf_by
 FROM cdwapacprod.jp2a_cdw.xref_rpt_trgt_dr where strt_cald_dt_sk <= 20200901 and pset_sk = 3079;
 
 -- HEMA CML
  insert into  jp_sandbox_ops.xref_rpt_trgt_dr_hist
SELECT sorg_sk
       , 3434 as pset_sk
       , sls_wrkr_sk
       , strt_cald_dt_sk
       , bp_sk
       , bp_par_sk
       , dr_seg_sk
       , plan_dtl_ct
       , segn_sk
       , cycl_time_id
       , scen_id
       , inrt_dt
       , inrt_by
       , modf_dt
       , modf_by
 FROM cdwapacprod.jp2a_cdw.xref_rpt_trgt_dr where strt_cald_dt_sk <= 20200901 and pset_sk = 804;
 
   insert into  jp_sandbox_ops.xref_rpt_trgt_dr_hist
SELECT sorg_sk
       , 3431 as pset_sk
       , sls_wrkr_sk
       , strt_cald_dt_sk
       , bp_sk
       , bp_par_sk
       , dr_seg_sk
       , plan_dtl_ct
       , segn_sk
       , cycl_time_id
       , scen_id
       , inrt_dt
       , inrt_by
       , modf_dt
       , modf_by
 FROM cdwapacprod.jp2a_cdw.xref_rpt_trgt_dr where strt_cald_dt_sk <= 20200901 and pset_sk = 1798;
 
 insert into jp2a_cdw.xref_rpt_trgt_dr

select * from jp_sandbox_ops.xref_rpt_trgt_dr_hist;


create table   jp_sandbox_ops.xref_rpt_trgt_dr_rev_mm_lym  as
select * from 
(
Select sorg_sk, case when prd_grp.pset_sk is null then s.pset_sk else prd_grp.pset_sk end as pset_sk, s.sls_wrkr_sk, s.strt_cald_dt_sk, 
s.bp_sk, s.bp_par_sk, seg.segn_sk as dr_seg_sk, max(plan_dtl_ct) as plan_dtl_ct , s.segn_sk, s.cycl_time_id, s.scen_id, s.inrt_dt, s.inrt_by, 
s.modf_dt, s.modf_by 
from jp2a_cdw.xref_rpt_trgt_dr s 
LEFT JOIN jp_rpt_v.v_d_pset prd1 
on s.pset_sk = prd1.pset_sk 
left join jp_ops.m_pset_prd_grp map 
on map.pset_id = prd1.pset_id 
left join jp_rpt_v.v_d_pset prd_grp 
on prd_grp.pset_id = map.prd_grp_id 
left outer join jp3a_cdw.dg_insn_bp_prd_seg seg 
on seg.bp_sk=s.bp_sk 
and seg.par_bp_sk=s.bp_par_sk 
and seg.pset_sk=prd_grp.pset_sk 
where map.subj_area_nm='target_doctor' and s.pset_sk in (1728,3080,1798,3076,3078)
group by 1,2,3,4,5,6,7,9,10,11,12,13,14,15)
where  strt_cald_dt_sk>=20200701 ;

delete from jp_sandbox_ops.xref_rpt_trgt_dr_rev_mm_lym where pset_sk in (1728,3080,1798,3076,3078);


insert into jp2a_cdw.xref_rpt_trgt_dr

select * from   jp_sandbox_ops.xref_rpt_trgt_dr_rev_mm_lym 