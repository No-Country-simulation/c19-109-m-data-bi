#LIMPIEZA DE DATASET
attach(clean_data)
colnames(database)
dim(clean_data)
install.packages(dummies)

#--------Eliminar variables [6], [11], [12],[23],[24],[40] y [41]

clean_data <- database[, -c(6, 11, 12, 23,24,40,41)]
view(clean_data)
write.csv(clean_data, "clean_data.csv", row.names = FALSE)
clean_data = read.csv("clean_data.csv")
 


frecuencia_acetohexamide <- table(acetohexamide)
View(frecuencia_acetohexamide)
clean_data <- subset(clean_data, select = -acetohexamide)
View(clean_data)

frecuencia_tol <- table(tolbutamide)
View(frecuencia_tol)
clean_data <- subset(clean_data, select = -tolbutamide)

frecuencia_tro <- table(troglitazone)
View(frecuencia_tro)

frecuencia_gli <- table(glipizide.metformin)
View(frecuencia_gli)
clean_data <- subset(clean_data, select = -glipizide.metformin)

frecuencia_glip <- table(glimepiride.pioglitazone)
View(frecuencia_glip)
clean_data <- subset(clean_data, select = -glimepiride.pioglitazone)

frecuencia_metr <- table(metformin.rosiglitazone)
View(frecuencia_metr)
clean_data <- subset(clean_data, select = -metformin.rosiglitazone)

frecuencia_metpi <- table(metformin.pioglitazone)
View(frecuencia_metpi)
clean_data <- subset(clean_data, select = -metformin.pioglitazone)

frecuencia_ch <- table(change)
View(frecuencia_ch)

frecuencia_diam <- table(diabetesMed)
View(frecuencia_diam)

frecuencia_met <- table(metformin)
View(frecuencia_met)

frecuencia_rep <- table(repaglinide)
View(frecuencia_rep)

frecuencia_nat <- table(nateglinide)
View(frecuencia_nat)

frecuencia_chl <- table(chlorpropamide)
View(frecuencia_chl)
clean_data <- subset(clean_data, select = -chlorpropamide)

frecuencia_glimp <- table(glimepiride)
View(frecuencia_glimp)

frecuencia_glip <- table(glipizide)
View(frecuencia_glip)

frecuencia_gly <- table(glyburide)
View(frecuencia_gly)

frecuencia_pio <- table(pioglitazone)
View(frecuencia_pio)

frecuencia_rosi <- table(rosiglitazone)
View(frecuencia_rosi)

frecuencia_acarbose <- table(acarbose)
View(frecuencia_acarbose)

frecuencia_mig <- table(miglitol)
View(frecuencia_mig)
clean_data <- subset(clean_data, select = -miglitol)

frecuencia_mig <- table(tolazamide)
View(frecuencia_mig)
clean_data <- subset(clean_data, select = -tolazamide)

frecuencia_insu <- table(insulin)
View(frecuencia_insu)

frecuencia_glym <- table(glyburide.metformin)
View(frecuencia_glym)

frecuencia_race <- table(race)
View(frecuencia_race)

frecuencia_diag1 <- table(diag_1)
View(frecuencia_diag1)
clean_data <- subset(clean_data, select = -diag_1)

frecuencia_diag2 <- table(diag_2)
View(frecuencia_diag2)
clean_data <- subset(clean_data, select = -diag_2)

frecuencia_diag3 <- table(diag_3)
View(frecuencia_diag3)
clean_data <- subset(clean_data, select = -diag_3)

frecuencia_gender <- table(gender)
View(frecuencia_gender)
rm(frecuencia_gender)
clean_data <- subset(clean_data, gender != "Unknown/Invalid")
table(clean_data$gender)

frecuencia_trog <- table(troglitazone)
View(frecuencia_trog)
clean_data <- subset(clean_data, select = -troglitazone)



#---------Reemplazar los signos de interrogación con NA en clean_data
clean_data[] <- lapply(clean_data, function(column) {
  column[column == "?"] <- NA
  return(column)
})

# Verificar los cambios
head(clean_data)


#----------Verificar columnas con NA
num_na_column <- colSums(is.na(clean_data))

print(num_na_column)
columns_with_na <- num_na_column[num_na_column > 0]
num_columns_with_na <- length(columns_with_na)

print(columns_with_na)


#---------Calcular el porcentaje de NA en cada columna
percent_na_column <- sapply(clean_data, function(column) {
  mean(is.na(column)) * 100
})

percent_na_column


#-----Eiminar FILAS/REGISTROS con NA 

clean_data <- na.omit(clean_data)
dim(clean_data)

# verificar el porcentaje eliminado

num_filas_antes <- nrow(database)
num_filas_despues <- nrow(clean_data)

porcentaje_eliminado <- ((num_filas_antes - num_filas_despues) / num_filas_antes) * 100
print(porcentaje_eliminado)

#-----------variables que ya son numericas

identify_numeric_columns <- function(df) {
  numeric_cols <- sapply(df, is.numeric)
  numeric_col_names <- names(df)[numeric_cols]
  return(numeric_col_names)
}

