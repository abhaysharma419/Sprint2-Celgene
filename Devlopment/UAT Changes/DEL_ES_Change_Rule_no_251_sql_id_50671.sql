--SQL_ID: 50671

INSERT INTO jp3a_cdw.f_end_user_txn_actl_sls
SELECT a.rec_gnrn_ts, a.seql_id, a.data_rec_catg_nm, a.whslr_sk, a.whslr_orgzn_sk, a.cald_dt_sk, CASE 
		WHEN e.bp_par_sk IS NULL
			OR e.bp_par_sk = - 1
			THEN a.bp_sk
		ELSE e.bp_par_sk
		END AS bp_par_sk, a.bp_sk, f.bp_cd AS chld_bms_cd, g.bp_extl_idnty_val_txt AS chld_dcf_cd, substring(g.bp_extl_idnty_val_txt, 3, 10) AS chld_dcf_cd_shrt, f.
	bp_nm AS chld_insn_nm, h.abbr_insn_kana_nm AS chld_insn_kana_nm, h.insn_nm AS chld_ofcl_insn_nm, h.insn_nm_kana AS chld_ofcl_insn_kana_nm, i.geo_unit_sk AS 
	chld_geo_unit_sk, i.post_box_num AS chld_post_num, i.addr_ln_1_txt AS chld_addr, i.addr_ln_2_txt AS chld_addr_kana, i.bpa_offc_phn_num_txt AS chld_phn_num, i.
	bpa_fax_num_txt AS chld_fax_num, insn.byotai_cd AS chld_byotai_cd, insn.byotai_nm AS chld_byotai_nm, insn.hanro_nm AS chld_hanro_cd, insn.hanro_df AS 
	chld_hanro_nm, insn.catg_ds AS chld_catg_cd, insn.catg_cd AS chld_catg_ds, a.pset_sk, a.prd_cd, a.dcf_dsf_insn_cd, a.insn_cd, a.src_insn_nm, a.INSN_OFCL_NM, a.
	PRFCTR_CITY_CD, a.addr, a.whslr_orgzn_lvl_4_nm, a.par_insn_cd, a.par_insn_nm, a.trgt_flag, 
	case when a.trgt_nm in ('BMS Target', 'BMS Solo') then 'BMKK SOLO'
	 when a.trgt_nm in ('Co-Pro', 'Co-Pro Solo') then 'CO-PRO PARTNER SOLO'
	 when a.trgt_nm in ('Co-Visit BMS', 'Co-visit', 'Co-Visit Co-Pro') then 'CO-VISIT' else a.trgt_nm end as trgt_nm
	, a.optl_item_nm, a.bu_cd, a.bu_nm, a.regn_cd, a.regn_nm, 
	a.dst_cd, a.dst_nm, a.terr_cd, a.terr_nm, CASE 
		WHEN a.dst_cd LIKE 'DM%'
			THEN '-'
		ELSE a.dst_ff_nm
		END AS dst_ff_nm, a.srep_cd, CASE 
		WHEN a.srep_nm IS NULL
			THEN '-'
		ELSE a.srep_nm
		END AS srep_nm, a.dual_mr_cd, a.dual_mr_nm, a.dual_terr_cd, a.dual_terr_nm, a.secdy_bu_cd, a.secdy_bu_nm, a.secdy_regn_cd, a.secdy_regn_nm, a.
	secdy_dst_cd, a.secdy_dst_nm, a.secdy_terr_cd, a.secdy_terr_nm, a.secdy_srep_cd, a.secdy_srep_nm, a.secdy_dual_mr_cd, a.secdy_dual_mr_nm, a.
	secdy_dual_terr_cd, a.secdy_dual_terr_nm, a.secdy_dst_ff_nm, a.recv_whslr_cust_cd, --Demand:DMND0013502
	a.recv_sls_amt, a.bill_num, cast(a.bill_issu_wstn_dt AS TIMESTAMP WITHOUT TIME ZONE) AS bill_issu_wstn_dt, a.data_crean_dt, a.end_user_skip_sls_txn_type_sk, 
	txn.txn_type, txn.txn_type_nm, a.nhi_pric_amt, a.src_sls_amt, --Demand:DMND0013004
	
	a.whslr_sls_amt, /* This column was changed from sls_amt(PIT Sales) to whslr_sls_amt(Dealer Price) -- Celgene Batch 2 Enhancements*/ 
	
	a.sls_qty, a.uprc_aftr_disc_amt, a.uprc_amt, a.uprc_bfor_disc_amt, a.whslr_pric_amt, a.yr_mth, CASE 
		WHEN d.cald_dt_sk IS NOT NULL
			THEN d.cald_dt_sk
		ELSE - 1
		END AS yr_mth_sk, n.flag AS trgt_type_flg, NULL::INTEGER AS brd_sk, tier.flag AS tier_flg, $CYCL_TIME_ID$, $SCEN_ID$, 'cdwjpetl01' AS inrt_by_nm, getdate() 
	inrt_ts, 'cdwjpetl01' AS modf_by_nm, getdate() modf_ts
