CREATE TABLE jp_sandbox_ops.crm_test_123
(
   abt_dose_bms__c                          varchar(500),
   abt_dose_date_bms__c                     varchar(500),
   acpa_bms__c                              varchar(500),
   age_bms__c                               varchar(500),
   amount_of_delivery_dosage_bms__c         varchar(500),
   cdai_bms__c                              varchar(500),
   child_account_bms__c                     varchar(500),
   child_account_dcf_code_bms__c            varchar(500),
   child_account_furigana_bms__c            varchar(500),
   child_account_name_bms__c                varchar(500),
   combination_medicine_bms__c              varchar(500),
   comment_bms__c                           varchar(500),
   complications_bms__c                     varchar(500),
   createdbyid                              varchar(500),
   createddate                              varchar(500),
   crp_bms__c                               varchar(500),
   das28_crp_bms__c                         varchar(500),
   das28_esr_bms__c                         varchar(500),
   deletion_flag_bms__c                     varchar(500),
   diagnosis_bms__c                         varchar(500),
   disease_duration_bms__c                  varchar(500),
   dmards_bms__c                            varchar(500),
   effect_1st_bms__c                        varchar(500),
   effect_2nd_bms__c                        varchar(500),
   effect_3rd_bms__c                        varchar(500),
   effect_4th_bms__c                        varchar(500),
   esr_bms__c                               varchar(500),
   external_id_bms__c                       varchar(500),
   follow_up_date_bms__c                    varchar(500),
   gender_bms__c                            varchar(500),
   hcp_intention_bms__c                     varchar(500),
   high_risk_chromosome_abnormality_bms__c  varchar(500),
   histology_bms__c                         varchar(500),
   id                                       varchar(500),
   isdeleted                                varchar(500),
   islocked                                 varchar(500),
   lastmodifiedbyid                         varchar(500),
   lastmodifieddate                         varchar(500),
   legacy_case_trace_number_bms__c          varchar(500),
   mayedit                                  varchar(500),
   metastatic_site_bms__c                   varchar(500),
   mobile_id_vod__c                         varchar(500),
   msi_test_timing__c                       varchar(500),
   mtx_combined_use_bms__c                  varchar(500),
   mtx_dose_bms__c                          varchar(500),
   name                                     varchar(500),
   next_treatment_regimen_bms__c            varchar(500),
   parent_account_bmkk_code_bms__c          varchar(500),
   parent_account_dcf_code_bms__c           varchar(500),
   parent_account_furigana_bms__c           varchar(500),
   parent_account_name_bms__c               varchar(500),
   patient_condition_confirmed_bms__c       varchar(500),
   patient_confirmation_bms__c              varchar(500),
   pd_l1_status_bms__c                      varchar(500),
   period_1st_bms__c                        varchar(500),
   period_2nd_bms__c                        varchar(500),
   period_3rd_bms__c                        varchar(500),
   period_4th_bms__c                        varchar(500),
   plan_delivery_date_bms__c                varchar(500),
   pomalidomide_experience_bms__c           varchar(500),
   pomalidomide_susceptibility_bms__c       varchar(500),
   prescription_line_bms__c                 varchar(500),
   prescription_path_bms__c                 varchar(500),
   previous_treatment_regiment_bms__c       varchar(500),
   product_bms__c                           varchar(500),
   reason_of_treatment_change_bms__c        varchar(500),
   recordtypeid                             varchar(500),
   regimen_1st_bms__c                       varchar(500),
   regimen_2nd_bms__c                       varchar(500),
   regimen_3rd_bms__c                       varchar(500),
   regimen_4th_bms__c                       varchar(500),
   relapse_type_bms__c                      varchar(500),
   rf_bms__c                                varchar(500),
   sdai_bms__c                              varchar(500),
   security_confirmation_done_bms__c        varchar(500),
   sjc_bms__c                               varchar(500),
   stage_of_disease_bms__c                  varchar(500),
   steroid_bms__c                           varchar(500),
   subjective_symptom_bms__c                varchar(500),
   susceptibility_bms__c                    varchar(500),
   systemmodstamp                           varchar(500),
   therapeutic_area_bms__c                  varchar(500),
   tjc_bms__c                               varchar(500),
   treatment_end_date_bms__c                varchar(500),
   treatment_experience_bms__c              varchar(500),
   treatment_experience_product_bms__c      varchar(500),
   treatment_line_bms__c                    varchar(500),
   treatment_regimen_bms__c                 varchar(500)
   treatment_start_date_bms__c              varchar(500),
   treatment_termination_reason_bms__c      varchar(500),
   use_bio_bms__c                           varchar(500),
   vas_doctor_bms__c                        varchar(500),
   vas_patient_bms__c                       varchar(500),
   weight_bms__c                            varchar(500)
);


copy jp_sandbox_ops.crm_test_123

from 's3://bms-comm-test-apac/cdw/japan/020-stage/crm_11_11.csv'

iam_role 'arn:aws:iam::173806584386:role/IAM-ApacJpRedshiftBaseRole-6BXGX25569GX'

delimiter ',' REMOVEQUOTES IGNOREHEADER 1  ;
;   


