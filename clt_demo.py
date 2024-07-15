import streamlit as st
import numpy as np
import pandas as pd
import altair as alt
import matplotlib.pyplot as plt
import seaborn as sns
st.title('Hospital Readmission Predictor')
st.write('Santiago Maldonado - Flor Jazmin Mayon Cisneros - Juan Espinoza - Antonia Soler')
st.markdown('Análisis de datos de internación para predecir reingreso de pacientes dados de alta')

Diabcsvfilepath = "C:/Users/Usuario/Documents/NO COUNTRY/SIMULACION 1/Datos Diabetes/"
csvfilename= "diabetic_data.csv"
#datasetcsv= pd.read_csv(Diabcsvfilepath+csvfilename)

chosen_file= st.file_uploader("Seleccione un archivo csv:")

@st.cache_data()
def load_file(chosen_file):
    if chosen_file is not None:
        datasetcsv= pd.read_csv(chosen_file)
    else:
        st.stop()
    return (datasetcsv)

datasetcsv=load_file(chosen_file)


    
st.write (datasetcsv.head())

def clean_data(datasetcsv):
    datasetcsv= datasetcsv.drop(columns=['payer_code'])
    datasetcsv= datasetcsv.drop(columns=['race'])
    datasetcsv['gender']=datasetcsv['gender'].apply(lambda x: 1 if x == 'Male' else 0)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 10 if x == '[0-10)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 20 if x == '[10-20)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 30 if x == '[20-30)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 40 if x == '[30-40)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 50 if x == '[40-50)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 60 if x == '[50-60)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 70 if x == '[60-70)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 80 if x == '[70-80)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 90 if x == '[80-90)' else x)
    datasetcsv['age']=datasetcsv['age'].apply(lambda x: 100 if x == '[90-100)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 0 if x == '?' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 25 if x == '[0-25)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 50 if x == '[25-50)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 75 if x == '[50-75)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 100 if x == '[75-100)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 125 if x == '[100-125)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 150 if x == '[125-150)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 175 if x == '[150-175)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 200 if x == '[175-200)' else x)
    datasetcsv['weight']=datasetcsv['weight'].apply(lambda x: 250 if x == '>200' else x)
    datasetcsv['readmitted']=datasetcsv['readmitted'].apply(lambda x: 1 if x == '<30' else 0)
    st.warning("Data Was Cleaned")

    return datasetcsv

def cl_data(datasetcsv):
    datasetcsv= clean_data(datasetcsv)
    return datasetcsv

st.button("Clean",on_click=cl_data)

st.write (datasetcsv.head())

def describe_data():
    st.write(datasetcsv.describe())

st.button("Describe",on_click=describe_data)

st.markdown('Analisis Bivariado')
selected_var_1= st.selectbox('Seleccione la variable X:',datasetcsv.columns.tolist())
selected_var_2= st.selectbox('Seleccione la variable Y:',datasetcsv.columns.tolist())
selected_var_3= datasetcsv['readmitted']

X= selected_var_1
#datasetcsv[selected_var_1]
Y= selected_var_2
#datasetcsv[selected_var_2]
#st.write(X)
#st.write(Y)
#fig1 = sns.relplot(
#    data=datasetcsv,
#    x=X, y=Y, hue="readmitted"    
#)
#st.pyplot(fig1)

alt_chart = (alt.Chart(datasetcsv,title="Scatterplot Bivariado")
             .mark_circle()
             .encode(x=X,
                     y=Y,
                     color='readmitted')
             )

st.altair_chart(alt_chart,use_container_width=True)

#myapikey= "1HE29SBOPsPISCJ40Wo4gV1bQE1nyFvgVPvkaEvI05Q"

'''#myhost="cqzdwoclsz"
#mydatabase="diabetes.db"
import sqlitecloud
#conn = sqlitecloud.connect(sqlitehost)

HOST = "sqlitecloud://cqzdwoclsz.sqlite.cloud:8860?apikey=8ZBRx9VjOUr3L8r7arbcH8X27UpFfHwvq7qiaULwWdE"
HOST2="sqlitecloud://nmvvwo5liz.sqlite.cloud:8860?apikey=8ZBRx9VjOUr3L8r7arbcH8X27UpFfHwvq7qiaULwWdE"
#conn = sqlitecloud.connect(HOST,)


perc_heads= st.number_input("numero entre 0 y 1:",min_value=0.0,max_value=1.0,value=0.5)
graph_title = st.text_input(label="graph title")
binom_dist = np.random.binomial(1,perc_heads,1000)
list_of_means =[]
for i in range(0,1000):
    list_of_means.append(np.random.choice(binom_dist,100,replace=True).mean())
fig1,ax1 = plt.subplots()
ax1= plt.hist(list_of_means,range=[0,1])
plt.title(graph_title)
st.pyplot(fig1)

fig2,ax2= plt.subplots()
ax2= plt.hist([1,1,1,1])
st.pyplot(fig2)
fig3,ax3=plt.subplots(2,2)
'''