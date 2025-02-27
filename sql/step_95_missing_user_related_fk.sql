ALTER TABLE OH_ADMISSION 
ADD INDEX FK_ADMISSION_USER_IDX (ADM_USR_ID_A ASC) VISIBLE;

ALTER TABLE OH_ADMISSION 
ADD CONSTRAINT FK_ADMISSION_USER
  FOREIGN KEY (ADM_USR_ID_A)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_BILLPAYMENTS 
ADD INDEX FK_BILLPAYMENTS_USER_IDX (BLP_USR_ID_A ASC) VISIBLE;

ALTER TABLE OH_BILLPAYMENTS 
ADD CONSTRAINT FK_BILLPAYMENTS_USER
  FOREIGN KEY (BLP_USR_ID_A)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  

ALTER TABLE OH_BILLS 
ADD INDEX FK_BILLS_USER_IDX (BLL_USR_ID_A ASC) VISIBLE;

ALTER TABLE OH_BILLS 
ADD CONSTRAINT FK_BILLS_USER
  FOREIGN KEY (BLL_USR_ID_A)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE OH_OPD 
ADD INDEX FK_OPD_USER_IDX (OPD_USR_ID_A ASC) VISIBLE;

ALTER TABLE OH_OPD 
ADD CONSTRAINT FK_OPD_USER
  FOREIGN KEY (OPD_USR_ID_A)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE OH_SESSION_AUDIT
DROP FOREIGN KEY OH_SESSION_AUDIT_IBFK_1;

ALTER TABLE OH_SESSION_AUDIT
ADD CONSTRAINT FK_SESSION_AUDIT_USER
    FOREIGN KEY (SEA_US_ID_A)
    REFERENCES OH_USER (US_ID_A)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
