# ***c19-109-m-data-bi***
# ***Modelo de Machine Learning para predicción de readmisión hospitalaria de pacientes***
---


> ## Introducción
Este repositorio contiene el código y la documentación para un proyecto en que se busca desarrollar un MVP para el cumplimiento del proyecto de simulación en No Country.

Como fuente de datos se utilizó un dataset obtenido de UC Irvine Machine Learning Repository, donado en 2014 por Center for Clinical and Translational Research - Virginia Commonwealth University: [Diabetes 130-US Hospitals for Years 1999-2008](https://archive.ics.uci.edu/dataset/296/diabetes+130-us+hospitals+for+years+1999-2008)


> ## Objetivo
El proyecto consiste en ofrecer una interfaz simple e intuitiva que, conectada a un modelo de machine learning, prediga si se espera que un paciente que sufre de diabetes sea readmitido en los próximos 30 días.


> ## Producto final
Click en la siguiente imagen para conocer la app:

[![Producto final](https://github.com/No-Country-simulation/c19-109-m-data-bi/blob/44cbc9888a681b70451782c6308f827f56343057/Images/Logo_HospRead.jpg)](https://hospitalreadmissions.streamlit.app/)


> ## Etapas del proyecto
![Etapas del proyecto](https://github.com/No-Country-simulation/c19-109-m-data-bi/blob/c2925531a8802ad943faeab94fb3e3adadf9e798/Images/CHART.png)

El proyecto consiste en varias etapas claves desde la obtención de los datos hasta el despliegue del modelo final:
1.  Obtención de los datos: Los datos relevantes son almacenados en el formato adecuado para su posterior análisis.
2.  Análisis Exploratorio: Se realizó un análisis exploratorio, utilizando R, para comprender mejor su estructura y características. Esto implica la visualización de datos, la identificación de valores atípicos (outliers), y la generación de estadísticas descriptivas.
3.  Pre-procesamiento: Previo al entrenamiento del modelo de machine learning se realizó una limpieza de datos (como manejo de valores faltantes y outliers), la normalización o estandarización de características, y la ingeniería de características para crear atributos relevantes para el modelo. Esta etapa se hizo en 2 partes, una en R y otra en Python.
4.  Entrenamiento de Modelo de Machine Learning: Con los datos preparados, se seleccionó y entrena un modelo de machine learning. Especificamente un modelo de Regresión Logística. Esta etapa involucró la división de datos en conjuntos de entrenamiento y prueba, la selección de métricas de evaluación, el balanceo de clases en la variable objetivo  y el ajuste de hiperparámetros del modelo para mejorar su desempeño.
5.  Deployment: Utilizando streamlitcloud, el modelo entrenado se despliega con una interfaz de usuario intuitiva para poder apoyar la planificación y la toma de decisiones en los hospitales.


> ## Herramientas - Stack tecnológico
![Stack Tecnológico](https://github.com/No-Country-simulation/c19-109-m-data-bi/blob/44229c8b78604a9265117800006e56a9109c8faf/Images/Stack_tecnologico.png)


> ## Colaboradores
Los creadores de este proyecto son:
* [Espinosa Carmona Juan](https://github.com/ecj12000)
* [Maldonado Santiago](https://github.com/Smsantimaldonado)
* [Mayon Cisneros Flor Jazmin](https://github.com/Flower2103)
* [Soler Riera Antonia](https://github.com/asoler2004)