CREATE TABLE jp_sandbox_ops.crm_test_234
(
   abt_dose_bms__c                          varchar(500),
   abt_dose_date_bms__c                     timestamp,
   acpa_bms__c                              varchar(500),
   age_bms__c                               varchar(500),
   amount_of_delivery_dosage_bms__c         varchar(500),
   cdai_bms__c                              numeric(27,9),
   child_account_bms__c                     varchar(500),
   child_account_dcf_code_bms__c            varchar(500),
   child_account_furigana_bms__c            varchar(500),
   child_account_name_bms__c                varchar(500),
   combination_medicine_bms__c              varchar(500),
   comment_bms__c                           varchar(500),
   complications_bms__c                     varchar(500),
   createdbyid                              varchar(500),
   createddate                              timestamp,
   crp_bms__c                               numeric(27,9),
   das28_crp_bms__c                         numeric(27,9),
   das28_esr_bms__c                         numeric(27,9),
   deletion_flag_bms__c                     varchar(500),
   diagnosis_bms__c                         varchar(500),
   disease_duration_bms__c                  numeric(27,9),
   dmards_bms__c                            varchar(500),
   effect_1st_bms__c                        varchar(500),
   effect_2nd_bms__c                        varchar(500),
   effect_3rd_bms__c                        varchar(500),
   effect_4th_bms__c                        varchar(500),
   esr_bms__c                               numeric(27,9),
   external_id_bms__c                       varchar(500),
   follow_up_date_bms__c                    timestamp,
   gender_bms__c                            varchar(500),
   hcp_intention_bms__c                     varchar(500),
   high_risk_chromosome_abnormality_bms__c  varchar(500),
   id                                       varchar(500),
   isdeleted                                varchar(500),
   islocked                                 varchar(500),
   lastmodifiedbyid                         varchar(500),
   lastmodifieddate                         timestamp,
   legacy_case_trace_number_bms__c          varchar(500),
   mayedit                                  varchar(500),
   mobile_id_vod__c                         varchar(500),
   msi_test_timing__c                       varchar(500),
   mtx_combined_use_bms__c                  varchar(500),
   mtx_dose_bms__c                          numeric(27,9),
   name                                     varchar(500),
   parent_account_bmkk_code_bms__c          varchar(500),
   parent_account_dcf_code_bms__c           varchar(500),
   parent_account_furigana_bms__c           varchar(500),
   parent_account_name_bms__c               varchar(500),
   patient_confirmation_bms__c              varchar(500),
   period_1st_bms__c                        varchar(500),
   period_2nd_bms__c                        varchar(500),
   period_3rd_bms__c                        varchar(500),
   period_4th_bms__c                        varchar(500),
   plan_delivery_date_bms__c                timestamp,
   pomalidomide_experience_bms__c           varchar(500),
   pomalidomide_susceptibility_bms__c       varchar(500),
   prescription_line_bms__c                 varchar(500),
   prescription_path_bms__c                 varchar(500),
   product_bms__c                           varchar(500),
   recordtypeid                             varchar(500),
   regimen_1st_bms__c                       varchar(500),
   regimen_2nd_bms__c                       varchar(500),
   regimen_3rd_bms__c                       varchar(500),
   regimen_4th_bms__c                       varchar(500),
   relapse_type_bms__c                      varchar(500),
   rf_bms__c                                varchar(500),
   sdai_bms__c                              numeric(27,9),
   sjc_bms__c                               numeric(27,9),
   stage_of_disease_bms__c                  varchar(500),
   steroid_bms__c                           numeric(27,9),
   susceptibility_bms__c                    varchar(500),
   systemmodstamp                           timestamp,
   tjc_bms__c                               numeric(27,9),
   treatment_end_date_bms__c                timestamp,
   treatment_experience_bms__c              varchar(500),
   treatment_experience_product_bms__c      varchar(500),
   treatment_line_bms__c                    varchar(500),
   treatment_start_date_bms__c              timestamp,
   treatment_termination_reason_bms__c      varchar(500),
   use_bio_bms__c                           varchar(500),
   vas_doctor_bms__c                        numeric(27,9),
   vas_patient_bms__c                       numeric(27,9),
   weight_bms__c                            numeric(27,9),
   histology_bms__c                         varchar(500),
   metastatic_site_bms__c                   varchar(500),
   next_treatment_regimen_bms__c            varchar(500),
   patient_condition_confirmed_bms__c       varchar(500),
   pd_l1_status_bms__c                      varchar(500),
   previous_treatment_regiment_bms__c       varchar(500),
   reason_of_treatment_change_bms__c        varchar(500),
   security_confirmation_done_bms__c        varchar(500),
   subjective_symptom_bms__c                varchar(500),
   therapeutic_area_bms__c                  varchar(500),
   treatment_regimen_bms__c                 varchar(500),
   ps_bms__c								varchar(500)
);

insert into  jp_sandbox_ops.crm_test_234
select abt_dose_bms__c
,abt_dose_date_bms__c::timestamp 
,acpa_bms__c
,age_bms__c
,amount_of_delivery_dosage_bms__c
,cdai_bms__c::numeric(27,9)
,child_account_bms__c
,child_account_dcf_code_bms__c
,child_account_furigana_bms__c
,child_account_name_bms__c
,combination_medicine_bms__c
,comment_bms__c
,complications_bms__c
,createdbyid
,createddate::timestamp
,crp_bms__c::numeric(27,9)
,das28_crp_bms__c::numeric(27,9)
,das28_esr_bms__c::numeric(27,9)
,deletion_flag_bms__c
,diagnosis_bms__c
,disease_duration_bms__c::numeric(27,9)
,dmards_bms__c
,effect_1st_bms__c
,effect_2nd_bms__c
,effect_3rd_bms__c
,effect_4th_bms__c
,esr_bms__c::numeric(27,9)
,external_id_bms__c
,follow_up_date_bms__c::timestamp
,gender_bms__c
,hcp_intention_bms__c
,high_risk_chromosome_abnormality_bms__c
,id
,isdeleted
,islocked
,lastmodifiedbyid
,lastmodifieddate::timestamp
,legacy_case_trace_number_bms__c
,mayedit
,mobile_id_vod__c
,msi_test_timing__c
,mtx_combined_use_bms__c
,mtx_dose_bms__c::numeric(27,9)
,name
,parent_account_bmkk_code_bms__c
,parent_account_dcf_code_bms__c   
,parent_account_furigana_bms__c   
,parent_account_name_bms__c       
,patient_confirmation_bms__c  
,period_1st_bms__c
,period_2nd_bms__c                        
,period_3rd_bms__c                        
,period_4th_bms__c                        
,plan_delivery_date_bms__c ::timestamp  
,pomalidomide_experience_bms__c          
,pomalidomide_susceptibility_bms__c      
,prescription_line_bms__c                
,prescription_path_bms__c                
,product_bms__c                          
,recordtypeid                            
,regimen_1st_bms__c                      
,regimen_2nd_bms__c                      
,regimen_3rd_bms__c                      
,regimen_4th_bms__c                      
,relapse_type_bms__c                     
,rf_bms__c                               
,sdai_bms__c::numeric(27,9)
,sjc_bms__c::numeric(27,9)
,stage_of_disease_bms__c
,steroid_bms__c::numeric(27,9)
,susceptibility_bms__c
,systemmodstamp::timestamp
,tjc_bms__c::numeric(27,9)
,treatment_end_date_bms__c::timestamp
,treatment_experience_bms__c              
,treatment_experience_product_bms__c      
,treatment_line_bms__c                    
,treatment_start_date_bms__c::timestamp   
,treatment_termination_reason_bms__c      
,use_bio_bms__c
,vas_doctor_bms__c::numeric(27,9)
,vas_patient_bms__c::numeric(27,9)
,weight_bms__c::numeric(27,9)
,histology_bms__c
,metastatic_site_bms__c
,next_treatment_regimen_bms__c
,patient_condition_confirmed_bms__c
,pd_l1_status_bms__c
,previous_treatment_regiment_bms__c
,reason_of_treatment_change_bms__c
,security_confirmation_done_bms__c
,subjective_symptom_bms__c
,therapeutic_area_bms__c
,treatment_regimen_bms__c
,ps_bms__c from jp_sandbox_ops.crm_test_123;


