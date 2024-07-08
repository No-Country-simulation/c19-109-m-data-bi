#Instalar paquetes
install.packages("tidyverse")
install.packages("readr")

#abrir paquete
library(tidyverse)
library(readr)

#Importar bd
database = read.csv("Data/Original_data/diabetic_data.csv")

#Visualizar bd
view(database)

#Dimensones de la bd
dim(database)

#Resumen general de la bd *min,max,media,mediana,1er y 3er cuartil, n/a
summary(database)

#Nombre de Variables y posicion
names(database)


#Ejemplo de Seleccionar variables
database[1:100]
database$race
database[2:3]
database[1:100,2:3]

#Seleccionar diferentes columnas
select(database, race, gender)

#Para crear una nueva bd con variables específicas
bd_2 <- select(database, race, gender)

#Explorar clases de variables
class(database$race)
str(database)

#Ejemplo cambiar clase de la variable "gender"
as.factor(database$gender)
database$gender <- as.factor(database$gender)

#Acceder sin el sufijo
attach(database)

# Para eliminar 
rm()

# Para conectar con github, tenerlo abierto en el navegador
install.packages("usethis")
library(usethis)
usethis::create_github_token()
gitcreds::gitcreds_set() 

