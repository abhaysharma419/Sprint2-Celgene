DELETE
FROM jp2a_cdw.ref_attr
WHERE attr_id = 445
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'POM';
DELETE
FROM jp2a_cdw.ref_attr
WHERE attr_id = 447
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'EM';
DELETE
FROM jp2a_cdw.ref_attr
WHERE attr_id = 448
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'IST';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 442
WHERE attr_id = 441
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'REV MM';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 445,
       attr_cd = 'HEMA LYM',
       attr_desc = 'HEMA LYM',
       attr_nm = 'HEMA LYM'
WHERE attr_id = 442
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'REV FL';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 448,
       attr_cd = 'HEMA MDS',
       attr_desc = 'HEMA MDS',
       attr_nm = 'HEMA MDS'
WHERE attr_id = 443
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'REV MDS';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 450,
       attr_cd = 'HEMA ATL',
       attr_desc = 'HEMA ATL',
       attr_nm = 'HEMA ATL'
WHERE attr_id = 444
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'REV ATL';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 452,
       attr_cd = 'HEMA CML',
       attr_desc = 'HEMA CML',
       attr_nm = 'HEMA CML'
WHERE attr_id = 446
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'SP';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 454,
       attr_cd = 'HEMA HL',
       attr_desc = 'HEMA HL',
       attr_nm = 'HEMA HL'
WHERE attr_id = 449
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'IO HL';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 455
WHERE attr_id = 450
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'OP HL';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 456
WHERE attr_id = 451
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'LDX';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 457
WHERE attr_id = 452
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'HD';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 458
WHERE attr_id = 453
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'MX';
UPDATE jp2a_cdw.ref_attr
   SET attr_id = 459
