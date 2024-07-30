import numpy as np
import pandas as pd
import base64
import requests
from sklearn import preprocessing
from io import StringIO

# Acceder al archivo
access_token = '' # Acá deben reemplazar por su token de GitHub
usuario = 'No-Country-simulation'
repositorio = 'c19-109-m-data-bi'

archivo = 'Source_data/diabetic_data_clean.csv'

## Acá deben insertar la URL raw del archivo diabetic_data_clean.csv en GitHub
url = f''

## Realizar una solicitud GET con autenticación
response = requests.get(url, headers={'Authorization': f'token {access_token}'})

## Verificar el estado de la respuesta
if response.status_code == 200:
    # Leer el contenido en un DataFrame
    df = pd.read_csv(StringIO(response.text))
    print(f"Importación de datos correcta")
else:
    print(f"Error al acceder al archivo: {response.status_code} - {response.reason}")
    print(response.text)  # Para más información sobre el error

df['encounter_id'] = df['encounter_id'].astype(str)
df['patient_nbr'] = df['patient_nbr'].astype(str)
df.drop(columns=['readmitted>30', 'readmittedNO'], inplace=True)

# Manejo de Outliers
numeric_features = list(df.select_dtypes(include=['int']).columns)
ids_features = list(df.select_dtypes(include=['object']).columns)

binary_features = [col for col in df.columns if df[col].dropna().isin([0, 1]).all()]
non_binary_non_ids_features = list(df.drop(columns=list(set(binary_features + ids_features))).columns)

Q1 = df[non_binary_non_ids_features].quantile(0.25)
Q3 = df[non_binary_non_ids_features].quantile(0.75)
IQR = Q3 - Q1

((df[non_binary_non_ids_features] < (Q1 - 1.5 * IQR)) | (df[non_binary_non_ids_features] > (Q3 + 1.5 * IQR))).any()

diccionario = {}
for col in non_binary_non_ids_features:
  percentile25 = df[col].quantile(0.25)
  percentile75 = df[col].quantile(0.75)
  IQR  = percentile75 - percentile25
  upper_limit = percentile75 + 1.5 * IQR
  lower_limit = percentile25 - 1.5 * IQR
  diccionario['upper_limit'+ '_' + col] = upper_limit
  diccionario['lower_limit'+ '_' + col] = lower_limit

for col in non_binary_non_ids_features:
    df[col] = np.where(
        df[col] > diccionario['upper_limit_' + col],
        diccionario['upper_limit_' + col],
        np.where(
            df[col] < diccionario['lower_limit_' + col],
            diccionario['lower_limit_' + col],
            df[col]
       )
   )
    
print(f"Manejo de outliers correcto")
    
# Normalización

scaler = preprocessing.MinMaxScaler()
scaled_array = scaler.fit_transform(df[non_binary_non_ids_features])

'''scaler = preprocessing.RobustScaler()
scaled_array = scaler.fit_transform(df[non_binary_non_ids_features])'''

## Convertir el array numpy a un DataFrame
scaled_df = pd.DataFrame(scaled_array, columns=df[non_binary_non_ids_features].columns)

final_df = pd.concat([df[ids_features], scaled_df, df[binary_features]], axis=1)

print(f"Normalización correcta")


# Guardar el archivo en GitHub
csv_content = final_df.to_csv(index=False) # Convertir el DataFrame a CSV

file_path = 'Source_data/data_final.csv' # Configuración de GitHub

api_url = f'https://api.github.com/repos/{usuario}/{repositorio}/contents/{file_path}' # Construir la URL para la API de GitHub

encoded_content = base64.b64encode(csv_content.encode()).decode() # Codificar el contenido del archivo en base64

response = requests.get(api_url, headers={'Authorization': f'token {access_token}'}) # Obtener el SHA del archivo existente (si existe)

if response.status_code == 200:
    sha = response.json()['sha']
else:
    sha = None


data = {
    'message': 'Agregar archivo data_final.csv',
    'content': encoded_content,
    'branch': 'main'
} # Crear o actualizar el archivo en el repositorio
if sha:
    data['sha'] = sha

response = requests.put(api_url, json=data, headers={'Authorization': f'token {access_token}'})

# Verificar el resultado
if response.status_code in [200, 201]:
    print('Archivo subido exitosamente.')
else:
    print(f'Error al subir el archivo: {response.status_code} - {response.json()}')