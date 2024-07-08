#------------------------[3] race

# Tabla de frecuencias
freq_table_race <- table(database$race)

# Convertir la tabla de frecuencias en un data frame 
freq_df_race <- as.data.frame(freq_table_race)

# Crear el gráfico de barras
barplot(freq_df_race$Freq, 
        names.arg = freq_df_race$Var1, 
        main = "Race distribution", 
        xlab = "Race", 
        ylab = "Frequency", 
        col = "red",
        las = 3,  #Mayor legibilidad
        cex.names = 0.6) #Ajustar texto eje x


#------------------------[4] gender
#Comienzo a usar attach(database)
freq_table_gender <- table(gender)

freq_df_gender <- as.data.frame(freq_table_gender)

barplot(freq_df_gender$Freq,
       names.arg = freq_df_gender$gender, 
       main = "Gender Distribution", 
       xlab = "Gender", 
       ylab = "Frequency", 
       col = "orange",
       las = 3 ,
       cex.names = 0.6)

#-------------------------[5] age
freq_table_age <- table(age)

freq_df_age <- as.data.frame(freq_table_age)

barplot(freq_df_age$Freq,
        names.arg = freq_df_age$age, 
        main = "Age Distribution", 
        xlab = "Age", 
        ylab = "Frequency", 
        col = "purple",
        las = 3 ,  
        cex.names = 0.6)

#-------------------------[6] weight *DESCARTAR ? > %90*
freq_table_weight <- table(database$weight)

freq_df_weight <- as.data.frame(freq_table_weight)

barplot(freq_df_weight$Freq, 
        names.arg = freq_df_weight$Var1, 
        main = "Weight distribution", 
        xlab = "Range", 
        ylab = "Frequency", 
        col = "blue",
        las = 3)

#-------------------------[7] admission_type_id 
freq_table_admission_type_id <- table(admission_type_id)
freq_df_admission_type_id <- as.data.frame(freq_table_admission_type_id)

barplot(freq_df_admission_type_id$Freq, 
        names.arg = freq_df_admission_type_id$admission_type_id, 
        main = "admission_type_id distribution", 
        xlab = "admission_type_id", 
        ylab = "Frequency", 
        col = "black",
        las = 3)

#-------------------------[8] discharge_disposition_id
freq_table_discharge_disposition_id <- table(discharge_disposition_id)
freq_df_discharge_disposition_id <- as.data.frame(freq_table_discharge_disposition_id)

barplot(freq_df_discharge_disposition_id$Freq, 
        names.arg = freq_df_discharge_disposition_id$discharge_disposition_id, 
        main = "discharge_disposition_id distribution", 
        xlab = "discharge_disposition_id", 
        ylab = "Frequency", 
        col = "pink",
        las = 3)

#-------------------------[9] admission_source_id
freq_table_admission_source_id <- table(admission_source_id)
freq_df_admission_source_id <- as.data.frame(freq_table_admission_source_id)

barplot(freq_df_admission_source_id$Freq, 
        names.arg = freq_df_admission_source_id$admission_source_id, 
        main = "admission_source_id distribution", 
        xlab = "admission_source_id", 
        ylab = "Frequency", 
        col = "yellow",
        las = 3)
#-------------------------[10] time_in_hospital
freq_table_time_in_hospital <- table(time_in_hospital)
freq_df_time_in_hospital <- as.data.frame(freq_table_time_in_hospital)

barplot(freq_df_time_in_hospital$Freq, 
        names.arg = freq_df_time_in_hospital$time_in_hospital, 
        main = "time_in_hospital Distribution", 
        xlab = "Hospital Stay Duration", 
        ylab = "Frequency", 
        col = "lightblue",
        las = 3)

#-------------------------[11] payer_code *OMITIR ? >30%*
freq_table_payer_code <- table(payer_code)
freq_df_payer_code <- as.data.frame(freq_table_payer_code)

barplot(freq_df_payer_code$Freq, 
        names.arg = freq_df_payer_code$payer_code, 
        main = "payer_code Distribution", 
        xlab = "Insurance Options", 
        ylab = "Frequency", 
        col = "brown",
        las = 3)


#-------------------------[12] medical_specialty *OMITIR ? > %45*
freq_table_medical_specialty <- table(medical_specialty)
freq_df_medical_specialty <- as.data.frame(freq_table_medical_specialty)