ALTER TABLE OH_ADMISSION 
ADD INDEX FK_ADMISSION_CREATED_BY_IDX (ADM_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_ADMISSION 
ADD CONSTRAINT FK_ADMISSION_CREATED_BY
  FOREIGN KEY (ADM_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_ADMISSIONTYPE 
ADD INDEX FK_ADMISSIONTYPE_CREATED_BY_IDX (ADMT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_ADMISSIONTYPE 
ADD CONSTRAINT FK_ADMISSIONTYPE_CREATED_BY
  FOREIGN KEY (ADMT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_AGETYPE 
ADD INDEX FK_AGETYPE_CREATED_BY_IDX (AT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_AGETYPE 
ADD CONSTRAINT FK_AGETYPE_CREATED_BY
  FOREIGN KEY (AT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_BILLITEMS 
ADD INDEX FK_BILLITEMS_CREATED_BY_IDX (BLI_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_BILLITEMS 
ADD CONSTRAINT FK_BILLITEMS_CREATED_BY
  FOREIGN KEY (BLI_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_BILLPAYMENTS 
ADD INDEX FK_BILLPAYMENTS_CREATED_BY_IDX (BLP_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_BILLPAYMENTS 
ADD CONSTRAINT FK_BILLPAYMENTS_CREATED_BY
  FOREIGN KEY (BLP_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_BILLS 
ADD INDEX FK_BILLS_CREATED_BY_IDX (BLL_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_BILLS 
ADD CONSTRAINT FK_BILLS_CREATED_BY
  FOREIGN KEY (BLL_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_DELIVERYRESULTTYPE 
ADD INDEX FK_DELIVERYRESULTTYPE_CREATED_BY_IDX (DRT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_DELIVERYRESULTTYPE 
ADD CONSTRAINT FK_DELIVERYRESULTTYPE_CREATED_BY
  FOREIGN KEY (DRT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_DELIVERYTYPE 
ADD INDEX FK_DELIVERYTYPE_CREATED_BY_IDX (DLT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_DELIVERYTYPE 
ADD CONSTRAINT FK_DELIVERYTYPE_CREATED_BY
  FOREIGN KEY (DLT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_DICOM 
ADD INDEX FK_DICOM_CREATED_BY_IDX (DM_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_DICOM 
ADD CONSTRAINT FK_DICOM_CREATED_BY
  FOREIGN KEY (DM_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_DISCHARGETYPE 
ADD INDEX FK_DISCHARGETYPE_CREATED_BY_IDX (DIST_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_DISCHARGETYPE 
ADD CONSTRAINT FK_DISCHARGETYPE_CREATED_BY
  FOREIGN KEY (DIST_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_DISEASE 
ADD INDEX FK_DISEASE_CREATED_BY_IDX (DIS_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_DISEASE 
ADD CONSTRAINT FK_DISEASE_CREATED_BY
  FOREIGN KEY (DIS_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_DISEASETYPE 
ADD INDEX FK_DISEASETYPE_CREATED_BY_IDX (DCL_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_DISEASETYPE 
ADD CONSTRAINT FK_DISEASETYPE_CREATED_BY
  FOREIGN KEY (DCL_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_EXAM 
ADD INDEX FK_EXAM_CREATED_BY_IDX (EXA_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_EXAM 
ADD CONSTRAINT FK_EXAM_CREATED_BY
  FOREIGN KEY (EXA_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_EXAMROW 
ADD INDEX FK_EXAMROW_CREATED_BY_IDX (EXR_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_EXAMROW 
ADD CONSTRAINT FK_EXAMROW_CREATED_BY
  FOREIGN KEY (EXR_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_EXAMTYPE 
ADD INDEX FK_EXAMTYPE_CREATED_BY_IDX (EXC_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_EXAMTYPE 
ADD CONSTRAINT FK_EXAMTYPE_CREATED_BY
  FOREIGN KEY (EXC_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_GROUPMENU 
ADD INDEX FK_GROUPMENU_CREATED_BY_IDX (GM_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_GROUPMENU 
ADD CONSTRAINT FK_GROUPMENU_CREATED_BY
  FOREIGN KEY (GM_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_GROUPPERMISSION 
ADD INDEX FK_GROUPPERMISSION_CREATED_BY_IDX (GP_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_GROUPPERMISSION 
ADD CONSTRAINT FK_GROUPPERMISSION_CREATED_BY
  FOREIGN KEY (GP_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_HOSPITAL 
ADD INDEX FK_HOSPITAL_CREATED_BY_IDX (HOS_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_HOSPITAL 
ADD CONSTRAINT FK_HOSPITAL_CREATED_BY
  FOREIGN KEY (HOS_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_LABORATORY 
ADD INDEX FK_LABORATORY_CREATED_BY_IDX (LAB_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_LABORATORY 
ADD CONSTRAINT FK_LABORATORY_CREATED_BY
  FOREIGN KEY (LAB_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_LABORATORYROW 
ADD INDEX FK_LABORATORYROW_CREATED_BY_IDX (LABR_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_LABORATORYROW 
ADD CONSTRAINT FK_LABORATORYROW_CREATED_BY
  FOREIGN KEY (LABR_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_MALNUTRITIONCONTROL 
ADD INDEX FK_MALNUTRITIONCONTROL_CREATED_BY_IDX (MLN_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_MALNUTRITIONCONTROL 
ADD CONSTRAINT FK_MALNUTRITIONCONTROL_CREATED_BY
  FOREIGN KEY (MLN_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_MEDICALDSR 
ADD INDEX FK_MEDICALDSR_CREATED_BY_IDX (MDSR_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_MEDICALDSR 
ADD CONSTRAINT FK_MEDICALDSR_CREATED_BY
  FOREIGN KEY (MDSR_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_MEDICALDSRLOT 
ADD INDEX FK_MEDICALDSRLOT_CREATED_BY_IDX (LT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_MEDICALDSRLOT 
ADD CONSTRAINT FK_MEDICALDSRLOT_CREATED_BY
  FOREIGN KEY (LT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_MEDICALDSRSTOCKMOV 
ADD INDEX FK_MEDICALDSRSTOCKMOV_CREATED_BY_IDX (MMV_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_MEDICALDSRSTOCKMOV 
ADD CONSTRAINT FK_MEDICALDSRSTOCKMOV_CREATED_BY
  FOREIGN KEY (MMV_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_MEDICALDSRSTOCKMOVTYPE 
ADD INDEX FK_MEDICALDSRSTOCKMOVTYPE_CREATED_BY_IDX (MMVT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_MEDICALDSRSTOCKMOVTYPE 
ADD CONSTRAINT FK_MEDICALDSRSTOCKMOVTYPE_CREATED_BY
  FOREIGN KEY (MMVT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_MEDICALDSRSTOCKMOVWARD 
ADD INDEX FK_MEDICALDSRSTOCKMOVWARD_CREATED_BY_IDX (MMVN_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_MEDICALDSRSTOCKMOVWARD 
ADD CONSTRAINT FK_MEDICALDSRSTOCKMOVWARD_CREATED_BY
  FOREIGN KEY (MMVN_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_MEDICALDSRTYPE 
ADD INDEX FK_MEDICALDSRTYPE_CREATED_BY_IDX (MDSRT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_MEDICALDSRTYPE 
ADD CONSTRAINT FK_MEDICALDSRTYPE_CREATED_BY
  FOREIGN KEY (MDSRT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_MEDICALDSRWARD 
ADD INDEX FK_MEDICALDSRWARD_CREATED_BY_IDX (MDSRWRD_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_MEDICALDSRWARD 
ADD CONSTRAINT FK_MEDICALDSRWARD_CREATED_BY
  FOREIGN KEY (MDSRWRD_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_OPD 
ADD INDEX FK_OPD_CREATED_BY_IDX (OPD_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_OPD 
ADD CONSTRAINT FK_OPD_CREATED_BY
  FOREIGN KEY (OPD_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_OPERATION 
ADD INDEX FK_OPERATION_CREATED_BY_IDX (OPE_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_OPERATION 
ADD CONSTRAINT FK_OPERATION_CREATED_BY
  FOREIGN KEY (OPE_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_OPERATIONROW 
ADD INDEX FK_OPERATIONROW_CREATED_BY_IDX (OPER_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_OPERATIONROW 
ADD CONSTRAINT FK_OPERATIONROW_CREATED_BY
  FOREIGN KEY (OPER_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_OPERATIONTYPE 
ADD INDEX FK_OPERATIONTYPE_CREATED_BY_IDX (OCL_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_OPERATIONTYPE 
ADD CONSTRAINT FK_OPERATIONTYPE_CREATED_BY
  FOREIGN KEY (OCL_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PATIENT 
ADD INDEX FK_PATIENT_CREATED_BY_IDX (PAT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PATIENT 
ADD CONSTRAINT FK_PATIENT_CREATED_BY
  FOREIGN KEY (PAT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PATIENTEXAMINATION 
ADD INDEX FK_PATIENTEXAMINATION_CREATED_BY_IDX (PEX_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PATIENTEXAMINATION 
ADD CONSTRAINT FK_PATIENTEXAMINATION_CREATED_BY
  FOREIGN KEY (PEX_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PATIENTHISTORY 
ADD INDEX FK_PATIENTHISTORY_CREATED_BY_IDX (PAH_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PATIENTHISTORY 
ADD CONSTRAINT FK_PATIENTHISTORY_CREATED_BY
  FOREIGN KEY (PAH_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PATIENTVACCINE 
ADD INDEX FK_PATIENTVACCINE_CREATED_BY_IDX (PAV_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PATIENTVACCINE 
ADD CONSTRAINT FK_PATIENTVACCINE_CREATED_BY
  FOREIGN KEY (PAV_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PERMISSIONS 
ADD INDEX FK_PERMISSIONS_CREATED_BY_IDX (P_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PERMISSIONS 
ADD CONSTRAINT FK_PERMISSIONS_CREATED_BY
  FOREIGN KEY (P_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PREGNANTTREATMENTTYPE 
ADD INDEX FK_PREGNANTTREATMENTTYPE_CREATED_BY_IDX (PTT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PREGNANTTREATMENTTYPE 
ADD CONSTRAINT FK_PREGNANTTREATMENTTYPE_CREATED_BY
  FOREIGN KEY (PTT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PRICELISTS 
ADD INDEX FK_PRICELISTS_CREATED_BY_IDX (LST_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PRICELISTS 
ADD CONSTRAINT FK_PRICELISTS_CREATED_BY
  FOREIGN KEY (LST_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PRICES 
ADD INDEX FK_PRICES_CREATED_BY_IDX (PRC_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PRICES 
ADD CONSTRAINT FK_PRICES_CREATED_BY
  FOREIGN KEY (PRC_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_PRICESOTHERS 
ADD INDEX FK_PRICESOTHERS_CREATED_BY_IDX (OTH_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_PRICESOTHERS 
ADD CONSTRAINT FK_PRICESOTHERS_CREATED_BY
  FOREIGN KEY (OTH_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_SESSION_AUDIT 
ADD INDEX FK_SESSION_AUDIT_CREATED_BY_IDX (SEA_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_SESSION_AUDIT 
ADD CONSTRAINT FK_SESSION_AUDIT_CREATED_BY
  FOREIGN KEY (SEA_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE OH_SUPPLIER 
ADD INDEX FK_SUPPLIER_CREATED_BY_IDX (SUP_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_SUPPLIER 
ADD CONSTRAINT FK_SUPPLIER_CREATED_BY
  FOREIGN KEY (SUP_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_THERAPIES 
ADD INDEX FK_THERAPIES_CREATED_BY_IDX (THR_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_THERAPIES 
ADD CONSTRAINT FK_THERAPIES_CREATED_BY
  FOREIGN KEY (THR_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_USER 
ADD INDEX FK_USER_CREATED_BY_IDX (US_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_USER 
ADD CONSTRAINT FK_USER_CREATED_BY
  FOREIGN KEY (US_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_USERGROUP 
ADD INDEX FK_USERGROUP_CREATED_BY_IDX (UG_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_USERGROUP 
ADD CONSTRAINT FK_USERGROUP_CREATED_BY
  FOREIGN KEY (UG_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_VACCINE 
ADD INDEX FK_VACCINE_CREATED_BY_IDX (VAC_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_VACCINE 
ADD CONSTRAINT FK_VACCINE_CREATED_BY
  FOREIGN KEY (VAC_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_VACCINETYPE 
ADD INDEX FK_VACCINETYPE_CREATED_BY_IDX (VACT_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_VACCINETYPE 
ADD CONSTRAINT FK_VACCINETYPE_CREATED_BY
  FOREIGN KEY (VACT_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_VISITS 
ADD INDEX FK_VISITS_CREATED_BY_IDX (VST_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_VISITS 
ADD CONSTRAINT FK_VISITS_CREATED_BY
  FOREIGN KEY (VST_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE OH_WARD 
ADD INDEX FK_WARD_CREATED_BY_IDX (WRD_CREATED_BY ASC) VISIBLE;

ALTER TABLE OH_WARD 
ADD CONSTRAINT FK_WARD_CREATED_BY
  FOREIGN KEY (WRD_CREATED_BY)
  REFERENCES OH_USER (US_ID_A)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;