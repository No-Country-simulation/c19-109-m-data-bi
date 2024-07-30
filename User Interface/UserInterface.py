import streamlit as st
import numpy as np
import pandas as pd
import pickle
from PIL import Image
import os
import joblib
from io import BytesIO
import requests
import sklearn


st.title("HospRead")
st.info(
    "Machine Learning Model for Prediction of Hospital Readmissions."
)

#ID mappings for the diabetes dataset
#Admission type: Nominal Integer identifier corresponding to 8 distinct values

admission_type_id_mapping= {
    1:"Emergency",
    2:"Urgent",
    3:"Elective",
    4:"Newborn",
    5:"Not Available",
    6:"NULL",
    7:"Trauma Center",
    8:"Not Mapped",
}

#Discharge disposition: Nominal Integer identifier corresponding to 29 distinct values

discharge_disposition_id_mapping={
    1:"Discharged to home",
    2:"Discharged/transferred to another short term hospital",
    3:"Discharged/transferred to SNF",
    4:"Discharged/transferred to ICF",
    5:"Discharged/transferred to another type of inpatient care institution",
    6:"Discharged/transferred to home with home health service",
    7:"Left AMA",
    8:"Discharged/transferred to home under care of Home IV provider",
    9:"Admitted as an inpatient to this hospital",
    10:"Neonate discharged to another hospital for neonatal aftercare",
    11:"Expired",
    12:"Still patient or expected to return for outpatient services",
    13:"Hospice / home",
    14:"Hospice / medical facility",
    15:"Discharged/transferred within this institution to Medicare approved swing bed",
    16:"Discharged/transferred/referred another institution for outpatient services",
    17:"Discharged/transferred/referred to this institution for outpatient services",
    18:"NULL",
    19:"Expired at home. Medicaid only, hospice.",
    20:"Expired in a medical facility. Medicaid only, hospice.",
    21:"Expired, place unknown. Medicaid only, hospice.",
    22:"Discharged/transferred to another rehab fac including rehab units of a hospital .",
    23:"Discharged/transferred to a long term care hospital.",
    24:"Discharged/transferred to a nursing facility certified under Medicaid but not certified under Medicare.",
    25:"Not Mapped",
    26:"Unknown/Invalid",
    30:"Discharged/transferred to another Type of Health Care Institution not Defined Elsewhere",
    27:"Discharged/transferred to a federal health care facility.",
    28:"Discharged/transferred/referred to a psychiatric hospital of psychiatric distinct part unit of a hospital",
    29:"Discharged/transferred to a Critical Access Hospital (CAH)",
}

#Admission source: Nominal Integer identifier corresponding to 21 distinct values

admission_source_id_mapping = {
    1:"	Physician Referral",
    2:"	Clinic Referral",
    3:"HMO Referral",
    4:"Transfer from a hospital",
    5:"Transfer from a Skilled Nursing Facility (SNF)",
    6:"Transfer from another health care facility",
    7:"Emergency Room",
    8:"Court/Law Enforcement",
    9:"Not Available",
    10:"Transfer from critial access hospital",
    11:"Normal Delivery",
    12:"Premature Delivery",
    13:"Sick Baby",
    14:"Extramural Birth",
    15:"Not Available",
    17:"NULL",
    18:"Transfer From Another Home Health Agency",
    19:"Readmission to Same Home Health Agency",
    20:"Not Mapped",
    21:"Unknown/Invalid",
    22:"Transfer from hospital inpt/same fac reslt in a sep claim",
    23:"Born inside this hospital",
    24:"Born outside this hospital",
    25:"Transfer from Ambulatory Surgery Center",
    26:"Transfer from Hospice",
}


