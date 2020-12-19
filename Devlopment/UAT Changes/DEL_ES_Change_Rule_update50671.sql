insert into jp3a_cdw.f_end_user_txn_actl_sls
select
a.rec_gnrn_ts, a.seql_id, a.data_rec_catg_nm, a.whslr_sk, a.whslr_orgzn_sk, a.cald_dt_sk, 
 case when e.bp_par_sk is null or e.bp_par_sk=-1 then a.bp_sk
else e.bp_par_sk end as bp_par_sk,
a.bp_sk, f.bp_cd as chld_bms_cd,g.bp_extl_idnty_val_txt as chld_dcf_cd,substring(g.bp_extl_idnty_val_txt,3,10) as chld_dcf_cd_shrt,f.bp_nm as chld_insn_nm, h.abbr_insn_kana_nm as chld_insn_kana_nm,
h.insn_nm as chld_ofcl_insn_nm,h.insn_nm_kana as chld_ofcl_insn_kana_nm,
i.geo_unit_sk as chld_geo_unit_sk,i.post_box_num as chld_post_num,i.addr_ln_1_txt AS chld_addr,
i.addr_ln_2_txt AS chld_addr_kana,i.bpa_offc_phn_num_txt as chld_phn_num,i.bpa_fax_num_txt as chld_fax_num,
insn.byotai_cd as chld_byotai_cd,
insn.byotai_nm as chld_byotai_nm,
insn.hanro_nm as chld_hanro_cd, 
insn.hanro_df as chld_hanro_nm, 
insn.catg_ds as chld_catg_cd,
insn.catg_cd as chld_catg_ds,
a.pset_sk, 
a.prd_cd, 
a.dcf_dsf_insn_cd, 
a.insn_cd,
a.src_insn_nm    ,
a.INSN_OFCL_NM,
a.PRFCTR_CITY_CD          ,
a.addr   ,
a.whslr_orgzn_lvl_4_nm                ,
a.par_insn_cd     ,
a.par_insn_nm   ,
a.trgt_flag,
case when a.trgt_nm in ('BMS Target', 'BMS Solo') then 'BMKK SOLO'
	 when a.trgt_nm in ('Co-Pro', 'Co-Pro Solo') then 'CO-PRO PARTNER SOLO'
	 when a.trgt_nm in ('Co-Visit BMS', 'Co-visit', 'Co-Visit Co-Pro') then 'CO-VISIT' else a.trgt_nm end as trgt_nm            ,
a.optl_item_nm, 
a.bu_cd,
a.bu_nm,
a.regn_cd ,
a.regn_nm,
a.dst_cd,
a.dst_nm,
a.terr_cd,
a.terr_nm,
case when a.dst_cd like 'DM%' then '-' else a.dst_ff_nm end as dst_ff_nm,
a.srep_cd,
case when a.srep_nm is null then '-' else  a.srep_nm end as srep_nm,
a.dual_mr_cd,
a.dual_mr_nm,
a.dual_terr_cd,
a.dual_terr_nm,
a.secdy_bu_cd,
a.secdy_bu_nm,
a.secdy_regn_cd,
a.secdy_regn_nm,
a.secdy_dst_cd,
a.secdy_dst_nm,
a.secdy_terr_cd,
a.secdy_terr_nm,
a.secdy_srep_cd,
a.secdy_srep_nm,
a.secdy_dual_mr_cd,
a.secdy_dual_mr_nm,
a.secdy_dual_terr_cd,
a.secdy_dual_terr_nm,
a.secdy_dst_ff_nm,
a.recv_whslr_cust_cd, --Demand:DMND0013502
a.recv_sls_amt,
                              a.bill_num
                              , cast(a.bill_issu_wstn_dt as TIMESTAMP WITHOUT TIME ZONE) as bill_issu_wstn_dt, a.data_crean_dt, a.end_user_skip_sls_txn_type_sk,txn.txn_type, 
txn.txn_type_nm, 
                              a.nhi_pric_amt,
							  a.src_sls_amt, --Demand:DMND0013004
							  a.sls_amt, a.sls_qty, a.uprc_aftr_disc_amt, a.uprc_amt, a.uprc_bfor_disc_amt, a.whslr_pric_amt, a.yr_mth, 
        CASE
            WHEN d.cald_dt_sk IS NOT NULL THEN d.cald_dt_sk
            ELSE -1
        END AS yr_mth_sk,n.flag as trgt_type_flg,null::integer as brd_sk, tier.flag as tier_flg,
$cycl_time_id$,
$scen_id$,
'cdwjpetl01' as inrt_by_nm,
getdate() inrt_ts,
'cdwjpetl01' as modf_by_nm,
getdate() modf_ts
from jp3a_cdw.rpt_end_user_actl_sls a
left join (select distinct pset_sk,prd_brd_grp_sk from jp2a_cdw.d_prd_hiery) ph on a.pset_sk=ph.pset_sk 
LEFT JOIN jp_rpt_v.v_d_txn_type txn ON a.end_user_skip_sls_txn_type_sk = txn.txn_type_sk
   LEFT JOIN ( SELECT v_d_cald_dt.cald_dt_mth_id, min(v_d_cald_dt.cald_dt_sk) AS cald_dt_sk
   FROM jp_rpt_v.v_d_cald_dt
  GROUP BY v_d_cald_dt.cald_dt_mth_id) d ON a.yr_mth::text = d.cald_dt_mth_id::character varying::text
left outer join (select distinct bp_sk,bp_par_sk,pset_sk from jp2a_cdw.xref_bp_afln e where actv_flag=1 and upper(e.afln_type_ds::text) = 'INSTITUTION TO PHARMACY') e on a.bp_sk=e.bp_sk and e.pset_sk=ph.prd_brd_grp_sk 
  left outer join jp_rpt_v.v_d_bp f on a.bp_sk=f.bp_sk 
  left outer join jp_rpt_v.v_d_bp_extl_idnty g on a.bp_sk=g.bp_sk and bp_extl_idnty_type_cd='ULT_ID'
left outer join jp_rpt_v.v_d_bp_ext h on a.bp_sk=h.bp_sk
  left outer join jp_rpt_v.v_d_bpa i on a.bp_sk=i.bp_sk 
  left join jp_rpt_v.v_d_bp_insn insn on insn.bp_sk = a.bp_sk
  left outer join (select distinct bp_sk,prd_sk,flag from jp_rpt_v.v_xref_bp_prd_trgt_flag where upper(src_trgt_type) = 'CO-PRO') n on nvl(e.bp_par_sk,a.bp_sk)=n.bp_sk and n.prd_sk = ph.prd_brd_grp_sk
  left outer join (select distinct bp_sk,prd_sk,flag from jp_rpt_v.v_xref_bp_prd_trgt_flag where upper(src_trgt_type) = 'TIER') tier on nvl(e.bp_par_sk,a.bp_sk)=tier.bp_sk and tier.prd_sk = ph.prd_brd_grp_sk;