barplot(freq_df_medical_specialty$Freq, 
        names.arg = freq_df_medical_specialty$medical_specialty, 
        main = "medical_specialty Distribution", 
        xlab = "Specialty", 
        ylab = "Frequency", 
        col = "green",
        las = 3,  
        cex.names = 0.4)

#-------------------------[13] num_lab_procedures
freq_table_num_lab_procedures <- table(num_lab_procedures)
freq_df_num_lab_procedures <- as.data.frame(freq_table_num_lab_procedures)

barplot(freq_df_num_lab_procedures$Freq, 
        names.arg = freq_df_num_lab_procedures$num_lab_procedures, 
        main = "num_lab_procedures Distribution", 
        xlab = "Number of lab tests performed during the encounter", 
        ylab = "Frequency", 
        col = "beige",
        las = 3,  
        cex.names = 0.6)
#-------------------------[14] num_procedures
freq_table_num_procedures <- table(num_procedures)
freq_df_num_procedures <- as.data.frame(freq_table_num_procedures)

barplot(freq_df_num_procedures$Freq, 
        names.arg = freq_df_num_procedures$num_procedures, 
        main = "num_procedures Distribution", 
        xlab = "Number of procedures (other than lab tests) performed during the encounter", 
        ylab = "Frequency", 
        col = "orchid",
        las = 3,  
        cex.names = 0.6)
#-------------------------[15] num_medications
freq_table_num_medications <- table(num_medications)
freq_df_num_medications<- as.data.frame(freq_table_num_medications)

barplot(freq_df_num_medications$Freq, 
        names.arg = freq_df_num_medications$num_medications, 
        main = "num_medications Distribution", 
        xlab = "Number of distinct generic names administered during the encounter", 
        ylab = "Frequency", 
        col = "tomato3",
        las = 3,  
        cex.names = 0.6)
#-------------------------[16] number_outpatient
freq_table_number_outpatient <- table(number_outpatient)
freq_df_number_outpatient<- as.data.frame(freq_table_number_outpatient)

barplot(freq_df_number_outpatient$Freq, 
        names.arg = freq_df_number_outpatient$number_outpatient, 
        main = "number_outpatient Distribution", 
        xlab = "Number of outpatient visits of the patient in the year preceding the encounter", 
        ylab = "Frequency", 
        col = "hotpink3",
        las = 3)
#-------------------------[17] number_emergency
freq_table_number_emergency <- table(number_emergency)
freq_df_number_emergency<- as.data.frame(freq_table_number_emergency)

barplot(freq_df_number_emergency$Freq, 
        names.arg = freq_df_number_emergency$number_emergency, 
        main = "number_emergency Distribution", 
        xlab = "Number of emergency visits of the patient in the year preceding the encounter", 
        ylab = "Frequency", 
        col = "gold",
        las = 3)

#-------------------------[18] number_inpatient
freq_table_number_inpatient <- table(number_inpatient)
freq_df_number_inpatient<- as.data.frame(freq_table_number_inpatient)

barplot(freq_df_number_inpatient$Freq, 
        names.arg = freq_df_number_inpatient$number_inpatient, 
        main = "number_inpatient Distribution", 
        xlab = "Number of inpatient visits of the patient in the year preceding the encounter", 
        ylab = "Frequency", 
        col = "magenta3",
        las = 3)
#-------------------------[19] diag_1 *CONSIDERAR*
freq_table_diag_1 <- table(diag_1)
freq_df_diag_1<- as.data.frame(freq_table_diag_1)

barplot(freq_df_diag_1$Freq, 
        names.arg = freq_df_diag_1$diag_1, 
        main = "diag_1 Distribution", 
        xlab = "The primary diagnosis (coded as first three digits of ICD9); 848 distinct values", 
        ylab = "Frequency", 
        col = "lightcyan",
        las = 3)
#-------------------------[20] diag_2 *CONSIDERAR*
freq_table_diag_2 <- table(diag_2)
freq_df_diag_2<- as.data.frame(freq_table_diag_2)

barplot(freq_df_diag_2$Freq, 
        names.arg = freq_df_diag_2$diag_2, 
        main = "diag_2 Distribution", 
        xlab = "Secondary diagnosis", 
        ylab = "Frequency", 
        col = "orchid3",
        las = 3)