# diccionario de valores limite
diccionario = {'upper_limit_admission_type_id': 6.0,
 'lower_limit_admission_type_id': -2.0,
 'upper_limit_discharge_disposition_id': 8.5,
 'lower_limit_discharge_disposition_id': -3.5,
 'upper_limit_admission_source_id': 16.0,
 'lower_limit_admission_source_id': -8.0,
 'upper_limit_time_in_hospital': 12.0,
 'lower_limit_time_in_hospital': -4.0,
 'upper_limit_num_lab_procedures': 96.0,
 'lower_limit_num_lab_procedures': -8.0,
 'upper_limit_num_procedures': 5.0,
 'lower_limit_num_procedures': -3.0,
 'upper_limit_num_medications': 33.5,
 'lower_limit_num_medications': -2.5,
 'upper_limit_number_outpatient': 0.0,
 'lower_limit_number_outpatient': 0.0,
 'upper_limit_number_emergency': 0.0,
 'lower_limit_number_emergency': 0.0,
 'upper_limit_number_inpatient': 2.5,
 'lower_limit_number_inpatient': -1.5,
 'upper_limit_number_diagnoses': 13.5,
 'lower_limit_number_diagnoses': 1.5}

global_result = ""

def user_input_features(admission_source_id,
                        admission_type_id,
                        discharge_disposition_id,
                        time_in_hospital,
                        num_lab_procedures,
                        num_procedures,
                        num_medications,
                        number_outpatient,
                        number_emergency,
                        number_inpatient):


  atidv = list(admission_type_id_mapping.values())
  atidk = list(admission_type_id_mapping.keys())
  data1 = atidk[atidv.index(admission_type_id)]

  asidv = list(admission_source_id_mapping.values())
  asidk = list(admission_source_id_mapping.keys())
  data2 = asidk[asidv.index(admission_source_id)]

  ddidv = list(discharge_disposition_id_mapping.values())
  ddidk = list(discharge_disposition_id_mapping.keys())
  data3 = ddidk[ddidv.index(discharge_disposition_id)]



  data=[data1,
        data3,
        data2,
        time_in_hospital,
        num_lab_procedures,
        num_procedures,
        num_medications,
        number_outpatient,
        number_emergency,
        number_inpatient ]


  df = pd.DataFrame(data).T
  df.columns =x_lr_test.columns


  current_prediction = loaded_model.predict(df)
  if current_prediction[0]==0:
    result =" LOW "
    result_SP= " BAJA "
  else:
    result = " HIGH "
    result_SP= " ALTA "

  #text_to_display=  "The patient was admitted as : "+admission_type_id+"\n"
  #text_to_display+= "The patient was admitted from : "+admission_source_id+"\n"
  #text_to_display+= "The patient was discharged as : "+discharge_disposition_id+"\n"
  #text_to_display+= "The patient spent : "+str(time_in_hospital)+" days in the hospital\n"
  #text_to_display+= "The patient had : "+str(num_lab_procedures)+" lab procedures\n"
  #text_to_display+= "            and "+str(num_procedures)+" other procedures\n"
  #text_to_display+= "            and received "+str(num_medications)+" different medications\n"
  #text_to_display+= "            during the stay in the hospital.\n"
  #text_to_display+="The patient had "+str(number_outpatient)+" outpatient visits in the last year\n"
  #text_to_display+="The patient had "+str(number_emergency)+" emergency visits in the last year\n"
  #text_to_display+="The patient had "+str(number_inpatient)+" inpatient visits in the last year.\n\n"
  text_to_display="The model's prediction is that this patient's probability \n"
  text_to_display+="of being readmitted in the hospital in the next 30 days is \n"
  text_to_display+="*********************"+result+"************************"
  #st.popover("Model executed. Switch to next tab to see the model's Prediction")
  #with tab4:
  st.write(text_to_display)
  return text_to_display

tab1,tab2,tab3,tab4 = st.tabs(['Main', 'About HospRead', 'Data Input', 'Model Prediction' ])
with tab1:
   

  image_url='https://github.com/asoler2004/HospRead/raw/main/LogoHospRead.jpg'
  response = requests.get(image_url)

  # Check if the request was successful
  if response.status_code == 200:
    
    image = Image.open(BytesIO(response.content))
    st.image(image)
  else:
    st.write("Failed to download image. Status code:", response.status_code)
    
  
  
with tab2:
  st.write("Flor Jazmin Cisneros")
  st.write("Juan Espinosa")
  st.write("Santiago Maldonado")
  st.write("Antonia Soler")