WHERE attr_id = 454
AND   attr_typ = 'Product Rank'
AND   attr_cd = 'VP';
INSERT INTO jp2a_cdw.ref_attr
(
  attr_id,
  attr_typ,
  attr_cd,
  attr_desc,
  attr_nm,
  prnt_attr_id,
  src_eff_dt,
  src_end_dt,
  cycl_time_id,
  scen_id,
  inrt_dt,
  inrt_by,
  modf_dt,
  modf_by
)
VALUES
(
  441,
  'Product Rank',
  'HEMA MM',
  'HEMA MM',
  'HEMA MM',
  NULL,
  NULL,
  NULL,
  22015100,
  1,
  TIMESTAMP '2016-09-28 23:45:42',
  'bms_ops',
  TIMESTAMP '2016-09-28 23:45:42',
  'bms_ops'
);
INSERT INTO jp2a_cdw.ref_attr
(
  attr_id,
  attr_typ,
  attr_cd,
  attr_desc,
  attr_nm,
  prnt_attr_id,
  src_eff_dt,
  src_end_dt,
  cycl_time_id,
  scen_id,
  inrt_dt,
  inrt_by,
  modf_dt,
  modf_by
)
VALUES
(
  443,
  'Product Rank',
  'POM',
  'POM',
  'POM',
  NULL,
  NULL,
  NULL,
  22015100,
  1,
  TIMESTAMP '2016-09-28 23:45:42',
  'bms_ops',
  TIMESTAMP '2016-09-28 23:45:42',
  'bms_ops'
);
INSERT INTO jp2a_cdw.ref_attr
(
  attr_id,
  attr_typ,
  attr_cd,
  attr_desc,
  attr_nm,
  prnt_attr_id,
  src_eff_dt,
  src_end_dt,
  cycl_time_id,
  scen_id,
  inrt_dt,
  inrt_by,
  modf_dt,
  modf_by
)
VALUES
(
  444,
  'Product Rank',
  'EM',
  'EM',
  'EM',
  NULL,
  NULL,
  NULL,
  22015100,
  1,
  TIMESTAMP '2016-09-28 23:45:42',
  'bms_ops',
  TIMESTAMP '2016-09-28 23:45:42',
  'bms_ops'
);
INSERT INTO jp2a_cdw.ref_attr
(
  attr_id,
  attr_typ,
  attr_cd,
  attr_desc,
  attr_nm,
  prnt_attr_id,
  src_eff_dt,
  src_end_dt,
  cycl_time_id,
  scen_id,
  inrt_dt,
  inrt_by,
  modf_dt,
  modf_by
)
VALUES
(
  446,
  'Product Rank',
  'REV FL',
  'REV FL',
  'REV FL',
  NULL,
  NULL,
  NULL,
  22015100,
  1,
  TIMESTAMP '2019-01-15 12:11:01',
  'bms_ops',
  TIMESTAMP '2019-01-15 12:11:01',
  'bms_ops'
);
INSERT INTO jp2a_cdw.ref_attr
(
  attr_id,
  attr_typ,
  attr_cd,
  attr_desc,
  attr_nm,
  prnt_attr_id,
  src_eff_dt,
  src_end_dt,
  cycl_time_id,
  scen_id,
  inrt_dt,
  inrt_by,
  modf_dt,
  modf_by
)
VALUES
(
  447,
  'Product Rank',
  'IST',
  'IST',
  'IST',
  NULL,
  NULL,
  NULL,
  22015100,
  1,
  TIMESTAMP '2019-01-15 12:11:01',
  'bms_ops',
  TIMESTAMP '2019-01-15 12:11:01',
  'bms_ops'
);
INSERT INTO jp2a_cdw.ref_attr
(
  attr_id,
  attr_typ,
  attr_cd,
  attr_desc,
  attr_nm,
  prnt_attr_id,
  src_eff_dt,
  src_end_dt,
  cycl_time_id,
  scen_id,
  inrt_dt,
  inrt_by,
  modf_dt,
  modf_by
)
VALUES
(
  449,
  'Product Rank',
  'REV MDS',
  'REV MDS',
  'REV MDS',
  NULL,
  NULL,
  NULL,
  22015100,
  1,
  TIMESTAMP '2019-01-15 12:11:01',
  'bms_ops',
  TIMESTAMP '2019-01-15 12:11:01',
  'bms_ops'
);
INSERT INTO jp2a_cdw.ref_attr
(
  attr_id,
  attr_typ,
  attr_cd,
  attr_desc,
  attr_nm,
  prnt_attr_id,
  src_eff_dt,
  src_end_dt,
  cycl_time_id,
  scen_id,
  inrt_dt,
  inrt_by,
  modf_dt,
  modf_by
)
VALUES
(
  451,
  'Product Rank',
  'REV ATL',
  'REV ATL',
  'REV ATL',
  NULL,
  NULL,
  NULL,
  22015100,
  1,
  TIMESTAMP '2015-11-26 12:45:52',
  'bms_ops',
  TIMESTAMP '2015-11-26 12:45:52',
  'bms_ops'
);
INSERT INTO jp2a_cdw.ref_attr
(
  attr_id,
  attr_typ,
  attr_cd,
  attr_desc,
  attr_nm,
  prnt_attr_id,
  src_eff_dt,
  src_end_dt,
  cycl_time_id,
  scen_id,
  inrt_dt,
  inrt_by,
  modf_dt,
  modf_by
)
VALUES
(
  453,
  'Product Rank',
  'SP',
  'SP',
  'SP',
  NULL,
  NULL,
  NULL,
  22015100,
  1,
  TIMESTAMP '2015-11-26 12:45:52',
  'bms_ops',
  TIMESTAMP '2015-11-26 12:45:52',
  'bms_ops'
);


UPDATE jp2a_cdw.ref_attr
   SET attr_cd = 'TOTAL (HEMA)',
       attr_desc = 'TOTAL (HEMA)',
       attr_nm = 'TOTAL (HEMA)'
WHERE attr_id = 10023
AND   attr_typ = 'Product Rank';
