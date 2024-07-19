import pyodbc
import streamlit as st
import pandas as pd
from sklearn.metrics import accuracy_score
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import pickle


myserver= "diabetesnocountry.database.windows.net"
mydatabase= "hospread"
username= "serveradmin"
mypassword="nc_12345"

connectionString = f'DRIVER={{SQL Server}};SERVER={myserver};DATABASE={mydatabase};UID={username};PWD={mypassword}'
conn = pyodbc.connect(connectionString) 

cursor = conn.cursor()
cursor.execute(sql_query)
df= cursor.fetchall()
st.write("SQL query result")
st.write(df)

sql_query="select top 10000 * from diabetic_data_clean"
cursor = conn.cursor()
df= pd.read_sql(sql_query,conn)
st.write(df.shape)

output = df["\"readmitted<30\""]

features = df.keys()
features=df[features]
features = features.drop(columns=["\"readmitted<30\"","\"readmitted>30\"","\"readmittedNO\""])
x_train, x_test, y_train, y_test = train_test_split(features, output, test_size=.8)
rfc = RandomForestClassifier(random_state=15)
rfc.fit(x_train, y_train)
y_pred = rfc.predict(x_test)
score = accuracy_score(y_pred, y_test)
st.write('Accuracy score for this model is {}'.format(score))

rf_pickle = open('hospread_random_forest.pickle', 'wb')
pickle.dump(rfc, rf_pickle)
rf_pickle.close()


#load model and test
filename = 'hospread_random_forest.pickle'
loaded_model = pickle.load(open(filename, 'rb'))
st.write(loaded_model) 
result= loaded_model.predict(x_test[0:1000])

st.write(result)