with tab3:
  admission_source_id= st.selectbox('ADMISSION SOURCE',admission_source_id_mapping.values())
  admission_type_id= st.selectbox('ADMISSION TYPE',admission_type_id_mapping.values())
  discharge_disposition_id= st.selectbox('DISCHARGE DISPOSITION',discharge_disposition_id_mapping.values())
  time_in_hospital = st.slider('TIME IN HOSPITAL (DAYS)',diccionario['lower_limit_time_in_hospital'], diccionario['upper_limit_time_in_hospital'], value=diccionario['lower_limit_time_in_hospital'])
  num_lab_procedures= st.slider('NUMBER OF LAB PROCEDURES',diccionario['lower_limit_num_lab_procedures'], diccionario['upper_limit_num_lab_procedures'], value=diccionario['lower_limit_num_lab_procedures'])
  num_procedures=st.slider('NUMBER OF OTHER PROCEDURES',diccionario['lower_limit_num_procedures'], diccionario['upper_limit_num_procedures'], value=diccionario['lower_limit_num_procedures'])
  num_medications= st.slider('NUMBER OF MEDICATIONS',diccionario['lower_limit_num_medications'], diccionario['upper_limit_num_medications'], value=diccionario['lower_limit_num_medications'])
  number_outpatient= st.slider('NUMBER OF OUTPATIENT VISITS IN LAST YEAR',diccionario['lower_limit_number_outpatient'], diccionario['upper_limit_number_outpatient']+100, value=diccionario['lower_limit_number_outpatient'])
  number_emergency = st.slider('NUMBER OF EMERGENCY VISITS IN LAST YEAR',diccionario['lower_limit_number_emergency'], diccionario['upper_limit_number_emergency']+100, value=diccionario['lower_limit_number_emergency'])
  number_inpatient= st.slider('NUMBER OF INPATIENT VISITS IN LAST YEAR',diccionario['lower_limit_number_inpatient'], diccionario['upper_limit_number_inpatient'], value=diccionario['lower_limit_number_inpatient'])
  st.button("Submit",on_click= user_input_features,args=[admission_source_id,
                                                         admission_type_id,
                                                         discharge_disposition_id,
                                                         time_in_hospital,
                                                         num_lab_procedures,
                                                         num_procedures,
                                                         num_medications,
                                                         number_outpatient,
                                                         number_emergency,
                                                         number_inpatient])
                                                            



with tab4:
  path='https://github.com/asoler2004/nocountryc19/raw/main/hospread_logistic_regression.pickle'
  response = requests.get(path)

  # Check if the request was successful
  if response.status_code == 200:
    # Load the model using pickle
    loaded_model = pickle.loads(response.content)
    #st.write("Model loaded successfully!")
  else:
    st.write("Failed to download the model. Status code:", response.status_code)
  
  st.write(loaded_model)
  # load datasets
  path='https://github.com/asoler2004/nocountryc19/raw/main/X_LR_SMOTE.pickle'
  response = requests.get(path)

  # Check if the request was successful
  if response.status_code == 200:
    # Load the data using pickle
    x_lr_smote = pickle.loads(response.content)
    st.write("X loaded successfully!")
    #st.write(x_lr_smote.head())
  else:
    st.write("Failed to download the data. Status code:", response.status_code)

  path='https://github.com/asoler2004/nocountryc19/raw/main/Y_LR_SMOTE.pickle'
  response = requests.get(path)

  # Check if the request was successful
  if response.status_code == 200:
    # Load the data using pickle
    y_lr_smote = pickle.loads(response.content)
    st.write("Y loaded successfully!")
    #st.write(y_lr_smote.head())
  else:
    st.write("Failed to download the data. Status code:", response.status_code)

  path='https://github.com/asoler2004/nocountryc19/raw/main/X_LR_TEST.pickle'
  response = requests.get(path)

  # Check if the request was successful
  if response.status_code == 200:
    # Load the data using pickle
    x_lr_test = pickle.loads(response.content)
    st.write("X test loaded successfully!")
    #st.write(x_lr_test.head())
  else:
    st.write("Failed to download the data. Status code:", response.status_code)

  path='https://github.com/asoler2004/nocountryc19/raw/main/Y_LR_TEST.pickle'
  response = requests.get(path)

  # Check if the request was successful
  if response.status_code == 200:
    # Load the data using pickle
    y_lr_test = pickle.loads(response.content)
    st.write("Y test loaded successfully!")
    #st.write(y_lr_test.head())
  else:
    st.write("Failed to download the data. Status code:", response.status_code)

 