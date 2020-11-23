CREATE TABLE jp_ops.trgt_dr_seg_tier_prio_config
(
	segn_id INTEGER ENCODE zstd,
	subj_area_nm VARCHAR(50) ENCODE zstd,
	segn_ds VARCHAR(50) ENCODE zstd,
	segn_prio INTEGER ENCODE zstd,
	inrt_dt DATE DEFAULT getdate() ENCODE zstd,
	inrt_by_nm VARCHAR(10) DEFAULT 'bms_ops'::character varying ENCODE zstd
)
DISTSTYLE EVEN
SORTKEY
(
	subj_area_nm
);


