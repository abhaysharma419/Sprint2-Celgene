UPDATE apac_orch.cntl_rule_parm
   SET parm_nm = '$prd_stgy_nm$',
       parm_val = '''リアクティブ'',''RevMate教育'',''リモートディテール_メール'',''リモートディテール_郵送'''
WHERE rule_parm_id = 311
AND   rule_num = 531
AND   rule_nm = 'Rpt_sorg_prd_dr_insn_atvy - Insert'
AND   seq = 5;
