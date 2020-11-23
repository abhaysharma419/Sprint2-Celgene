INSERT INTO apac_orch.cntl_rule_parm (rule_parm_id,rule_num,rule_nm,seq,parm_nm,parm_val,pre_chk_qry_id,qry_id,on_failr_chk_qry_id,job_list,actv_flag,inrt_by,inrt_dt,modf_by,modf_dt,cmt) 
VALUES
  (9300,1656,'Truncate  table',1,'$tbl_nm$','jp2_int.dr_insn_actv_all_ntrgt_daily',NULL,10000,NULL,NULL,1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9305,1656,'RPT_INSN_DR_PRD_ALL_DAILY_ATVY - Insert',6,'NULL','NULL',NULL,71021,NULL,'',1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9304,1656,'RPT_INSN_DR_PRD_ALL_DAILY_ATVY - Insert',5,'NULL','NULL',NULL,71020,NULL,NULL,1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9301,1656,'Truncate  table',2,'$tbl_nm$','jp2_int.regn_dst_terr_mr_dr_insn_actv_daily',NULL,10000,NULL,NULL,1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9302,1656,'Truncate  table',3,'$tbl_nm$','jp2_int.rpt_sorg_prd_dr_insn_all_atvy_daily',NULL,10000,NULL,NULL,1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9303,1656,'Truncate  table',4,'$tbl_nm$','jp3a_cdw.RPT_INSN_DR_PRD_ALL_DAILY_ATVY',NULL,10000,NULL,NULL,1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9306,1656,'RPT_INSN_DR_PRD_ALL_DAILY_ATVY - Insert',7,'NULL','NULL',NULL,71022,NULL,'',1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9307,1656,'RPT_INSN_DR_PRD_ALL_DAILY_ATVY - Insert',8,'NULL','NULL',NULL,71023,NULL,'',1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9308,1656,'RPT_INSN_DR_PRD_ALL_DAILY_ATVY - Insert',9,'NULL','NULL',NULL,71024,NULL,'',1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9309,1656,'RPT_INSN_DR_PRD_ALL_DAILY_ATVY - Insert',10,'$tbl_nm$','RPT_INSN_DR_PRD_ALL_DAILY_ATVY',NULL,10005,NULL,'',1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18',''),
  (9310,1656,'RPT_INSN_DR_PRD_ALL_DAILY_ATVY - Insert',10,'$inrt_by$','cdwjpetl01',NULL,10005,NULL,'',1,'cdwjpetl01',DATE '2020-09-18','cdwjpetl01',DATE '2020-09-18','');