# Imprimir las variables numéricas 
numeric_columns <- identify_numeric_columns(clean_data)
print(numeric_columns)

# ---------Convertir Variables chr a NUMERICOS

# CHANGE
clean_data$change <- ifelse(clean_data$change == "Ch", 1, 0)
View(clean_data)
str(clean_data)

# DIABETESmED
clean_data$diabetesMed <- ifelse(clean_data$diabetesMed == "Yes", 1, 0)
View(clean_data)
str(clean_data)


#---------Convertir variables chr a DUMMY

#+++++++++1. race
# Crear variables dummy para la columna 'race'
dummy_race <- model.matrix(~ race - 1, data = clean_data)
View(dummy_race)

# Añadir las variables dummy a clean_data
clean_data <- cbind(clean_data, dummy_race)
View(clean_data)

# Eliminar la columna original race de clean_data
clean_data$race <- NULL
str(clean_data)

View(clean_data)

#++++++++++++2 gender
dummy_gender <- model.matrix(~ gender - 1, data = clean_data)
View(dummy_gender)
clean_data <- cbind(clean_data, dummy_gender)
View(clean_data)

clean_data$gender <- NULL
str(clean_data)

#++++++++++++3.  age
dummy_age <- model.matrix(~ age - 1, data = clean_data)
View(dummy_age)
clean_data <- cbind(clean_data, dummy_age)
View(clean_data)

clean_data$age <- NULL
str(clean_data)

#++++++++++++4.  metformin
dummy_metformin <- model.matrix(~ metformin - 1, data = clean_data)
View(dummy_metformin)
clean_data <- cbind(clean_data, dummy_metformin)
View(clean_data)

clean_data$metformin <- NULL
str(clean_data)
#++++++++++++5.  repaglinide
dummy_repaglinide <- model.matrix(~ repaglinide - 1, data = clean_data)
View(dummy_repaglinide)
clean_data <- cbind(clean_data, dummy_repaglinide)
View(clean_data)

clean_data$repaglinide <- NULL
str(clean_data)
#++++++++++++6.  nateglinide
dummy_nateglinide <- model.matrix(~ nateglinide - 1, data = clean_data)
View(dummy_nateglinide)
clean_data <- cbind(clean_data, dummy_nateglinide)
View(clean_data)

clean_data$nateglinide <- NULL
str(clean_data)

#++++++++++++7.  glimepiride
dummy_glimepiride <- model.matrix(~ glimepiride - 1, data = clean_data)
View(dummy_glimepiride)
clean_data <- cbind(clean_data, dummy_glimepiride)
View(clean_data)

clean_data$glimepiride <- NULL
str(clean_data)
#++++++++++++8.  glipizide
dummy_glipizide <- model.matrix(~ glipizide - 1, data = clean_data)
View(dummy_glipizide)
clean_data <- cbind(clean_data, dummy_glipizide)
View(clean_data)

clean_data$glipizide <- NULL
str(clean_data)
#++++++++++++9.  glyburide
dummy_glyburide<- model.matrix(~ glyburide - 1, data = clean_data)
View(dummy_glyburide)
clean_data <- cbind(clean_data, dummy_glyburide)
View(clean_data)

clean_data$glyburide<- NULL
str(clean_data)
#++++++++++++10.  pioglitazone
dummy_pioglitazone <- model.matrix(~ pioglitazone - 1, data = clean_data)
View(dummy_pioglitazone)
clean_data <- cbind(clean_data, dummy_pioglitazone)
View(clean_data)

clean_data$pioglitazone <- NULL
str(clean_data)
#++++++++++++11.  rosiglotazone
dummy_rosiglitazone <- model.matrix(~ rosiglitazone - 1, data = clean_data)
View(dummy_rosiglitazone)
clean_data <- cbind(clean_data, dummy_rosiglitazone)
View(clean_data)

clean_data$rosiglitazone<- NULL
str(clean_data)
#++++++++++++12.  acarbose
dummy_acarbose <- model.matrix(~ acarbose - 1, data = clean_data)
View(dummy_acarbose)
clean_data <- cbind(clean_data, dummy_acarbose)
View(clean_data)

clean_data$acarbose <- NULL
str(clean_data)

#++++++++++++16.  insulin
dummy_insulin <- model.matrix(~ insulin - 1, data = clean_data)
View(dummy_insulin)
clean_data <- cbind(clean_data, dummy_insulin)
View(clean_data)

clean_data$insulin <- NULL
str(clean_data)
#++++++++++++17. gliyburide.metformin
dummy_glyburide.metformin <- model.matrix(~ glyburide.metformin - 1, data = clean_data)
View(dummy_glyburide.metformin)
clean_data <- cbind(clean_data, dummy_metformin)
View(clean_data)

clean_data$glyburide.metformin <- NULL
str(clean_data)
#++++++++++++18.  readmitted
dummy_readmitted <- model.matrix(~readmitted - 1, data = clean_data)
View(dummy_readmitted)
clean_data <- cbind(clean_data, dummy_readmitted)
View(clean_data)

clean_data$readmitted <- NULL
str(clean_data)

dim(clean_data)

