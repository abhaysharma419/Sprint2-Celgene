INSERT INTO jp3a_cdw.dg_insn_prd_trgt

select distinct A.* from 
(
SELECT distinct
tgt.bp_sk, 
case when brd.pset_sk is null then tgt.pset_sk else brd.pset_sk end as pset_sk,
tgt.segn_sk,
tgt.trgt_cd as src_trgt_cd,
tgt.trgt_type_ds as src_trgt_type_ds,
tgt.cycl_time_id,
tgt.scen_id ,
tgt.inrt_ts,
tgt.inrt_by_nm,
tgt.modf_ts,
tgt.modf_by_nm
FROM  jp3a_cdw.xref_bp_trgt tgt
left outer join 
(
select  distinct d_pset.pset_sk, prd_brd_grp_sk
from jp2a_cdw.d_prd_hiery ,jp2a_cdw.d_pset
where
upper(mul_brd_grp_lvl1_id) = upper(pset_id) and upper(mul_brd_grp_lvl1_nm) in (select distinct prd_ds from jp2a_cdw.d_pset)
and jp2a_cdw.d_prd_hiery.prd_hiery_lvl = 'BRAND' and jp2a_cdw.d_prd_hiery.actv_flag=1
) brd
on tgt.pset_sk= brd.prd_brd_grp_sk 

union

SELECT distinct
tgt.bp_sk, 
tgt.pset_sk,
tgt.segn_sk,
tgt.trgt_cd as src_trgt_type_cd,
tgt.trgt_type_ds as src_trgt_type_ds,
tgt.cycl_time_id,
tgt.scen_id ,
tgt.inrt_ts,
tgt.inrt_by_nm,
tgt.modf_ts,
tgt.modf_by_nm
FROM  jp3a_cdw.xref_bp_trgt tgt 

union

select 
bp_sk, 
pset_sk,
segn_sk,
src_trgt_type_cd,
src_trgt_type_ds,
cycl_time_id,
scen_id ,
inrt_ts,
inrt_by_nm,
modf_ts,
modf_by_nm
from (
SELECT distinct
tgt.bp_sk, 
prd_grp.pset_sk,
tgt.segn_sk,
tgt.trgt_cd as src_trgt_type_cd,
tgt.trgt_type_ds as src_trgt_type_ds,
tgt.cycl_time_id,
tgt.scen_id ,
tgt.inrt_ts,
tgt.inrt_by_nm,
tgt.modf_ts,
tgt.modf_by_nm,
rank() over (partition by tgt.bp_sk,prd_grp.pset_sk ,tgt.trgt_type_ds
order by  prio.segn_prio ) as  rank

FROM  jp3a_cdw.xref_bp_trgt tgt
left outer join jp2a_Cdw.d_segn dsegn on dsegn.segn_sk = tgt.segn_sk
left outer join  jp_ops.trgt_dr_seg_tier_prio_config prio on dsegn.trgt_cd = prio.segn_ds and prio.subj_area_nm = 'insn_list'
INNER JOIN jp_rpt_v.v_d_pset prd1 on tgt.pset_sk = prd1.pset_sk 
LEFT OUTER JOIN jp_ops.m_pset_prd_grp map on map.pset_id = prd1.pset_id 
LEFT OUTER JOIN jp_rpt_v.v_d_pset prd_grp on prd_grp.pset_id = map.prd_grp_id
WHERE map.subj_area_nm='target_doctor') where rank=1
) A
left join jp2a_cdw.d_pset B on A.pset_sk=B.pset_sk
--left Join jp_ops.brd_ryoiki_map mp on mp.brd_id=B.pset_id
--where TRIM(mp.mtrc_type) in ('BRD_RYOIKI_MAP') and --mp.actv_flag=1


UNION ALL

select distinct
bpt.bp_sk, 
ph.pset_sk,
bpt.segn_sk,
bpt.trgt_cd as src_trgt_type_cd,
bpt.trgt_type_ds as src_trgt_type_ds,
bpt.cycl_time_id,
bpt.scen_id ,
bpt.inrt_ts,
bpt.inrt_by_nm,
bpt.modf_ts,
bpt.modf_by_nm
from 
(
SELECT
*
FROM  jp3a_cdw.xref_bp_trgt tgt
)bpt 
inner join jp2a_cdw.d_prd_hiery ph on ph.prd_brd_grp_sk=bpt.pset_sk and upper(ph.prd_hiery_lvl)='MARKET UNIT' and ph.actv_flag=1
inner join jp2a_cdw.d_pset p on ph.pset_sk=p.pset_sk and upper(p.prd_hiery_lvl)='MARKET UNIT'
;