#-------------------------[21] diag_3 *CONSIDERAR*
freq_table_diag_3<- table(diag_3)
freq_df_diag_3<- as.data.frame(freq_table_diag_3)

barplot(freq_df_diag_3$Freq, 
        names.arg = freq_df_diag_3$diag_3, 
        main = "diag_3 Distribution", 
        xlab = "Additional secondary diagnosis", 
        ylab = "Frequency", 
        col = "red4",
        las = 3)


#-------------------------[22] number_diagnoses
freq_table_number_diagnoses<- table(number_diagnoses)
freq_df_number_diagnoses<- as.data.frame(freq_table_number_diagnoses)

barplot(freq_df_number_diagnoses$Freq, 
        names.arg = freq_df_number_diagnoses$number_diagnoses, 
        main = "number_diagnoses Distribution", 
        xlab = "Number of diagnoses entered to the system", 
        ylab = "Frequency", 
        col = "salmon",
        las = 3)

#-------------------------[23] max_glu_serum *CONSIDERAR*
freq_table_max_glu_serum<- table(max_glu_serum)
freq_df_max_glu_serum<- as.data.frame(freq_table_max_glu_serum)

barplot(freq_df_max_glu_serum$Freq, 
        names.arg = freq_df_max_glu_serum$max_glu_serum, 
        main = "max_glu_serum Distribution", 
        xlab = "Indicates the range of the result or if the test was not taken.", 
        ylab = "Frequency", 
        col = "salmon3",
        las = 3)
#-------------------------[24] A1Cresult *CONSIDERAR*
freq_table_A1Cresult<- table(A1Cresult)
freq_df_A1Cresult<- as.data.frame(freq_table_A1Cresult)

barplot(freq_df_A1Cresult$Freq, 
        names.arg = freq_df_A1Cresult$A1Cresult, 
        main = "A1Cresult Distribution", 
        xlab = "Indicates the range of the result or if the test was not taken.", 
        ylab = "Frequency", 
        col = "salmon4",
        las = 3)
#-------------------------[25] metformin
freq_table_metformin<- table(metformin)
freq_df_metformin<- as.data.frame(freq_table_metformin)

barplot(freq_df_metformin$Freq, 
        names.arg = freq_df_metformin$metformin, 
        main = "metformin Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "salmon2",
        las = 3,
        cex.names = 0.7)

#-------------------------[26] repaglinide
freq_table_repaglinide<- table(repaglinide)
freq_df_repaglinide<- as.data.frame(freq_table_repaglinide)

barplot(freq_df_repaglinide$Freq, 
        names.arg = freq_df_repaglinide$repaglinide, 
        main = "repaglinide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "mistyrose",
        las = 3,
        cex.names = 0.7)
#-------------------------[27] nateglinide
freq_table_nateglinide<- table(nateglinide)
freq_df_nateglinide<- as.data.frame(freq_table_nateglinide)


barplot(freq_df_nateglinide$Freq, 
        names.arg = freq_df_nateglinide$nateglinide, 
        main = "nateglinide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "mistyrose2",
        las = 3,
        cex.names = 0.7)

#-------------------------[28] chlorpropamide
freq_table_chlorpropamide<- table(chlorpropamide)
freq_df_chlorpropamide<- as.data.frame(freq_table_chlorpropamide)


barplot(freq_df_chlorpropamide$Freq, 
        names.arg = freq_df_chlorpropamide$chlorpropamide, 
        main = "chlorpropamide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "mistyrose3",
        las = 3,
        cex.names = 0.7)
#-------------------------[29] glimepiride * + variacion
freq_table_glimepiride<- table(glimepiride)
freq_df_glimepiride<- as.data.frame(freq_table_glimepiride)


barplot(freq_df_glimepiride$Freq, 
        names.arg = freq_df_glimepiride$glimepiride, 
        main = "glimepiride Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "mistyrose4",
        las = 3,
        cex.names = 0.7)
#-------------------------[30] acetohexamide
freq_table_acetohexamide<- table(acetohexamide)
freq_df_acetohexamide<- as.data.frame(freq_table_acetohexamide)