INSERT INTO  jp1a_stg.stg_veeva_pat_rx_fol_up_bms_jp__c  (abt_dose_bms__c,abt_dose_dt_bms__c,acpa_bms__c,age_bms__c,amt_of_devy_dsg_bms__c,cdai_bms__c,chld_acct_bms__c,chld_acct_dcf_cd_bms__c,chld_acct_furigana_bms__c,chld_acct_nm_bms__c,cmbn_medc_bms__c,cmt_bms__c,complications_bms__c,createdbyid,createddate,crp_bms__c,das28_crp_bms__c,das28_esr_bms__c,dltn_flag_bms__c,diags_bms__c,dis_dur_bms__c,dmards_bms__c,efct_1st_bms__c,efct_2nd_bms__c,efct_3rd_bms__c,efct_4th_bms__c,esr_bms__c,extl_id_bms__c,fol_up_dt_bms__c,gndr_bms__c,hcp_intention_bms__c,high_risk_chromosome_abnormality_bms__c,id,isdeleted,islocked,lastmodifiedbyid,lastmodifieddate,lgcy_case_trace_num_bms__c,mayedit,mobl_id_vod__c,msi_test_timing__c,mtx_cmb_use_bms__c,mtx_dose_bms__c,nm,par_acct_bmkk_cd_bms__c,par_acct_dcf_cd_bms__c,par_acct_furigana_bms__c,par_acct_nm_bms__c,pat_confirmation_bms__c,perd_1st_bms__c,perd_2nd_bms__c,perd_3rd_bms__c,perd_4th_bms__c,plan_devy_dt_bms__c,pomalidomide_expc_bms__c,pomalidomide_susceptibility_bms__c,rx_ln_bms__c,rx_path_bms__c,prd_bms__c,recordtypeid,regm_1st_bms__c,regm_2nd_bms__c,regm_3rd_bms__c,regm_4th_bms__c,relapse_type_bms__c,rf_bms__c,sdai_bms__c,sjc_bms__c,stg_of_dis_bms__c,steroid_bms__c,susceptibility_bms__c,systemmodstamp,tjc_bms__c,trtt_end_dt_bms__c,trtt_expc_bms__c,trtt_expc_prd_bms__c,trtt_ln_bms__c,trtt_strt_dt_bms__c,trtt_termn_reas_bms__c,use_bio_bms__c,vas_dr_bms__c,vas_pat_bms__c,wt_bms__c,histology_bms__c,metastatic_site_bms__c,next_treatment_regimen_bms__c,patient_condition_confirmed_bms__c,pd_l1_status_bms__c,previous_treatment_regiment_bms__c,reason_of_treatment_change_bms__c,security_confirmation_done_bms__c,subjective_symptom_bms__c,therapeutic_area_bms__c,treatment_regimen_bms__c) 
VALUES
  (NULL,NULL,NULL,NULL,NULL,NULL,'a1I2t000000260UEAQ','01509610','ﾅｶﾔﾏ ﾖｳｲﾁ','中山　洋一',NULL,NULL,NULL,'0052t000000QmPeAAK',TIMESTAMP '2020-10-23 02:31:37.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4X1y0000008rcgEAA','false','false','0052t000000QmPeAAK',TIMESTAMP '2020-10-23 02:31:37.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059009','36920101','005300741','ｷﾖｳﾄﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','京都大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'OPDIVO LUNG','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 02:31:37.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LC',NULL),
  (NULL,NULL,NULL,'50-59歳',NULL,NULL,'a1I6F00000h7KPPUA2','01284866','ｷｸｶﾜ ﾋﾛｱｷ','菊川　浩明',NULL,NULL,NULL,'0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:49:10.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-15 00:00:00.000','女性',NULL,NULL,'a4X1y0000008rZgEAI','false','false','0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:49:10.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058984','53920101','008400266','ｸﾏﾓﾄｲﾘﾖｳｾﾝﾀ- ﾄﾞﾂﾎﾟｳ','熊本医療センター　独法',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-13 00:00:00.000',NULL,NULL,'OP_3L+',NULL,'OPDIVO RCC','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 09:49:10.000',NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-12 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RCC',NULL),
  (NULL,NULL,NULL,'70-79歳',NULL,NULL,'a1I6F00000h7KPPUA2','01284866','ｷｸｶﾜ ﾋﾛｱｷ','菊川　浩明',NULL,NULL,NULL,'0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:52:20.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-12 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rZlEAI','false','false','0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:52:20.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058985','53920101','008400266','ｸﾏﾓﾄｲﾘﾖｳｾﾝﾀ- ﾄﾞﾂﾎﾟｳ','熊本医療センター　独法',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-02 00:00:00.000',NULL,NULL,'不明',NULL,'OPDIVO+YERVOY RCC','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 09:52:20.000',NULL,TIMESTAMP '2020-10-23 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RCC',NULL),
  (NULL,NULL,NULL,NULL,NULL,NULL,'a1I6F00000kUA8KUAW','90648632','ｲｼﾂﾞｶ ﾏｻﾋｺ','石塚　雅彦',NULL,NULL,NULL,'0056F00000CxlH7QAJ',TIMESTAMP '2020-10-20 02:36:07.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4X1y0000008rZHEAY','false','false','0056F00000CxlH7QAJ',TIMESTAMP '2020-10-20 02:36:07.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058979','62321401','033477097','ｱｲｹｱﾔﾂｷﾖｸｷﾀﾓﾄﾃﾝ','あいケア薬局北本店',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'OPDIVO H&N','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-20 02:36:07.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H&N',NULL),
  (NULL,NULL,NULL,'80歳以上',NULL,NULL,'a1I6F00000h79kwUAA','01419000','ｱﾝﾄﾞｳ ｹｲ','安藤　慶',NULL,NULL,NULL,'0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:06:38.000',NULL,NULL,NULL,'false','不明',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-26 00:00:00.000','男性',NULL,NULL,'a4X1y0000008raKEAQ','false','false','0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:06:38.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058992','56930201','008700657','ｻﾂﾅﾝﾋﾞﾖｳｲﾝ ｹﾝﾘﾂ','薩南病院　県立',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-22 00:00:00.000',NULL,NULL,'不明',NULL,'OPDIVO H&N','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 10:06:38.000',NULL,TIMESTAMP '2020-11-09 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'SQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H&N',NULL),
  (NULL,NULL,NULL,'40歳未満',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 02:06:24.000',NULL,NULL,NULL,'false','BRAF変異あり',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rcbEAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 02:06:24.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059008','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-02 00:00:00.000',NULL,NULL,'OP_Adjuvant',NULL,'OPDIVO+YERVOY MELANOMA','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 02:06:24.000',NULL,TIMESTAMP '2020-10-16 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-02 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'60-69歳',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 03:56:47.000',NULL,NULL,NULL,'false','不明',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 00:00:00.000','女性',NULL,NULL,'a4X1y0000008rd0EAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 03:56:47.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059013','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-09 00:00:00.000',NULL,NULL,'不明',NULL,'YERVOY','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 03:56:47.000',NULL,TIMESTAMP '2020-10-30 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-16 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'75-79歳',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:12:39.000',NULL,NULL,NULL,'false',NULL,0.500000000,NULL,'CR/CRu','CR/CRu','PR','SD',NULL,NULL,TIMESTAMP '2020-10-26 00:00:00.000','男性','あり',NULL,'a4X1y0000008ratEAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:17:39.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058999','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院','あり','1～3ヶ月','1～3ヶ月','1～3ヶ月','1～3ヶ月',TIMESTAMP '2020-10-12 00:00:00.000',NULL,NULL,'2nd',NULL,'ISTODAX','0121y000000dYDSAA2','CHOP','IST','PDX','ムンデシン','急速な再発',NULL,NULL,NULL,'Ⅱ',NULL,NULL,TIMESTAMP '2020-10-21 13:17:39.000',NULL,TIMESTAMP '2020-11-16 00:00:00.000',NULL,NULL,'1stライン',TIMESTAMP '2020-10-12 00:00:00.000',NULL,NULL,NULL,NULL,70.000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lymphoma',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I6F00000hCU0EUAW','01260349','ﾀｲﾗ ﾅｵﾔ','平良　直也',NULL,NULL,'腎機能低下;透析','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 10:54:18.000',NULL,NULL,NULL,'false',NULL,1.000000000,NULL,'CR/CRu','PR','PD','SD',NULL,NULL,TIMESTAMP '2020-11-02 00:00:00.000','男性','あり','t(14;18)','a4X1y0000008raPEAQ','false','false','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 10:54:18.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058993','69327201','008802325','ﾀｲﾗﾅｲｶｸﾘﾆﾂｸ','たいら内科クリニック','あり','1～3ヶ月','4～6ヶ月','10～12ヶ月','1～3ヶ月',TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,'2nd',NULL,'REVLIMID LYMPHOMA','0121y000000dYDSAA2','WW','R2','R-CHOP like','R-salvage多剤併用療法','急速な再発',NULL,NULL,NULL,'Ⅰ',NULL,NULL,TIMESTAMP '2020-10-21 10:54:18.000',NULL,TIMESTAMP '2020-10-26 00:00:00.000',NULL,NULL,'1stライン',TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,NULL,60.000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lymphoma',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,'貧血（輸血）','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:22:57.000',NULL,NULL,NULL,'false',NULL,3.500000000,NULL,'CR/CRu','CR/CRu','CR/CRu','PR',NULL,NULL,TIMESTAMP '2020-10-12 00:00:00.000','男性','あり','non-del5q','a4X1y0000008rb8EAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:22:57.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059002','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院','あり','4～6ヶ月','1～3ヶ月','1～3ヶ月','4～6ヶ月',TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,'1st',NULL,'REVLIMID MDS','0121y000000dYDSAA2','WW','salvage AlloSCT','Len','免疫抑制療法',NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 13:22:57.000',NULL,TIMESTAMP '2020-10-26 00:00:00.000',NULL,NULL,'1stライン',TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,NULL,NULL,87.500000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MDS',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I2t000002IQXIEA4','01449740','ﾖｺﾊﾀ ｴﾐ','横畠　絵美',NULL,NULL,'高血圧','0052t000000QsokAAC',TIMESTAMP '2020-11-10 11:02:15.000',NULL,NULL,NULL,'false',NULL,3.000000000,NULL,'PD','SD','PD','CR以上',NULL,NULL,TIMESTAMP '2020-11-02 00:00:00.000','女性','あり','t(4,14)','a4X1y0000008reXEAQ','false','false','0052t000000QsokAAC',TIMESTAMP '2020-11-10 11:02:15.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059027','90513501','001110576','ｱｲｲｸﾋﾞﾖｳｲﾝ ｲﾘﾖｳ','愛育病院　医療','あり','1～3ヶ月','4～6ヶ月','7～9ヶ月','10～12ヶ月',TIMESTAMP '2020-11-01 00:00:00.000',NULL,NULL,'4th+',NULL,'REVLIMID MM','0121y000000dYDSAA2','Rd','VRd','ERd','KRd','初発',NULL,NULL,NULL,'Ⅲ',NULL,NULL,TIMESTAMP '2020-11-10 11:02:15.000',NULL,TIMESTAMP '2021-01-01 00:00:00.000',NULL,NULL,'4thライン以降',TIMESTAMP '2020-11-01 00:00:00.000',NULL,NULL,NULL,NULL,65.400000000,NULL,NULL,NULL,NULL,NULL,'RVd',NULL,NULL,NULL,'MM',NULL),
  (NULL,NULL,NULL,'65-74歳','上記以外（隔週投与など）',NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,'特になし','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:27:34.000',NULL,NULL,NULL,'false',NULL,2.000000000,NULL,'CR以上','PR','VGPR','SD',NULL,NULL,TIMESTAMP '2020-10-26 00:00:00.000','男性','あり','その他','a4X1y0000008rbIEAQ','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:27:34.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059004','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院','あり','不明','不明','4～6ヶ月','1～2年以内',TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,'2nd',NULL,'POMALYST','0121y000000dYDSAA2','Rd','EPd','PVd','KRd','急速な再発',NULL,NULL,NULL,'Ⅰ',NULL,'不明',TIMESTAMP '2020-10-21 13:27:34.000',NULL,TIMESTAMP '2020-11-12 00:00:00.000',NULL,'あり','1stライン',TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,NULL,64.200000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MM',NULL),
  (NULL,NULL,NULL,'70-74歳',NULL,NULL,'a1I6F00000h7QDAUA2','01278051','ｲﾄｳ ｷﾐﾅﾘ','伊藤　仁也',NULL,NULL,NULL,'0056F00000CwD9GQAV',TIMESTAMP '2020-11-10 11:22:24.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-10 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rehEAA','false','false','0056F00000CwD9GQAV',TIMESTAMP '2020-11-10 11:22:24.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059029','11948701','001101135','ﾈﾑﾛﾋﾞﾖｳｲﾝ ｼﾘﾂ','根室病院　市立',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-01 00:00:00.000',NULL,NULL,'3L+',NULL,'OPDIVO LUNG','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-10 11:22:24.000',NULL,TIMESTAMP '2021-06-01 00:00:00.000','ICI+Chemo',NULL,NULL,TIMESTAMP '2020-11-04 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'SQ',NULL,NULL,NULL,'≧50%',NULL,NULL,NULL,NULL,'LC',NULL),
  (NULL,NULL,NULL,'40-49歳',NULL,NULL,'a1I6F00000h7KPPUA2','01284866','ｷｸｶﾜ ﾋﾛｱｷ','菊川　浩明',NULL,NULL,NULL,'0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:42:53.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-28 00:00:00.000','女性',NULL,NULL,'a4X1y0000008rZWEAY','false','false','0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:42:53.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058982','53920101','008400266','ｸﾏﾓﾄｲﾘﾖｳｾﾝﾀ- ﾄﾞﾂﾎﾟｳ','熊本医療センター　独法',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-22 00:00:00.000',NULL,NULL,'3L+',NULL,'OPDIVO LUNG','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 09:42:53.000',NULL,TIMESTAMP '2020-10-30 00:00:00.000','プラチナ併用',NULL,NULL,TIMESTAMP '2020-10-21 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'NSQ_WT',NULL,NULL,NULL,'1-49%',NULL,NULL,NULL,NULL,'LC',NULL),
  (NULL,NULL,NULL,NULL,NULL,NULL,'a1I2t000000260UEAQ','01509610','ﾅｶﾔﾏ ﾖｳｲﾁ','中山　洋一',NULL,NULL,NULL,'0052t000000QmPeAAK',TIMESTAMP '2020-11-10 02:13:24.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4X1y0000008reSEAQ','false','false','0052t000000QmPeAAK',TIMESTAMP '2020-11-10 02:14:49.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059026','36920101','005300741','ｷﾖｳﾄﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','京都大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2L',NULL,'OPDIVO RCC','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-10 02:14:49.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RCC',NULL),
  (NULL,NULL,NULL,'50-59歳',NULL,NULL,'a1I6F00000h79kwUAA','01419000','ｱﾝﾄﾞｳ ｹｲ','安藤　慶',NULL,NULL,NULL,'0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:03:15.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-20 00:00:00.000','男性',NULL,NULL,'a4X1y0000008ra5EAA','false','false','0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:03:15.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058989','56930201','008700657','ｻﾂﾅﾝﾋﾞﾖｳｲﾝ ｹﾝﾘﾂ','薩南病院　県立',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,'O+Y_1L',NULL,'OPDIVO+YERVOY RCC','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 10:03:15.000',NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-12 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RCC',NULL),
  (NULL,NULL,NULL,'40-49歳',NULL,NULL,'a1I6F00000h7KPPUA2','01284866','ｷｸｶﾜ ﾋﾛｱｷ','菊川　浩明',NULL,NULL,NULL,'0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:53:51.000',NULL,NULL,NULL,'false','上咽頭',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-12 00:00:00.000','女性',NULL,NULL,'a4X1y0000008rZqEAI','false','false','0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:53:51.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058986','53920101','008400266','ｸﾏﾓﾄｲﾘﾖｳｾﾝﾀ- ﾄﾞﾂﾎﾟｳ','熊本医療センター　独法',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,'感受性_1L',NULL,'OPDIVO H&N','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 09:53:51.000',NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-06 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'SQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H&N',NULL),
  (NULL,NULL,NULL,'不明',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 02:03:53.000',NULL,NULL,NULL,'false','不明',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-15 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rcWEAQ','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 02:03:53.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059007','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-09 00:00:00.000',NULL,NULL,'OP_3L+',NULL,'OPDIVO MELANOMA','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 02:03:53.000',NULL,TIMESTAMP '2020-10-22 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-08 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'50-59歳',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 03:54:19.000',NULL,NULL,NULL,'false','BRAF変異あり',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-16 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rcvEAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 03:54:19.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059012','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-02 00:00:00.000',NULL,NULL,'YV',NULL,'YERVOY','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 03:54:19.000',NULL,TIMESTAMP '2020-10-30 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-09 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'不明',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 03:57:26.000',NULL,NULL,NULL,'false','不明',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-20 00:00:00.000','不明',NULL,NULL,'a4X1y0000008rd5EAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 03:58:03.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059014','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-06 00:00:00.000',NULL,NULL,'不明',NULL,'YERVOY','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 03:58:03.000',NULL,TIMESTAMP '2020-10-27 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-13 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,'腎機能低下;透析;呼吸器疾患;高血圧;糖尿病','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:19:29.000',NULL,NULL,NULL,'false',NULL,3.000000000,NULL,'SD','PR','PR','SD',NULL,NULL,TIMESTAMP '2020-10-26 00:00:00.000','女性','あり','その他','a4X1y0000008rayEAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:19:29.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059000','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院','未確認','1～3ヶ月','1～3ヶ月','1～3ヶ月','1～3ヶ月',TIMESTAMP '2020-10-12 00:00:00.000',NULL,NULL,'3rd',NULL,'REVLIMID LYMPHOMA','0121y000000dYDSAA2','WW','R2','GB','R-salvage多剤併用療法','緩やかな再発',NULL,NULL,NULL,'Ⅰ',NULL,NULL,TIMESTAMP '2020-10-21 13:19:29.000',NULL,TIMESTAMP '2020-11-16 00:00:00.000',NULL,NULL,'1stライン',TIMESTAMP '2020-10-12 00:00:00.000',NULL,NULL,NULL,NULL,75.500000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lymphoma',NULL),
  (NULL,NULL,NULL,NULL,NULL,NULL,'a1I6F00000kUCAGUA4','90647811','ｶﾜｼﾏ ﾓﾛﾖｼ','川島　専良',NULL,NULL,NULL,'0056F00000CwDK8QAN',TIMESTAMP '2020-11-05 15:25:39.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4X1y0000008reIEAQ','false','false','0056F00000CwDK8QAN',TIMESTAMP '2020-11-05 15:25:41.000',NULL,'false','075CEE12-C248-4622-8F26-FE8911A1D92D',NULL,NULL,NULL,'CT-0000059024','62069201','033474018','ｱｲﾉﾔﾂｷﾖｸ','あいの薬局',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'REVLIMID MDS','0121y000000dYDSAA2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-05 15:25:41.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MDS',NULL),
  (NULL,NULL,NULL,'80歳以上',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,'特になし','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:24:41.000',NULL,NULL,NULL,'false',NULL,10.000000000,NULL,'CR以上','PR','VGPR','PR',NULL,NULL,TIMESTAMP '2020-10-14 00:00:00.000','女性','なし','t(14,16)','a4X1y0000008rbDEAQ','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:24:41.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059003','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院','なし','4～6ヶ月','2～3年以内','7～9ヶ月','5年以上',TIMESTAMP '2020-10-06 00:00:00.000',NULL,NULL,'3rd',NULL,'REVLIMID MM','0121y000000dYDSAA2','Vd','Kd','他のBor-base：Vd、VCD、VMP等','PVd','急速な再発',NULL,NULL,NULL,'Ⅰ',NULL,NULL,TIMESTAMP '2020-10-21 13:24:41.000',NULL,TIMESTAMP '2020-10-28 00:00:00.000',NULL,NULL,'不明',TIMESTAMP '2020-10-07 00:00:00.000',NULL,NULL,NULL,NULL,60.000000000,NULL,NULL,NULL,NULL,NULL,'DVMP',NULL,NULL,NULL,'MM',NULL),
  (NULL,NULL,NULL,'75-79歳','5mg',NULL,'a1I6F00000hCU0EUAW','01260349','ﾀｲﾗ ﾅｵﾔ','平良　直也',NULL,NULL,'末梢神経障害','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 11:13:56.000',NULL,NULL,NULL,'false',NULL,3.000000000,NULL,'PR','PR','VGPR','SD',NULL,NULL,TIMESTAMP '2020-10-26 00:00:00.000','男性','なし','1q増幅','a4X1y0000008rajEAA','false','false','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 11:13:56.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058997','69327201','008802325','ﾀｲﾗﾅｲｶｸﾘﾆﾂｸ','たいら内科クリニック','なし','4～6ヶ月','1～3ヶ月','4～6ヶ月','7～9ヶ月',TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,'2nd',NULL,'POMALYST','0121y000000dYDSAA2','Rd','Kd','IsaPD','PCd','緩やかな再発',NULL,NULL,NULL,'Ⅱ',NULL,'あり',TIMESTAMP '2020-10-21 11:13:56.000',NULL,TIMESTAMP '2020-11-30 00:00:00.000',NULL,'あり','不明',TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,NULL,85.000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MM',NULL),
  (NULL,NULL,NULL,'不明',NULL,NULL,'a1I6F00000h7KPPUA2','01284866','ｷｸｶﾜ ﾋﾛｱｷ','菊川　浩明',NULL,NULL,NULL,'0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:44:03.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-28 00:00:00.000','不明',NULL,NULL,'a4X1y0000008rZbEAI','false','false','0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:44:03.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058983','53920101','008400266','ｸﾏﾓﾄｲﾘﾖｳｾﾝﾀ- ﾄﾞﾂﾎﾟｳ','熊本医療センター　独法',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-14 00:00:00.000',NULL,NULL,'不明',NULL,'OPDIVO LUNG','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 09:44:03.000',NULL,TIMESTAMP '2020-11-04 00:00:00.000','不明',NULL,NULL,TIMESTAMP '2020-10-21 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'不明',NULL,NULL,NULL,'不明',NULL,NULL,NULL,NULL,'LC',NULL),
  (NULL,NULL,NULL,'40-49歳',NULL,NULL,'a1I6F00000kUA8KUAW','90648632','ｲｼﾂﾞｶ ﾏｻﾋｺ','石塚　雅彦',NULL,NULL,NULL,'0056F00000CxlH7QAJ',TIMESTAMP '2020-10-19 07:02:50.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-22 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rZ7EAI','false','false','0056F00000CwDK8QAN',TIMESTAMP '2020-10-19 07:12:14.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058977','62321401','033477097','ｱｲｹｱﾔﾂｷﾖｸｷﾀﾓﾄﾃﾝ','あいケア薬局北本店',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-20 00:00:00.000',NULL,NULL,'2L',NULL,'OPDIVO LUNG','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-19 07:12:14.000',NULL,TIMESTAMP '2020-10-22 00:00:00.000','ICI単剤',NULL,NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'SQ',NULL,NULL,NULL,'≧50%',NULL,NULL,NULL,NULL,'LC',NULL),
  (NULL,NULL,NULL,'70-79歳',NULL,NULL,'a1I6F00000h79kwUAA','01419000','ｱﾝﾄﾞｳ ｹｲ','安藤　慶',NULL,NULL,NULL,'0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:02:07.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-14 00:00:00.000','不明',NULL,NULL,'a4X1y0000008ra0EAA','false','false','0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:02:07.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058988','56930201','008700657','ｻﾂﾅﾝﾋﾞﾖｳｲﾝ ｹﾝﾘﾂ','薩南病院　県立',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-07 00:00:00.000',NULL,NULL,'OP_2L',NULL,'OPDIVO RCC','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 10:02:07.000',NULL,TIMESTAMP '2020-10-21 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-07 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RCC',NULL),
  (NULL,NULL,NULL,'40歳未満',NULL,NULL,'a1I6F00000h79kwUAA','01419000','ｱﾝﾄﾞｳ ｹｲ','安藤　慶',NULL,NULL,NULL,'0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:04:13.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-13 00:00:00.000','男性',NULL,NULL,'a4X1y0000008raAEAQ','false','false','0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:04:13.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058990','56930201','008700657','ｻﾂﾅﾝﾋﾞﾖｳｲﾝ ｹﾝﾘﾂ','薩南病院　県立',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-08 00:00:00.000',NULL,NULL,'O+Y_1L',NULL,'OPDIVO+YERVOY RCC','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 10:04:13.000',NULL,TIMESTAMP '2020-10-27 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-07 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RCC',NULL),
  (NULL,NULL,NULL,'50-59歳',NULL,NULL,'a1I6F00000h79kwUAA','01419000','ｱﾝﾄﾞｳ ｹｲ','安藤　慶',NULL,NULL,NULL,'0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:05:44.000',NULL,NULL,NULL,'false','喉頭',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-28 00:00:00.000','女性',NULL,NULL,'a4X1y0000008raFEAQ','false','false','0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:05:44.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058991','56930201','008700657','ｻﾂﾅﾝﾋﾞﾖｳｲﾝ ｹﾝﾘﾂ','薩南病院　県立',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-14 00:00:00.000',NULL,NULL,'抵抗性_3L＋',NULL,'OPDIVO H&N','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 10:05:44.000',NULL,TIMESTAMP '2020-11-04 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-21 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'NSQ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H&N',NULL),
  (NULL,NULL,NULL,'70-79歳',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 01:56:08.000',NULL,NULL,NULL,'false','BRAF変異あり',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-12 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rcMEAQ','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 01:56:08.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059005','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,'O+Y_2L＋',NULL,'OPDIVO MELANOMA','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 01:56:08.000',NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'40-49歳',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 02:50:28.000',NULL,NULL,NULL,'false','BRAF変異あり',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-26 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rclEAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 02:50:28.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059010','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-02 00:00:00.000',NULL,NULL,'不明',NULL,'OPDIVO+YERVOY MELANOMA','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 02:50:28.000',NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,NULL,NULL,NULL,'a1I6F00000kUA8KUAW','90648632','ｲｼﾂﾞｶ ﾏｻﾋｺ','石塚　雅彦',NULL,NULL,NULL,'0056F00000CwDK8QAN',TIMESTAMP '2020-10-30 09:03:03.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4X1y0000008rdjEAA','false','false','0056F00000CwDK8QAN',TIMESTAMP '2020-11-03 03:44:02.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059018','62321401','033477097','ｱｲｹｱﾔﾂｷﾖｸｷﾀﾓﾄﾃﾝ','あいケア薬局北本店',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'YV',NULL,'YERVOY','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-03 03:44:02.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I6F00000hDG8fUAG','01313715','ｵｵﾊﾞﾔｼ ﾀｶﾖｼ','大林　孝吉',NULL,NULL,'腎機能低下;透析','0056F00000CxlH7QAJ',TIMESTAMP '2020-10-12 00:20:28.000',NULL,NULL,NULL,'false',NULL,1.000000000,NULL,'SD','PD','SD','PD',NULL,NULL,TIMESTAMP '2020-10-14 00:00:00.000','男性','あり',NULL,'a4X1y0000008rYEEAY','false','false','0056F00000CxlH7QAJ',TIMESTAMP '2020-10-12 00:20:28.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058970','36120901','005302467','ｷﾖｳﾄｷﾂﾞｶﾞﾜﾋﾞﾖｳｲﾝ ｲﾘﾖｳ','京都きづ川病院　医療',NULL,'1～3ヶ月','1～3ヶ月','1～3ヶ月','1～3ヶ月',TIMESTAMP '2020-10-13 00:00:00.000',NULL,NULL,'2nd',NULL,'ISTODAX','0121y000000dYDSAA2','Mog単剤','多剤併用サルベージ','ムンデシン','その他','急速な再発',NULL,NULL,NULL,'Ⅰ',NULL,NULL,TIMESTAMP '2020-10-21 11:51:19.000',NULL,TIMESTAMP '2020-10-15 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-12 00:00:00.000',NULL,NULL,NULL,NULL,60.000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lymphoma',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I6F00000hCU0EUAW','01260349','ﾀｲﾗ ﾅｵﾔ','平良　直也',NULL,NULL,'透析;心疾患;呼吸器疾患;高血圧;糖尿病;貧血（輸血）;B症状','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 10:59:06.000',NULL,NULL,NULL,'false',NULL,2.000000000,NULL,'PR','SD','PD','PR',NULL,NULL,TIMESTAMP '2020-11-25 00:00:00.000','女性','未確認',NULL,'a4X1y0000008raUEAQ','false','false','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 10:59:06.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058994','69327201','008802325','ﾀｲﾗﾅｲｶｸﾘﾆﾂｸ','たいら内科クリニック','未確認','不明','不明','1～2年以内','5年以上',TIMESTAMP '2020-10-21 00:00:00.000',NULL,NULL,'3rd',NULL,'REVLIMID ATLL','0121y000000dYDSAA2','その他','mLSG15','mLSG15','Mog＋化学療法','急速な再発',NULL,NULL,NULL,'Ⅳ',NULL,NULL,TIMESTAMP '2020-10-21 10:59:06.000',NULL,TIMESTAMP '2020-11-18 00:00:00.000',NULL,NULL,'不明',TIMESTAMP '2020-10-21 00:00:00.000',NULL,NULL,NULL,NULL,50.000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lymphoma',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I6F00000kUCAGUA4','90647811','ｶﾜｼﾏ ﾓﾛﾖｼ','川島　専良',NULL,NULL,'腎機能低下;透析','0056F00000CwDK8QAN',TIMESTAMP '2020-11-05 15:25:43.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,'CR以上','VGPR','PR','SD',NULL,NULL,NULL,'男性','あり','t(4,14)','a4X1y0000008reNEAQ','false','false','0056F00000CwDK8QAN',TIMESTAMP '2020-11-05 17:48:57.000',NULL,'false','17FA8A02-9248-4310-BD1D-5B9395D8FA64',NULL,NULL,NULL,'CT-0000059025','62069201','033474018','ｱｲﾉﾔﾂｷﾖｸ','あいの薬局','あり','1～3ヶ月','1～2年以内','5年以上','5年以上',NULL,NULL,NULL,'1st',NULL,'REVLIMID MM','0121y000000dYDSAA2','Rd','VRd','ERd','ERd','初発',NULL,NULL,NULL,'Ⅰ',NULL,NULL,TIMESTAMP '2020-11-05 17:48:57.000',NULL,NULL,NULL,NULL,'1stライン',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rd',NULL,NULL,NULL,'MM',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I6F00000kUA8KUAW','90648632','ｲｼﾂﾞｶ ﾏｻﾋｺ','石塚　雅彦',NULL,NULL,'腎機能低下','0056F00000CwDK8QAN',TIMESTAMP '2020-11-05 02:25:53.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,'CR以上','VGPR','PR','SD',NULL,NULL,NULL,'男性','あり','t(4,14)','a4X1y0000008reDEAQ','false','false','0056F00000CwDK8QAN',TIMESTAMP '2020-11-05 02:25:53.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059023','62321401','033477097','ｱｲｹｱﾔﾂｷﾖｸｷﾀﾓﾄﾃﾝ','あいケア薬局北本店','あり','1～3ヶ月','4～6ヶ月','7～9ヶ月','10～12ヶ月',NULL,NULL,NULL,'1st',NULL,'REVLIMID MM','0121y000000dYDSAA2','Rd','VRd','ERd','IRd','初発',NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-05 02:25:53.000',NULL,NULL,NULL,NULL,'1stライン',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MM',NULL),
  (NULL,NULL,NULL,'40歳未満',NULL,NULL,'a1I6F00000kUA8KUAW','90648632','ｲｼﾂﾞｶ ﾏｻﾋｺ','石塚　雅彦',NULL,NULL,NULL,'0056F00000CxlH7QAJ',TIMESTAMP '2020-10-19 06:59:52.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-22 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rYsEAI','false','false','0056F00000CxlH7QAJ',TIMESTAMP '2020-10-19 06:59:52.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058974','62321401','033477097','ｱｲｹｱﾔﾂｷﾖｸｷﾀﾓﾄﾃﾝ','あいケア薬局北本店',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-20 00:00:00.000',NULL,NULL,'2L',NULL,'OPDIVO LUNG','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-19 06:59:52.000',NULL,TIMESTAMP '2020-10-22 00:00:00.000','ICI+Chemo',NULL,NULL,TIMESTAMP '2020-10-21 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'SQ',NULL,NULL,NULL,'≧50%',NULL,NULL,NULL,NULL,'LC',NULL),
  (NULL,NULL,NULL,'40歳未満',NULL,NULL,'a1I6F00000h7KPPUA2','01284866','ｷｸｶﾜ ﾋﾛｱｷ','菊川　浩明',NULL,NULL,NULL,'0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:40:35.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rZREAY','false','false','0056F00000CwDIBQA3',TIMESTAMP '2020-10-21 09:40:35.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058981','53920101','008400266','ｸﾏﾓﾄｲﾘﾖｳｾﾝﾀ- ﾄﾞﾂﾎﾟｳ','熊本医療センター　独法',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,'2L',NULL,'OPDIVO LUNG','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 09:40:35.000',NULL,TIMESTAMP '2020-10-26 00:00:00.000','ICI+Chemo;ICI単剤',NULL,NULL,TIMESTAMP '2020-10-20 00:00:00.000',NULL,NULL,NULL,NULL,NULL,'SQ',NULL,NULL,NULL,'≧50%',NULL,NULL,NULL,NULL,'LC',NULL),
  (NULL,NULL,NULL,'70-79歳',NULL,NULL,'a1I6F00000h79kwUAA','01419000','ｱﾝﾄﾞｳ ｹｲ','安藤　慶',NULL,NULL,NULL,'0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:00:39.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-19 00:00:00.000','男性',NULL,NULL,'a4X1y0000008rZvEAI','false','false','0056F00000CwDKdQAN',TIMESTAMP '2020-10-21 10:00:39.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058987','56930201','008700657','ｻﾂﾅﾝﾋﾞﾖｳｲﾝ ｹﾝﾘﾂ','薩南病院　県立',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,'OP_3L+',NULL,'OPDIVO RCC','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 10:00:39.000',NULL,TIMESTAMP '2020-10-27 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-15 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RCC',NULL),
  (NULL,NULL,NULL,'40歳未満',NULL,NULL,'a1I6F00000kUCAGUA4','90647811','ｶﾜｼﾏ ﾓﾛﾖｼ','川島　専良',NULL,NULL,NULL,'0056F00000CwDK8QAN',TIMESTAMP '2020-11-03 08:07:43.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'男性',NULL,NULL,'a4X1y0000008rdyEAA','false','false','0056F00000CwDK8QAN',TIMESTAMP '2020-11-03 08:52:06.000',NULL,'false','136F9B18-1C54-48E7-8CCA-A8DDDC625746',NULL,NULL,NULL,'CT-0000059021','62069201','033474018','ｱｲﾉﾔﾂｷﾖｸ','あいの薬局',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1L',NULL,'OPDIVO+YERVOY RCC','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-03 08:52:06.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RCC',NULL),
  (NULL,NULL,NULL,NULL,NULL,NULL,'a1I2t000000260UEAQ','01509610','ﾅｶﾔﾏ ﾖｳｲﾁ','中山　洋一',NULL,NULL,NULL,'0052t000000QmPeAAK',TIMESTAMP '2020-11-11 01:52:34.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4X1y0000008remEAA','false','false','0052t000000QmPeAAK',TIMESTAMP '2020-11-11 01:53:08.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059030','36920101','005300741','ｷﾖｳﾄﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','京都大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'OPDIVO H&N','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-11 01:53:08.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H&N',NULL),
  (NULL,NULL,NULL,'80歳以上',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 01:57:24.000',NULL,NULL,NULL,'false','BRAF変異なし',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-14 00:00:00.000','女性',NULL,NULL,'a4X1y0000008rcREAQ','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 01:57:24.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059006','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-07 00:00:00.000',NULL,NULL,'O+Y_3L+',NULL,'OPDIVO MELANOMA','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 01:57:24.000',NULL,TIMESTAMP '2020-10-21 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-07 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'60-69歳',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,NULL,'0052t000000QsoNAAS',TIMESTAMP '2020-10-23 02:52:03.000',NULL,NULL,NULL,'false','BRAF変異なし',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-30 00:00:00.000','女性',NULL,NULL,'a4X1y0000008rcqEAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-23 02:52:03.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059011','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院',NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-13 00:00:00.000',NULL,NULL,'O+Y_1L',NULL,'OPDIVO+YERVOY MELANOMA','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 02:52:03.000',NULL,TIMESTAMP '2020-10-27 00:00:00.000',NULL,NULL,NULL,TIMESTAMP '2020-10-13 00:00:00.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'40-49歳',NULL,NULL,'a1I6F00000kUA8KUAW','90648632','ｲｼﾂﾞｶ ﾏｻﾋｺ','石塚　雅彦',NULL,NULL,NULL,'0056F00000CwDK8QAN',TIMESTAMP '2020-10-23 04:20:23.000',NULL,NULL,NULL,'false','BRAF変異あり',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4X1y0000008rdAEAQ','false','false','0056F00000CwDK8QAN',TIMESTAMP '2020-10-23 04:20:23.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059015','62321401','033477097','ｱｲｹｱﾔﾂｷﾖｸｷﾀﾓﾄﾃﾝ','あいケア薬局北本店',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O+Y_2L＋',NULL,'YERVOY','0126F000001ZhqgQAC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-23 04:20:23.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Melanoma',NULL),
  (NULL,NULL,NULL,'75-79歳',NULL,NULL,'a1I6F00000hCU0EUAW','01260349','ﾀｲﾗ ﾅｵﾔ','平良　直也',NULL,NULL,'特になし','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 12:22:42.000',NULL,NULL,NULL,'false',NULL,3.000000000,NULL,'CR/CRu','CR/CRu','PR','SD',NULL,NULL,TIMESTAMP '2020-10-12 00:00:00.000','男性','あり',NULL,'a4X1y0000008raoEAA','false','false','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 12:23:17.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058998','69327201','008802325','ﾀｲﾗﾅｲｶｸﾘﾆﾂｸ','たいら内科クリニック','あり','4～6ヶ月','1～3ヶ月','4～6ヶ月','10～12ヶ月',TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,'2nd',NULL,'ISTODAX','0121y000000dYDSAA2','upfront AlloSCT','salvage AlloSCT','salvage ASCT','多剤併用サルベージ','急速な再発',NULL,NULL,NULL,'Ⅳ',NULL,NULL,TIMESTAMP '2020-10-21 12:23:17.000',NULL,TIMESTAMP '2020-10-26 00:00:00.000',NULL,NULL,'1stライン',TIMESTAMP '2020-10-05 00:00:00.000',NULL,NULL,NULL,NULL,70.000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lymphoma',NULL),
  (NULL,NULL,NULL,'64歳以下',NULL,NULL,'a1I6F00000hB2uqUAC','01452093','ｾｷﾈ ﾏｻｱｷ','関根　雅明',NULL,NULL,'腎機能低下','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:21:30.000',NULL,NULL,NULL,'false',NULL,0.500000000,NULL,'CR/CRu','PR','SD','PR',NULL,NULL,TIMESTAMP '2020-10-26 00:00:00.000','女性','あり',NULL,'a4X1y0000008rb3EAA','false','false','0052t000000QsoNAAS',TIMESTAMP '2020-10-21 13:21:30.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059001','55920401','008600859','ﾐﾔｻﾞｷﾀﾞｲｶﾞｸｲｶﾞｸﾌﾞﾌｿﾞｸﾋﾞﾖｳｲﾝ','宮崎大学医学部附属病院','あり','1～3ヶ月','1～3ヶ月','1～3ヶ月','1～3ヶ月',TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,'2nd',NULL,'REVLIMID ATLL','0121y000000dYDSAA2','CHOP','Mog-CHOP','mLSG15','Mog＋化学療法','急速な再発',NULL,NULL,NULL,'不明',NULL,NULL,TIMESTAMP '2020-10-21 13:21:30.000',NULL,TIMESTAMP '2020-11-02 00:00:00.000',NULL,NULL,'4thライン以降',TIMESTAMP '2020-10-19 00:00:00.000',NULL,NULL,NULL,NULL,75.000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lymphoma',NULL),
  (NULL,NULL,NULL,'65-74歳',NULL,NULL,'a1I6F00000hCU0EUAW','01260349','ﾀｲﾗ ﾅｵﾔ','平良　直也',NULL,NULL,'特になし','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 11:02:14.000',NULL,NULL,NULL,'false',NULL,5.000000000,NULL,'CR/CRu','PR','SD','PR',NULL,NULL,TIMESTAMP '2020-10-28 00:00:00.000','男性','なし','del5q+other1','a4X1y0000008raZEAQ','false','false','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 11:02:14.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058995','69327201','008802325','ﾀｲﾗﾅｲｶｸﾘﾆﾂｸ','たいら内科クリニック','なし','4～6ヶ月','4～6ヶ月','7～9ヶ月','7～9ヶ月',TIMESTAMP '2020-10-14 00:00:00.000',NULL,NULL,'4th+',NULL,'REVLIMID MDS','0121y000000dYDSAA2','HMA±化学療法','Len','支持療法のみ','HMA±化学療法',NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-10-21 11:02:14.000',NULL,TIMESTAMP '2020-11-25 00:00:00.000',NULL,NULL,'未治療経過観察',TIMESTAMP '2020-10-14 00:00:00.000',NULL,NULL,NULL,NULL,100.000000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MDS',NULL),
  (NULL,NULL,NULL,'80歳以上',NULL,NULL,'a1I6F00000hCU0EUAW','01260349','ﾀｲﾗ ﾅｵﾔ','平良　直也',NULL,NULL,'糖尿病;骨病変','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 11:10:22.000',NULL,NULL,NULL,'false',NULL,3.000000000,NULL,'PR','CR以上','VGPR','PD',NULL,NULL,TIMESTAMP '2020-10-07 00:00:00.000','女性','あり','1q増幅','a4X1y0000008raeEAA','false','false','0056F00000CwDFBQA3',TIMESTAMP '2020-10-21 11:10:22.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000058996','69327201','008802325','ﾀｲﾗﾅｲｶｸﾘﾆﾂｸ','たいら内科クリニック','未確認','7～9ヶ月','7～9ヶ月','不明','5年以上',TIMESTAMP '2020-09-01 00:00:00.000',NULL,NULL,'2nd',NULL,'REVLIMID MM','0121y000000dYDSAA2','DVMP','IRd','他のBor-base：Vd、VCD、VMP等','移植（導入、地固め、維持含む）','初発',NULL,NULL,NULL,'Ⅱ',NULL,NULL,TIMESTAMP '2020-10-21 11:10:22.000',NULL,TIMESTAMP '2020-10-20 00:00:00.000',NULL,NULL,'未治療経過観察',TIMESTAMP '2020-09-02 00:00:00.000',NULL,NULL,NULL,NULL,45.000000000,NULL,NULL,NULL,NULL,NULL,'DRd',NULL,NULL,NULL,'MM',NULL),
  (NULL,NULL,NULL,NULL,NULL,NULL,'a1I2t000002PDroEAG','01289650','ｲｽﾞﾐ ｼﾞﾕﾝｺ','泉　純子',NULL,NULL,NULL,'0056F00000CxlH7QAJ',TIMESTAMP '2020-11-02 01:54:51.000',NULL,NULL,NULL,'false',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4X1y0000008rdoEAA','false','false','0056F00000CxlH7QAJ',TIMESTAMP '2020-11-02 01:54:51.000',NULL,'false',NULL,NULL,NULL,NULL,'CT-0000059019','22221001','003502000','ｼﾝﾏﾂﾄﾞﾁﾕｳｵｳｿｳｺﾞｳﾋﾞﾖｳｲﾝ ｲﾘﾖｳ','新松戸中央総合病院　医療',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'POMALYST','0121y000000dYDSAA2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,TIMESTAMP '2020-11-02 01:54:51.000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MM',NULL);
  
  update  jp1a_stg.stg_veeva_pat_rx_fol_up_bms_jp__c set cycl_time_id=320201111,scen_id=1  where cycl_time_id is null;
  update  jp1a_stg.stg_veeva_pat_rx_fol_up_bms_jp__c set actv_flag=1 where cycl_time_id=320201111 and scen_id=1;