FROM jp3a_cdw.rpt_end_user_actl_sls a
LEFT JOIN (
	SELECT DISTINCT pset_sk, prd_brd_grp_sk
	FROM jp2a_cdw.d_prd_hiery
	) ph ON a.pset_sk = ph.pset_sk
LEFT JOIN jp_rpt_v.v_d_txn_type txn ON a.end_user_skip_sls_txn_type_sk = txn.txn_type_sk
LEFT JOIN (
	SELECT v_d_cald_dt.cald_dt_mth_id, min(v_d_cald_dt.cald_dt_sk) AS cald_dt_sk
	FROM jp_rpt_v.v_d_cald_dt
	GROUP BY v_d_cald_dt.cald_dt_mth_id
	) d ON a.yr_mth::TEXT = d.cald_dt_mth_id::CHARACTER VARYING::TEXT
LEFT OUTER JOIN (
	SELECT DISTINCT bp_sk, bp_par_sk, pset_sk
	FROM jp2a_cdw.xref_bp_afln e
	WHERE actv_flag = 1
		AND upper(e.afln_type_ds::TEXT) = 'INSTITUTION TO PHARMACY'
	) e ON a.bp_sk = e.bp_sk
	AND e.pset_sk = ph.prd_brd_grp_sk
LEFT OUTER JOIN jp_rpt_v.v_d_bp f ON a.bp_sk = f.bp_sk
LEFT OUTER JOIN jp_rpt_v.v_d_bp_extl_idnty g ON a.bp_sk = g.bp_sk
	AND bp_extl_idnty_type_cd = 'ULT_ID'
LEFT OUTER JOIN jp_rpt_v.v_d_bp_ext h ON a.bp_sk = h.bp_sk
LEFT OUTER JOIN jp_rpt_v.v_d_bpa i ON a.bp_sk = i.bp_sk
LEFT JOIN jp_rpt_v.v_d_bp_insn insn ON insn.bp_sk = a.bp_sk
LEFT OUTER JOIN (
	SELECT DISTINCT bp_sk, prd_sk, flag
	FROM jp_rpt_v.v_xref_bp_prd_trgt_flag
	WHERE upper(src_trgt_type) = 'CO-PRO'
	) n ON nvl(e.bp_par_sk, a.bp_sk) = n.bp_sk
	AND n.prd_sk = ph.prd_brd_grp_sk
LEFT OUTER JOIN (
	SELECT DISTINCT bp_sk, prd_sk, flag
	FROM jp_rpt_v.v_xref_bp_prd_trgt_flag
	WHERE upper(src_trgt_type) = 'TIER'
	) tier ON nvl(e.bp_par_sk, a.bp_sk) = tier.bp_sk
	AND tier.prd_sk = ph.prd_brd_grp_sk;