barplot(freq_df_acetohexamide$Freq, 
        names.arg = freq_df_acetohexamide$acetohexamide, 
        main = "acetohexamide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "blue3",
        las = 3,
        cex.names = 0.7)
#-------------------------[31] glipizide * + variacion
freq_table_glipizide<- table(glipizide)
freq_df_glipizide<- as.data.frame(freq_table_glipizide)


barplot(freq_df_glipizide$Freq, 
        names.arg = freq_df_glipizide$glipizide, 
        main = "glipizide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "blue4",
        las = 3,
        cex.names = 0.7)
#-------------------------[32] glyburide * + variacion
freq_table_glyburide<- table(glyburide)
freq_df_glyburide<- as.data.frame(freq_table_glyburide)


barplot(freq_df_glyburide$Freq, 
        names.arg = freq_df_glyburide$glyburide, 
        main = "glyburide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "purple1",
        las = 3,
        cex.names = 0.7)
#-------------------------[33] tolbutamide
freq_table_tolbutamide<- table(tolbutamide)
freq_df_tolbutamide<- as.data.frame(freq_table_tolbutamide)


barplot(freq_df_tolbutamide$Freq, 
        names.arg = freq_df_tolbutamide$tolbutamide, 
        main = "tolbutamide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "purple2",
        las = 3,
        cex.names = 0.7)
#-------------------------[34] pioglitazone * + variacion
freq_table_pioglitazone<- table(pioglitazone)
freq_df_pioglitazone<- as.data.frame(freq_table_pioglitazone)


barplot(freq_df_pioglitazone$Freq, 
        names.arg = freq_df_pioglitazone$pioglitazone, 
        main = "pioglitazone Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "purple3",
        las = 3,
        cex.names = 0.7)
#-------------------------[35] rosiglitazone * + variacion
freq_table_rosiglitazone<- table(rosiglitazone)
freq_df_rosiglitazone<- as.data.frame(freq_table_rosiglitazone)


barplot(freq_df_rosiglitazone$Freq, 
        names.arg = freq_df_rosiglitazone$rosiglitazone, 
        main = "rosiglitazone Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "purple4",
        las = 3,
        cex.names = 0.7)
#-------------------------[36] acarbose
freq_table_acarbose<- table(acarbose)
freq_df_acarbose<- as.data.frame(freq_table_acarbose)


barplot(freq_df_acarbose$Freq, 
        names.arg = freq_df_acarbose$acarbose, 
        main = "acarbose Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "green2",
        las = 3,
        cex.names = 0.7)
#-------------------------[37] miglitol
freq_table_miglitol<- table(miglitol)
freq_df_miglitol<- as.data.frame(freq_table_miglitol)


barplot(freq_df_miglitol$Freq, 
        names.arg = freq_df_miglitol$miglitol, 
        main = "miglitol Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "green3",
        las = 3,
        cex.names = 0.7)
#-------------------------[38] troglitazone
freq_table_troglitazone<- table(troglitazone)
freq_df_troglitazone<- as.data.frame(freq_table_troglitazone)


barplot(freq_df_troglitazone$Freq, 
        names.arg = freq_df_troglitazone$troglitazone, 
        main = "troglitazone Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "green4",
        las = 3,
        cex.names = 0.7)
#-------------------------[39] tolazamide
freq_table_tolazamide<- table(tolazamide)
freq_df_tolazamide<- as.data.frame(freq_table_tolazamide)


barplot(freq_df_tolazamide$Freq, 
        names.arg = freq_df_tolazamide$tolazamide, 
        main = "tolazamide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "orange2",
        las = 3,
        cex.names = 0.7)
#-------------------------[40] examide
freq_table_examide<- table(examide)
freq_df_examide<- as.data.frame(freq_table_examide)


barplot(freq_df_examide$Freq, 
        names.arg = freq_df_examide$examide, 
        main = "examide Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "orange3",
        las = 3,
        cex.names = 0.7)
#-------------------------[41] citoglipton
freq_table_citoglipton<- table(citoglipton)
freq_df_citoglipton<- as.data.frame(freq_table_citoglipton)


barplot(freq_df_citoglipton$Freq, 
        names.arg = freq_df_citoglipton$citoglipton, 
        main = "citoglipton Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "orange4",
        las = 3,
        cex.names = 0.7)
