Insert into jp3a_cdw.dg_insn_bp_prd_seg   
Select distinct seg.par_bp_sk as par_bp_sk , seg.bp_sk,case when dp2.pset_sk is null then seg.pset_sk else dp2.pset_sk end as pset_Sk  , seg.segn_sk as segn_sk  ,
$cycl_time_id$ AS cycl_time_id, $scen_id$ AS scen_id,  getdate() AS inrt_dt,'$inrt_by$' AS inrt_by,  getdate() AS modf_dt,'$inrt_by$' AS modf_by from  jp2a_Cdw.xref_bp_segn seg 
left outer join  jp2_int.rpt_prd_rolup_atvy_temp rlup on seg.pset_sk=rlup.prd_brd_grp_sk
left outer join jp2a_cdw.d_pset dp  on (case when rlup.pset_sk is null then seg.pset_sk else rlup.pset_sk end )=dp.pset_sk 
left outer join jp_ops.m_pset_prd_grp  pg on dp.pset_id=pg.pset_id 
left outer join jp2a_cdw.d_pset dp2  on pg.prd_grp_id=dp2.pset_id 
where  subj_area_nm in ($subj_area_nm$);

Insert into jp3a_cdw.dg_insn_bp_prd_seg
select par_bp_sk,bp_sk,pset_Sk,segn_sk ,
$cycl_time_id$ AS cycl_time_id, $scen_id$ AS scen_id,  getdate() AS inrt_dt,'$inrt_by$' AS inrt_by,  getdate() AS modf_dt,'$inrt_by$' AS modf_by from (
select a.*,rank() over (partition by par_bp_sk,bp_sk,pset_sk 
order by prio.segn_prio ) as  rank from
(
Select distinct seg.par_bp_sk as par_bp_sk , seg.bp_sk,case when dp2.pset_sk is null then seg.pset_sk else dp2.pset_sk end as pset_Sk  , seg.segn_sk
from  jp2a_Cdw.xref_bp_segn  seg 
left outer join  jp2_int.rpt_prd_rolup_atvy_temp rlup on seg.pset_sk=rlup.prd_brd_grp_sk
left outer join jp2a_cdw.d_pset dp  on (case when rlup.pset_sk is null then seg.pset_sk else rlup.pset_sk end )=dp.pset_sk 
left outer join jp_ops.m_pset_prd_grp  pg on dp.pset_id=pg.pset_id 
left outer join jp2a_cdw.d_pset dp2  on pg.prd_grp_id=dp2.pset_id 
where  pg.subj_area_nm in ($subj_area_nm$) and dp2.pset_sk not in (319))a
left outer join jp2a_Cdw.d_segn dsegn on dsegn.segn_sk = a.segn_sk
left outer join  jp_ops.trgt_dr_seg_tier_prio_config prio on dsegn.segn_ds = prio.segn_ds and prio.subj_area_nm = 'doctor_segment'
 ) where rank=1

union all 
select par_bp_sk,bp_sk,pset_sk,segn_sk,
$cycl_time_id$ AS cycl_time_id, $scen_id$ AS scen_id,  getdate() AS inrt_dt,'$inrt_by$' AS inrt_by,  getdate() AS modf_dt,'$inrt_by$' AS modf_by from (
Select distinct seg.par_bp_sk as par_bp_sk , seg.bp_sk,case when dp2.pset_sk is null then seg.pset_sk else dp2.pset_sk end as pset_Sk  , seg.segn_sk as segn_sk 
from  jp2a_Cdw.xref_bp_segn seg 
left outer join  jp2_int.rpt_prd_rolup_atvy_temp rlup on seg.pset_sk=rlup.prd_brd_grp_sk
left outer join jp2a_cdw.d_pset dp  on (case when rlup.pset_sk is null then seg.pset_sk else rlup.pset_sk end )=dp.pset_sk 
left outer join jp_ops.m_pset_prd_grp  pg on dp.pset_id=pg.pset_id 
left outer join jp2a_cdw.d_pset dp2  on pg.prd_grp_id=dp2.pset_id 
where  subj_area_nm in ($subj_area_nm$) and dp2.pset_sk in (319));



select s.pset_sk, p.prd_shrt_ds, count(*) from jp3a_cdw.dg_insn_bp_prd_seg s
join jp2a_cdw.d_pset p on p.pset_sk = s.pset_sk
group by 1, 2;



INSERT INTO cdwapacprod.jp_ops.m_pset_prd_grp (prd_grp_id
       , pset_id
       , prd_grp_nm
       , prd_shrt_ds
       , prd_ds
       , subj_area_nm
       , prd_grp_flag
       , cycl_time_id
       , scen_id
       , inrt_dt
       , inrt_by
       , modf_dt
       , modf_by
) VALUES ('2012087','2000181','IO MELA','YV','YERVOY','doctor_segment',1,320201101,1,getdate(),'bms_ops',getdate(),'bms_ops'),
('2012087','52324719','IO MELA','OP MELA','OPDIVO MELANOMA','doctor_segment',1,320201101,1,getdate(),'bms_ops',getdate(),'bms_ops');




SELECT Products_vod__c FROM Product_Metrics_vod__c WHERE Location_Child_vod__c IN ('0016F00003N5noxQAB','0016F00003N5FemQAF','0016F00003N3yHyQAJ') and Location_Parent_vod__c IN ('0016F00003N4PDQQA3','0016F00003LybTnQAJ','0016F00003LyCDcQAN')

select * from jp2a_cdw.xref_bp_segn where par_bp_sk IN (123956,435836,650393) and bp_sk IN (546071,273389,422561) ;

select * from jp1a_stg.stg_veeva_prd_mtrc_vod__c where locn_chld_vod__c IN ('0016F00003N5noxQAB','0016F00003N5FemQAF','0016F00003N3yHyQAJ') and locn_par_vod__c IN ('0016F00003N4PDQQA3','0016F00003LybTnQAJ','0016F00003LyCDcQAN'); 


SELECT Location_Child_vod__c,Location_Parent_vod__c  FROM Product_Metrics_vod__c WHERE Products_vod__c IN ('a002t000002rrWrAAI') 

minus

SELECT Location_Child_vod__c,Location_Parent_vod__c  FROM Product_Metrics_vod__c WHERE Products_vod__c IN ('a006F00003O9jGAQAZ') 