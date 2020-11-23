INSERT INTO apac_orch.cntl_etl_sql (sql_id,tbl_nm,sql_type,sql_txt,actv_flag,inrt_dt,inrt_by,modf_dt,modf_by,cmt) 
VALUES
  (50547,'jp2a_cdw.f_bp_prd_rx_fol_up','LEVEL 2','Insert into jp2_int.F_BP_PRD_RX_FOL_UP_temp
(
BP_PRD_RX_ID
,BP_PAR_SK
,BP_SK
,PSET_SK
,FOL_UP_CALD_DT_SK
,PAT_BRD_INATN_CALD_DT_SK
,PLAN_DEVY_CALD_DT_SK
,TRTT_STRT_CALD_DT_SK
,CTRY_CD
,DSRC_SK
,CHLD_ACCT_ID
,REC_TYPE_ID
,FOLUP_NM
,HCP_NM
,INSN_NM
,STG_OF_DIS_NM
,RF_CD
,ACPA_DSG_DS
,BIO_MLCL_USE_DS
,TRTT_LN_DS
,CMBN_MEDC_TXT
,CMPLCTNS_TXT
,MSI_TEST_TIME_TXT
,PAT_CASE_TRC_LINK_TXT
,PAT_CASE_TRC_TXT
,PAT_STA_CMPLCTN_TXT
,EFCT_1ST_LN_TXT
,EFCT_2ND_LN_TXT
,EFCT_3RD_LN_TXT
,EFCT_4TH_LN_TXT
,GNDR_TXT
,PREV_DIS_TXT
,PERD_1ST_LN_TXT
,PERD_2ND_LN_TXT
,PERD_3RD_LN_TXT
,PERD_4TH_LN_TXT 
,RX_LN_TXT
,RX_PATH_TXT
,REGM_1ST_LN_TXT
,REGM_2ND_LN_TXT
,REGM_3RD_LN_TXT
,REGM_4TH_LN_TXT
,SNTVY_POMALIDOMIDE_TXT
,TRTT_HIST_POMALIDOMIDE_TXT
,AGE_NUM
,WT_NUM
,DIS_DUR_CT
,MTX_WKLY_RX_DOSE_CT
,PAT_RX_STRT_DT
,MTX_WKLY_RX_CMB_USE_IND
,diags_ds
,AMT_OF_DEVY_DSG_TXT
,HIGH_RISK_CHROMOSOME_ABNORMALITY_TXT  
,HCP_INTENTION_TXT			 
,PAT_CNF_TXT				
,TRTT_TERMN_REAS_DS			
,SRC_MODF_TS
,SRC_DLT_FLAG
,CYCL_TIME_ID
,SCEN_ID
,INRT_TS
,INRT_BY_NM
,MODF_TS
,MODF_BY_NM
,SRC_CREA_DT_SK
,LGCY_SRC_CREA_DT_SK
,trtt_end_cald_dt_sk
,trtt_expc_prd_txt
,spctby_txt
,rlps_type_txt
,HSTGY_TXT
,PD_L1_STA_TXT
,PREV_TRTT_REGM_TXT
,THER_AREA_TXT

)
SELECT
stg.id as BP_PRD_RX_ID
,Case when stg.Chld_Acct_BMS__c is null then null else coalesce(lkp1.bp_par_sk,-1) end as bp_par_sk
,Case when stg.Chld_Acct_BMS__c is null then null else coalesce(lkp1.bp_sk,-1) end as bp_sk
,Case when stg.prd_bms__c is null then null else coalesce(lkp2.pset_sk,-1) end as pset_sk
,Case when stg.fol_up_dt_bms__C is null then null else coalesce(lkp3.cald_dt_sk,-1) end as FOL_UP_CALD_DT_SK
,Case when stg.ABT_Dose_Dt_BMS__c is null then null else coalesce(lkp4.cald_dt_sk,-1) end as PAT_BRD_INATN_CALD_DT_SK
,Case when stg.plan_devy_dt_bms__c is null then null else coalesce(lkp5.cald_dt_sk,-1) end as PLAN_DEVY_CALD_DT_SK
,Case when stg.trtt_strt_dt_bms__C is null then null else coalesce(lkp6.cald_dt_sk,-1) end as TRTT_STRT_CALD_DT_SK
,''JP''
,coalesce(lkp7.DSRC_SK,-1) as DSRC_SK
,stg.Chld_Acct_BMS__c
,stg.Recordtypeid
,stg.nm
,stg.Chld_Acct_Nm_BMS__c
,stg.Par_Acct_Nm_BMS__c
,stg.Stg_Of_Dis_BMS__c
,stg.RF_BMS__c
,stg.ACPA_BMS__c
,stg.Use_Bio_BMS__c
,stg.Trtt_Ln_BMS__c
,stg.cmbn_medc_bms__c
,stg.complications_bms__c
,stg.msi_test_timing__c as MSI_TEST_TIME_TXT
,stg.MTX_CMB_Use_BMS__c
,stg.Lgcy_Case_Trace_Num_BMS__c
,stg.Complications_BMS__c
,stg.Efct_1st_BMS__c
,stg.Efct_2nd_BMS__c
,stg.Efct_3rd_BMS__c
,stg.Efct_4th_BMS__c
,stg.Gndr_BMS__c
,stg.Trtt_Expc_BMS__c
,stg.Perd_1st_BMS__c
,stg.Perd_2nd_BMS__c
,stg.Perd_3rd_BMS__c
,stg.Perd_4th_BMS__c
,stg.RX_Ln_BMS__c
,stg.RX_Path_BMS__c
,stg.Regm_1st_BMS__c
,stg.Regm_2nd_BMS__c
,stg.Regm_3rd_BMS__c
,stg.Regm_4th_BMS__c
,stg.pomalidomide_susceptibility_bms__c
,stg.pomalidomide_expc_bms__c
,stg.Age_BMS__c
,stg.wt_bms__c
,stg.Dis_Dur_BMS__c
,stg.MTX_Dose_BMS__c
,stg.Trtt_Strt_Dt_BMS__c
,stg.MTX_Cmb_Use_BMS__c
,stg.diags_bms__c								AS diags_ds
,stg.amt_of_devy_dsg_bms__c						AS amt_of_devy_dsg
,stg.high_risk_chromosome_abnormality_bms__c    As HIGH_RISK_CHROMOSOME_ABNLT 
,stg.hcp_intention_bms__c 						AS HCP_Intention
,stg.pat_confirmation_bms__c					AS PAT_CNF				
,stg.trtt_termn_reas_bms__c 					AS TRTT_TERMN_REAS		   
,stg.lastmodifieddate 							AS src_modf_ts
,Case when stg.isdeleted = ''true'' then 1 else 0 end as src_dlt_flag
,stg.CYCL_TIME_ID
,stg.SCEN_ID
,getdate() as INRT_TS
,stg.INRT_BY as INRT_BY_NM
,getdate() as MODF_TS
,''cdwjpetl02''  as MODF_BY_NM
,Case when stg.createddate is null then null else coalesce(lkp8.cald_dt_sk,-1) end as SRC_CREA_DT_SK
,Case when stg.createddate is null then null else coalesce(lkp8.cald_dt_sk,-1) end as LGCY_SRC_CREA_DT_SK
,Case when stg.trtt_end_dt_bms__C is null then null else coalesce(lkp9.cald_dt_sk,-1) end as TRTT_END_CALD_DT_SK
,stg.TRTT_EXPC_PRD_BMS__c as trtt_expc_prd_txt
,stg.susceptibility_BMS__c as spctby_txt
,stg.relapse_Type_BMS__c as rlps_type_txt
,stg.Histology_BMS__c as HSTGY_TXT
,stg.PD_L1_Status_BMS__c AS PD_L1_STA_TXT
,stg.Previous_Treatment_Regiment_BMS__c AS PREV_TRTT_REGM_TXT
,stg.Therapeutic_Area_BMS__c AS THER_AREA_TXT
From jp1a_stg.stg_veeva_pat_rx_fol_up_bms_jp__c stg
left outer join jp2a_cdw.d_chld_acct lkp1 on stg.Chld_Acct_BMS__c = lkp1.CHLD_ACCT_CD
left outer join jp2a_cdw.f_bp_prd_rx_fol_up tgt on tgt.BP_PRD_RX_ID = stg.id
left outer join (Select distinct nm, actv_flag , id from  jp1a_stg.stg_veeva_prd_vod__c where isdeleted = ''false'') stg1 on stg1.nm = stg.prd_bms__c and stg1.actv_flag = 1
left outer join jp2a_cdw.xref_prd_item_extl_idnty lkp2 on lkp2.src_prd_id = stg1.id
left outer join jp2a_cdw.d_cald_dt lkp3 on lkp3.cald_dt_id = TO_CHAR(stg.fol_up_dt_bms__c    ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp4 on lkp4.cald_dt_id = TO_CHAR(stg.ABT_Dose_Dt_BMS__c  ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp5 on lkp5.cald_dt_id = TO_CHAR(stg.plan_devy_dt_bms__c ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp6 on lkp6.cald_dt_id = TO_CHAR(stg.trtt_strt_dt_bms__C ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp8 on lkp8.cald_dt_id = TO_CHAR((convert_timezone(''GMT'',''JST'', stg.createddate)) ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp9 on lkp9.cald_dt_id = TO_CHAR(stg.trtt_end_dt_bms__C ,''YYYYMMDD'')
left outer join jp2a_cdw.D_DSRC LKP7  on upper(LKP7.DSRC_cd)=''INTERACT'' 
where stg.cycl_time_id=$cycl_time_id$ and stg.scen_id=$scen_id$
and stg.actv_flag = 1 and tgt.BP_PRD_RX_ID is null;',1,DATE '2020-04-17','cdwjpetl01',TIMESTAMP '2020-04-17 09:26:38.194','cdwjpetl01',''),
  (60272,'jp2a_cdw.f_bp_prd_rx_fol_up','LEVEL 2','Insert into jp2_int.F_BP_PRD_RX_FOL_UP_temp
(
BP_PRD_RX_ID
,BP_PAR_SK
,BP_SK
,PSET_SK
,FOL_UP_CALD_DT_SK
,PAT_BRD_INATN_CALD_DT_SK
,PLAN_DEVY_CALD_DT_SK
,TRTT_STRT_CALD_DT_SK
,CTRY_CD
,DSRC_SK
,CHLD_ACCT_ID
,REC_TYPE_ID
,FOLUP_NM
,HCP_NM
,INSN_NM
,STG_OF_DIS_NM
,RF_CD
,ACPA_DSG_DS
,BIO_MLCL_USE_DS
,TRTT_LN_DS
,CMBN_MEDC_TXT
,CMPLCTNS_TXT
,MSI_TEST_TIME_TXT
,PAT_CASE_TRC_LINK_TXT
,PAT_CASE_TRC_TXT
,PAT_STA_CMPLCTN_TXT
,EFCT_1ST_LN_TXT
,EFCT_2ND_LN_TXT
,EFCT_3RD_LN_TXT
,EFCT_4TH_LN_TXT
,GNDR_TXT
,PREV_DIS_TXT
,PERD_1ST_LN_TXT
,PERD_2ND_LN_TXT
,PERD_3RD_LN_TXT
,PERD_4TH_LN_TXT 
,RX_LN_TXT
,RX_PATH_TXT
,REGM_1ST_LN_TXT
,REGM_2ND_LN_TXT
,REGM_3RD_LN_TXT
,REGM_4TH_LN_TXT
,SNTVY_POMALIDOMIDE_TXT
,TRTT_HIST_POMALIDOMIDE_TXT
,AGE_NUM
,WT_NUM
,DIS_DUR_CT
,MTX_WKLY_RX_DOSE_CT
,PAT_RX_STRT_DT
,MTX_WKLY_RX_CMB_USE_IND
,diags_ds
,AMT_OF_DEVY_DSG_TXT
,HIGH_RISK_CHROMOSOME_ABNORMALITY_TXT  
,HCP_INTENTION_TXT			 
,PAT_CNF_TXT				
,TRTT_TERMN_REAS_DS			
,SRC_MODF_TS
,SRC_DLT_FLAG
,CYCL_TIME_ID
,SCEN_ID
,INRT_TS
,INRT_BY_NM
,MODF_TS
,MODF_BY_NM
,SRC_CREA_DT_SK
,LGCY_SRC_CREA_DT_SK
,trtt_end_cald_dt_sk
,trtt_expc_prd_txt
,spctby_txt
,rlps_type_txt
,HSTGY_TXT
,PD_L1_STA_TXT
,PREV_TRTT_REGM_TXT
,THER_AREA_TXT

)
SELECT
stg.id as BP_PRD_RX_ID
,Case when stg.Chld_Acct_BMS__c is null then null else coalesce(lkp1.bp_par_sk,-1) end as bp_par_sk
,Case when stg.Chld_Acct_BMS__c is null then null else coalesce(lkp1.bp_sk,-1) end as bp_sk
,Case when stg.prd_bms__c is null then null else coalesce(lkp2.pset_sk,-1) end as pset_sk
,Case when stg.fol_up_dt_bms__C is null then null else coalesce(lkp3.cald_dt_sk,-1) end as FOL_UP_CALD_DT_SK
,Case when stg.ABT_Dose_Dt_BMS__c is null then null else coalesce(lkp4.cald_dt_sk,-1) end as PAT_BRD_INATN_CALD_DT_SK
,Case when stg.plan_devy_dt_bms__c is null then null else coalesce(lkp5.cald_dt_sk,-1) end as PLAN_DEVY_CALD_DT_SK
,Case when stg.trtt_strt_dt_bms__C is null then null else coalesce(lkp6.cald_dt_sk,-1) end as TRTT_STRT_CALD_DT_SK
,''JP''
,coalesce(lkp7.DSRC_SK,-1) as DSRC_SK
,stg.Chld_Acct_BMS__c
,stg.Recordtypeid
,stg.nm
,stg.Chld_Acct_Nm_BMS__c
,stg.Par_Acct_Nm_BMS__c
,stg.Stg_Of_Dis_BMS__c
,stg.RF_BMS__c
,stg.ACPA_BMS__c
,stg.Use_Bio_BMS__c
,stg.Trtt_Ln_BMS__c
,stg.cmbn_medc_bms__c
,stg.complications_bms__c
,stg.msi_test_timing__c as MSI_TEST_TIME_TXT
,stg.MTX_CMB_Use_BMS__c
,stg.Lgcy_Case_Trace_Num_BMS__c
,stg.Complications_BMS__c
,stg.Efct_1st_BMS__c
,stg.Efct_2nd_BMS__c
,stg.Efct_3rd_BMS__c
,stg.Efct_4th_BMS__c
,stg.Gndr_BMS__c
,stg.Trtt_Expc_BMS__c
,stg.Perd_1st_BMS__c
,stg.Perd_2nd_BMS__c
,stg.Perd_3rd_BMS__c
,stg.Perd_4th_BMS__c
,stg.RX_Ln_BMS__c
,stg.RX_Path_BMS__c
,stg.Regm_1st_BMS__c
,stg.Regm_2nd_BMS__c
,stg.Regm_3rd_BMS__c
,stg.Regm_4th_BMS__c
,stg.pomalidomide_susceptibility_bms__c
,stg.pomalidomide_expc_bms__c
,stg.Age_BMS__c
,stg.wt_bms__c
,stg.Dis_Dur_BMS__c
,stg.MTX_Dose_BMS__c
,stg.Trtt_Strt_Dt_BMS__c
,stg.MTX_Cmb_Use_BMS__c
,stg.diags_bms__c								AS diags_ds
,stg.amt_of_devy_dsg_bms__c						AS amt_of_devy_dsg
,stg.high_risk_chromosome_abnormality_bms__c    As HIGH_RISK_CHROMOSOME_ABNLT 
,stg.hcp_intention_bms__c 						AS HCP_Intention
,stg.pat_confirmation_bms__c					AS PAT_CNF				
,stg.trtt_termn_reas_bms__c 					AS TRTT_TERMN_REAS		   
,stg.lastmodifieddate 							AS src_modf_ts
,Case when stg.isdeleted = ''true'' then 1 else 0 end as src_dlt_flag
,stg.CYCL_TIME_ID
,stg.SCEN_ID
,getdate() as INRT_TS
,stg.INRT_BY as INRT_BY_NM
,getdate() as MODF_TS
,''cdwjpetl02''  as MODF_BY_NM
,Case when stg.createddate is null then null else coalesce(lkp8.cald_dt_sk,-1) end as SRC_CREA_DT_SK
,tgt.LGCY_SRC_CREA_DT_SK as LGCY_SRC_CREA_DT_SK
,Case when stg.trtt_end_dt_bms__C is null then null else coalesce(lkp9.cald_dt_sk,-1) end as TRTT_END_CALD_DT_SK
,stg.TRTT_EXPC_PRD_BMS__c as trtt_expc_prd_txt
,stg.susceptibility_BMS__c as spctby_txt
,stg.relapse_Type_BMS__c as rlps_type_txt
,stg.Histology_BMS__c as HSTGY_TXT
,stg.PD_L1_Status_BMS__c AS PD_L1_STA_TXT
,stg.Previous_Treatment_Regiment_BMS__c AS PREV_TRTT_REGM_TXT
,stg.Therapeutic_Area_BMS__c AS THER_AREA_TXT

From jp1a_stg.stg_veeva_pat_rx_fol_up_bms_jp__c stg
left outer join jp2a_cdw.d_chld_acct lkp1 on stg.Chld_Acct_BMS__c = lkp1.CHLD_ACCT_CD
inner join jp2a_cdw.f_bp_prd_rx_fol_up tgt on tgt.BP_PRD_RX_ID = stg.id
left outer join (Select distinct nm, actv_flag , id from  jp1a_stg.stg_veeva_prd_vod__c where isdeleted = ''false'') stg1 on stg1.nm = stg.prd_bms__c and stg1.actv_flag = 1
left outer join jp2a_cdw.xref_prd_item_extl_idnty lkp2 on lkp2.src_prd_id = stg1.id
left outer join jp2a_cdw.d_cald_dt lkp3 on lkp3.cald_dt_id = TO_CHAR(stg.fol_up_dt_bms__c    ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp4 on lkp4.cald_dt_id = TO_CHAR(stg.ABT_Dose_Dt_BMS__c  ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp5 on lkp5.cald_dt_id = TO_CHAR(stg.plan_devy_dt_bms__c ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp6 on lkp6.cald_dt_id = TO_CHAR(stg.trtt_strt_dt_bms__C ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp8 on lkp8.cald_dt_id = TO_CHAR((convert_timezone(''GMT'',''JST'', stg.createddate)) ,''YYYYMMDD'')
left outer join jp2a_cdw.d_cald_dt lkp9 on lkp9.cald_dt_id = TO_CHAR(stg.trtt_end_dt_bms__C ,''YYYYMMDD'')
left outer join jp2a_cdw.D_DSRC LKP7  on upper(LKP7.DSRC_cd)=''INTERACT'' 
where stg.cycl_time_id=$cycl_time_id$ and stg.scen_id=$scen_id$
and stg.actv_flag = 1 ;',1,DATE '2020-04-17','cdwjpetl01',TIMESTAMP '2020-04-17 09:26:39.925','cdwjpetl01',''),
  (70026,'jp_rpt_a.S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY_FOL_UP','LEVEL 3','INSERT INTO jp_rpt_a.S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY_FOL_UP
SELECT 
F.SORG_UNIT_SK            			
,F.PAR_BP_SK               			
,F.BP_SK                   			
,F.PSET_SK  
,F.PRD_GRP_SK                 			
,F.PAT_BRD_INATN_CALD_DT_SK 		
,F.SRC_CREA_DT_SK					
,F.FOL_UP_CALD_DT_SK       			
,F.TRTT_STRT_CALD_DT_SK    			
,F.TRTT_END_CALD_DT_SK     			
,F.PLAN_DEVY_CALD_DT_SK 
,F.TRTT_STRT_CALD_DT_SK AS STRT_CALD_DT_SK 	
,F.BP_PRD_RX_ID             		
,F.bus_unit_cd
,F.DST_CD         
,F.dr_dcf_cd  
,F.DR_SEG_CD           	        	
,F.insn_cd		                	
,F.insn_dcf_dsf_cd              	
,F.insn_sls_chnl_cd	            	
,F.insn_tier_cd					    			
,F.regn_cd           		    	   	
,F.RF_CD  	    	
,F.sls_wrkr_cd  
, F.TERR_CD
,F.bus_unit_lcl_lang_nm
,F.bus_unit_nm   	            	
,F.dst_lcl_lang_nm
,F.DST_NM                   		
,F.dr_nm  
,F.insn_nm                      	      		             		    	
,F.insn_trgt_type_nm 
,F.prd_nm
,F.prd_grp_nm 
,F.regn_lcl_lang_nm
,F.REGN_NM  
,F.sls_wrkr_nm                  	
,F.STG_OF_DIS_NM            		   
, F.TERR_lcl_lang_nm
, F.TERR_NM   
,F.AGE_TXT            		
,F.AMT_OF_DEVY_DSG_TXT	
,F.CMBN_MEDC_TXT
,F.CMPLCTNS_TXT				
,F.EFCT_1ST_LN_TXT 					
,F.EFCT_2ND_LN_TXT 					
,F.EFCT_3RD_LN_TXT 					
,F.EFCT_4TH_LN_TXT 					
,F.GNDR_TXT    
,F.HSTGY_TXT
,F.PD_L1_STA_TXT             		
,F.HCP_INTN_TXT		
,F.HIGH_RISK_CHRMSM_ABNRML_TXT
,F.msi_test_time_txt
,F.MTX_WKLY_RX_CMB_USE_TXT  		
,F.PAT_STA_CMPLCTN_TXT      		
,F.PAT_CNF_TXT 						
,F.PERD_1ST_LN_TXT 					
,F.PERD_2ND_LN_TXT 					
,F.PERD_3RD_LN_TXT 					
,F.PERD_4TH_LN_TXT 	
,F.PREV_DIS_TXT		
,F.PREV_TRTT_REGM_TXT		
,F.REGM_1ST_LN_TXT 					
,F.REGM_2ND_LN_TXT 					
,F.REGM_3RD_LN_TXT 					
,F.REGM_4TH_LN_TXT 	
,F.rlps_type_txt				
,F.RX_LN_TXT    
,F.spctby_txt
,F.SNTVY_POMALIDOMIDE_TXT
,F.THER_AREA_TXT
,F.trtt_expc_prd_txt     
,F.TRTT_HIST_POMALIDOMIDE_TXT            		
,F.TRTT_LN_TXT               		
,F.ACPA_DSG_DS              		
,F.BIO_MLCL_USE_DS          		
,F.DIAGS_DS	  	 					
,F.TRTT_TERMN_REAS_DS  				
,F.WT_NUM                   		
,F.DIS_DUR_CT               		
,F.MTX_WKLY_RX_DOSE_CT      		      	
,F.LAST_MODF_TS	
,F.TRGT_IND			
,F.dual_terr_flag 		
,F.CYCL_TIME_ID                 	
,F.SCEN_ID                     	
,F.INRT_TS                      	
,F.INRT_BY_NM                   	
,F.MODF_TS                      	
,F.MODF_BY_NM                   	
,(select coalesce(max(snp_id),0)+1 snp_id from jp_ops.cntl_rpt_snp where upper(tbl_nm)=''S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY_FOL_UP'' and actv_flag=1) AS snp_id   
FROM jp3a_Cdw.S_SORG_SLS_WRKR_BP_PRD_CALD_DT_SRVY_FOL_UP F;',1,DATE '2020-04-17','cdwjpetl01',TIMESTAMP '2020-04-17 09:26:47.330','cdwjpetl01',''),
  (70025,'jp_rpt_a.S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY_FOL_UP','LEVEL 3','INSERT INTO jp3a_Cdw.S_SORG_SLS_WRKR_BP_PRD_CALD_DT_SRVY_FOL_UP
SELECT 
F.SORG_UNIT_SK            			
,F.BP_PAR_SK      as Par_bp_sk          			
,F.BP_SK                   			
,F.PSET_SK  
,F.PRD_GRP_SK                 			
,F.PAT_BRD_INATN_CALD_DT_SK 		
,F.SRC_CREA_DT_SK					
,F.FOL_UP_CALD_DT_SK       			
,F.TRTT_STRT_CALD_DT_SK    			
,F.TRTT_END_CALD_DT_SK     			
,F.PLAN_DEVY_CALD_DT_SK    			
,F.BP_PRD_RX_ID             		
,F.bus_unit_cd
,F.DST_CD         
,F.dr_dcf_cd  
,F.DR_SEG_CD           	        	
,F.insn_cd		                	
,F.insn_dcf_dsf_cd              	
,F.insn_sls_chnl_cd	            	
,F.insn_tier_cd					    			
,F.regn_cd           		    	   	
,F.RF_CD  	    	
,F.sls_wrkr_cd  
, F.terr_cd
,F.bus_unit_lcl_nm   as      bus_unit_lcl_lang_nm
,F.bus_unit_nm   	            	
,F.dst_lcl_nm   as dst_lcl_lang_nm
,F.DST_NM                   		
,F.dr_nm  
,F.insn_nm                      	      		             		    	
,F.insn_trgt_type_nm 
,F.prd_nm
,F.prd_grp_nm 
,F.REGN_lcl_NM as regn_lcl_lang_nm
,F.REGN_NM  
,F.sls_wrkr_nm                  	
,F.STG_OF_DIS_NM 
, f.terr_lcl_nm as terr_lcl_lang_nm    
, f.terr_nm 
,F.AGE_TXT                  		
,F.AMT_OF_DEVY_DSG_TXT	
,F.CMBN_MEDC_TXT
,F.CMPLCTNS_TXT			
,F.EFCT_1ST_LN_TXT 					
,F.EFCT_2ND_LN_TXT 					
,F.EFCT_3RD_LN_TXT 					
,F.EFCT_4TH_LN_TXT 					
,F.GNDR_TXT   
,F.HSTGY_TXT
,F.PD_L1_STA_TXT               		
,F.HCP_INTENTION_TXT	as 	HCP_INTN_TXT		
,F.HIGH_RISK_CHROMOSOME_ABNORMALITY_TXT  as 	HIGH_RISK_CHRMSM_ABNRML_TXT
,F.msi_test_time_txt
,F.MTX_WKLY_RX_CMB_USE_TXT  		
,F.PAT_STA_CMPLCTN_TXT      		
,F.PAT_CNF_TXT 						
,F.PERD_1ST_LN_TXT 					
,F.PERD_2ND_LN_TXT 					
,F.PERD_3RD_LN_TXT 					
,F.PERD_4TH_LN_TXT 	
,F.PREV_DIS_TXT		
,F.PREV_TRTT_REGM_TXT		
,F.REGM_1ST_LN_TXT 					
,F.REGM_2ND_LN_TXT 					
,F.REGM_3RD_LN_TXT 					
,F.REGM_4TH_LN_TXT 	
,F.rlps_type_txt				
,F.RX_LN_TXT    
,F.spctby_txt
,F.SNTVY_POMALIDOMIDE_TXT
,F.THER_AREA_TXT
,F.trtt_expc_prd_txt     
,F.TRTT_HIST_POMALIDOMIDE_TXT       		
,F.TRTT_LN_TXT               		
,F.ACPA_DSG_DS              		
,F.BIO_MLCL_USE_DS          		
,F.DIAGS_DS	  	 					
,F.TRTT_TERMN_REAS_DS  				
,F.WT_NUM                   		
,F.DIS_DUR_CT               		
,F.MTX_WKLY_RX_DOSE_CT      		      	
,F.LAST_MODF_TS	
,F.TRGT_IND		
,F.SLS_WRKR_DUAL_FLAG AS   dual_terr_flag 	, 				
$cycl_time_id$ 					AS cycl_time_id,
$scen_id$ 						AS scen_id,  
GETDATE() 						AS inrt_ts,
''$inrt_by$'' 					AS inrt_by_nm,  
GETDATE() 						AS modf_ts,
''$inrt_by$'' 					AS modf_by_nm
FROM jp2_int.ITMD_4_S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY_FOL_UP F ;',1,DATE '2020-04-17','cdwjpetl01',TIMESTAMP '2020-04-17 09:26:45.486','cdwjpetl01',''),
  (70023,'jp_rpt_a.S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY_FOL_UP','LEVEL 3','INSERT INTO jp2_int.ITMD_3_S_SORG_SLS_WRKR_BP_PRD_TIME_BCKT_SRVY_FOL_UP
SELECT 
bpct.bp_par_sk						AS BP_PAR_SK, 
bpct.bp_sk							AS BP_SK, 
CASE  when rlup.pset_sk =319 then dp2.pset_sk
WHEN rlup.pset_sk IS NOT NULL THEN rlup.pset_sk ELSE dp.pset_sk END AS pset_sk,
case when rlup.pset_sk =319 then dp.pset_sk
when dp2.pset_sk is null then nvl(rlup.pset_sk,dp.pset_sk) else  dp2.pset_sk  end as prd_grp_sk, 
bpct.PAT_BRD_INATN_CALD_DT_SK		AS PAT_BRD_INATN_CALD_DT_SK,
bpct.src_crea_dt_sk					AS src_crea_dt_sk,
bpct.FOL_UP_CALD_DT_SK				AS FOL_UP_CALD_DT_SK, 
bpct.TRTT_STRT_CALD_DT_SK			AS TRTT_STRT_CALD_DT_SK,
bpct.TRTT_END_CALD_DT_SK			AS TRTT_END_CALD_DT_SK,
bpct.PLAN_DEVY_CALD_DT_SK			AS PLAN_DEVY_CALD_DT_SK,  
bpct.folup_nm						AS BP_PRD_RX_ID, 
bpct.RF_CD							AS RF_CD,
bpct.STG_OF_DIS_NM		           	AS STG_OF_DIS_NM,
bpct.AGE_NUM						AS AGE_TXT,
Case when dp3.prd_ds=''EMPLICITI'' then bpct.AMT_OF_DEVY_DSG_TXT else  bpct.rx_path_txt 	end AS AMT_OF_DEVY_DSG_TXT ,  
bpct.CMBN_MEDC_TXT					AS CMBN_MEDC_TXT,
bpct.CMPLCTNS_TXT					AS CMPLCTNS_TXT,
bpct.EFCT_1ST_LN_TXT				AS EFCT_1ST_LN_TXT,
bpct.EFCT_2ND_LN_TXT				AS EFCT_2ND_LN_TXT,
bpct.EFCT_3RD_LN_TXT				AS EFCT_3RD_LN_TXT,
bpct.EFCT_4TH_LN_TXT				AS EFCT_4TH_LN_TXT,
bpct.GNDR_TXT						AS GNDR_TXT,
bpct.HSTGY_TXT						AS HSTGY_TXT,
bpct.PD_L1_STA_TXT					AS PD_L1_STA_TXT,
bpct.HCP_INTENTION_TXT				AS HCP_INTENTION_TXT,  		 -- HCP_      ??
bpct.HIGH_RISK_CHROMOSOME_ABNORMALITY_TXT		AS HIGH_RISK_CHROMOSOME_ABNORMALITY_TXT,
bpct.msi_test_time_txt as msi_test_time_txt,
bpct.MTX_WKLY_RX_CMB_USE_IND		AS MTX_WKLY_RX_CMB_USE_TXT,
bpct.PAT_STA_CMPLCTN_TXT	 		AS PAT_STA_CMPLCTN_TXT,
bpct.PAT_CNF_TXT					AS PAT_CNF_TXT,  -- PAT_CNF
bpct.PERD_1ST_LN_TXT				AS PERD_1ST_LN_TXT,
bpct.PERD_2ND_LN_TXT				AS PERD_2ND_LN_TXT,
bpct.PERD_3RD_LN_TXT				AS PERD_3RD_LN_TXT,
bpct.PERD_4TH_LN_TXT				AS PERD_4TH_LN_TXT,
bpct.PREV_DIS_TXT					AS PREV_DIS_TXT,
bpct.PREV_TRTT_REGM_TXT				AS PREV_TRTT_REGM_TXT,

bpct.REGM_1ST_LN_TXT				AS REGM_1ST_LN_TXT,
bpct.REGM_2ND_LN_TXT				AS REGM_2ND_LN_TXT,
bpct.REGM_3RD_LN_TXT				AS REGM_3RD_LN_TXT,
bpct.REGM_4TH_LN_TXT				AS REGM_4TH_LN_TXT,
bpct.rlps_type_txt 					AS rlps_type_txt,
bpct.RX_LN_TXT 						AS RX_LN_TXT ,
bpct.spctby_txt						AS spctby_txt,
bpct.SNTVY_POMALIDOMIDE_TXT 		AS SNTVY_POMALIDOMIDE_TXT,
bpct.THER_AREA_TXT					AS THER_AREA_TXT,
bpct.trtt_expc_prd_txt				AS trtt_expc_prd_txt,
bpct.TRTT_HIST_POMALIDOMIDE_TXT		AS TRTT_HIST_POMALIDOMIDE_TXT,
bpct.TRTT_LN_DS 					AS TRTT_LN_DS,--> current prescription line 
bpct.ACPA_DSG_DS					AS ACPA_DSG_DS,
bpct.BIO_MLCL_USE_DS				AS BIO_MLCL_USE_DS,
bpct.DIAGS_DS						AS DIAGS_DS,
bpct.TRTT_TERMN_REAS_DS				AS TRTT_TERMN_REAS_DS,  	-- TRTT_TERMN_REAS
bpct.WT_NUM							AS WT_NUM,
bpct.DIS_DUR_CT						AS DIS_DUR_CT,
bpct.MTX_WKLY_RX_DOSE_CT			AS MTX_WKLY_RX_DOSE_CT,
bpct.SRC_MODF_TS					AS LAST_MODF_TS
FROM jp2a_cdw.F_BP_PRD_RX_FOL_UP bpct
inner join jp2a_cdw.d_pset dp on dp.pset_sk=bpct.pset_sk
left outer join jp2_int.rpt_prd_rolup_atvy_temp rlup on bpct.pset_sk=rlup.prd_brd_grp_sk 	
left outer join jp2a_cdw.d_pset dp3  on (CASE WHEN rlup.pset_sk IS NOT NULL THEN rlup.pset_sk ELSE dp.pset_sk END) = dp3.pset_sk 
left outer join jp_ops.m_pset_prd_grp  pg on dp3.pset_id = pg.pset_id and pg.subj_area_nm=''patient''   
left outer join jp2a_cdw.d_pset dp2  on pg.prd_grp_id = dp2.pset_id
Where  src_dlt_flag=0;',1,DATE '2020-04-17','cdwjpetl01',TIMESTAMP '2020-04-17 09:26:41.687','cdwjpetl01','');