#-------------------------[42] insulin
freq_table_insulin<- table(insulin)
freq_df_insulin<- as.data.frame(freq_table_insulin)


barplot(freq_df_insulin$Freq, 
        names.arg = freq_df_insulin$insulin, 
        main = "insulin Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "chocolate",
        las = 3,
        cex.names = 0.7)
#-------------------------[43] glyburide.metformin
freq_table_glyburide.metformin<- table(glyburide.metformin)
freq_df_glyburide.metformin<- as.data.frame(freq_table_glyburide.metformin)


barplot(freq_df_glyburide.metformin$Freq, 
        names.arg = freq_df_glyburide.metformin$glyburide.metformin, 
        main = "glyburide.metformin Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "chocolate2",
        las = 3,
        cex.names = 0.7)
#-------------------------[44] glipizide.metformin
freq_table_glipizide.metformin<- table(glipizide.metformin)
freq_df_glipizide.metformin<- as.data.frame(freq_table_glipizide.metformin)


barplot(freq_df_glipizide.metformin$Freq, 
        names.arg = freq_df_glipizide.metformin$glipizide.metformin, 
        main = "glipizide.metformin Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "chocolate3",
        las = 3,
        cex.names = 0.7)
#-------------------------[45] glimepiride.pioglitazone
freq_table_glimepiride.pioglitazone<- table(glimepiride.pioglitazone)
freq_df_glimepiride.pioglitazone<- as.data.frame(freq_table_glimepiride.pioglitazone)


barplot(freq_df_glimepiride.pioglitazone$Freq, 
        names.arg = freq_df_glimepiride.pioglitazone$glimepiride.pioglitazone, 
        main = "glimepiride.pioglitazone Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "chocolate4",
        las = 3,
        cex.names = 0.7)
#-------------------------[46] metformin.rosiglitazone
freq_table_metformin.rosiglitazone<- table(metformin.rosiglitazone)
freq_df_metformin.rosiglitazone<- as.data.frame(freq_table_metformin.rosiglitazone)


barplot(freq_df_metformin.rosiglitazone$Freq, 
        names.arg = freq_df_metformin.rosiglitazone$metformin.rosiglitazone, 
        main = "metformin.rosiglitazone Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "deepskyblue",
        las = 3,
        cex.names = 0.7)
#-------------------------[47] metformin.pioglitazone
freq_table_metformin.pioglitazone<- table(metformin.pioglitazone)
freq_df_metformin.pioglitazone<- as.data.frame(freq_table_metformin.pioglitazone)


barplot(freq_df_metformin.pioglitazone$Freq, 
        names.arg = freq_df_metformin.pioglitazone$metformin.pioglitazone, 
        main = "metformin.pioglitazone Distribution", 
        xlab = "Indicates whether the drug was prescribed or there was a change in the dosage.", 
        ylab = "Frequency", 
        col = "deepskyblue2",
        las = 3,
        cex.names = 0.7)
#-------------------------[48] change
freq_table_change<- table(change)
freq_df_change<- as.data.frame(freq_table_change)


barplot(freq_df_change$Freq, 
        names.arg = freq_df_change$change, 
        main = "change Distribution", 
        xlab = "Indicates if there was a change in diabetic medications ", 
        ylab = "Frequency", 
        col = "deepskyblue2",
        las = 3,
        cex.names = 0.7)
#-------------------------[49] diabetesMed
freq_table_diabetesMed<- table(diabetesMed)
freq_df_diabetesMed<- as.data.frame(freq_table_diabetesMed)


barplot(freq_df_diabetesMed$Freq, 
        names.arg = freq_df_diabetesMed$diabetesMed, 
        main = "diabetesMed Distribution", 
        xlab = "Indicates if there was any diabetic medication prescribed", 
        ylab = "Frequency", 
        col = "deepskyblue3",
        las = 3,
        cex.names = 0.7)
#-------------------------[50] readmitted
freq_table_readmitted<- table(readmitted)
freq_df_readmitted<- as.data.frame(freq_table_readmitted)


barplot(freq_df_readmitted$Freq, 
        names.arg = freq_df_readmitted$readmitted, 
        main = "readmitted Distribution", 
        xlab = "Days to inpatient readmission", 
        ylab = "Frequency", 
        col = "sienna",
        las = 3)










