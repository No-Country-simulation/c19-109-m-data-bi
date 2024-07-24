import numpy as np
import pandas as pd
import requests
import pandas as pd
from io import StringIO

from mlxtend.feature_selection import SequentialFeatureSelector as SFS
import sys
import joblib
sys.modules['sklearn.externals.joblib'] = joblib
from mlxtend.feature_selection import SequentialFeatureSelector as SFS
from sklearn.linear_model import LogisticRegression

import pickle

# Acceder al archivo
access_token = 'ghp_xxxxxxxxx' # Acá deben reemplazar por su token de GitHub
usuario = 'No-Country-simulation'
repositorio = 'c19-109-m-data-bi'

archivo = 'Source_data/data_final.csv'

## Acá deben insertar la URL raw del archivo final_data.csv en GitHub
url = f''

## Realizar una solicitud GET con autenticación
response = requests.get(url, headers={'Authorization': f'token {access_token}'})

## Verificar el estado de la respuesta
if response.status_code == 200:
    # Leer el contenido en un DataFrame
    final_df = pd.read_csv(StringIO(response.text))
    print(f"Importación de datos correcta")
else:
    print(f"Error al acceder al archivo: {response.status_code} - {response.reason}")
    print(response.text)  # Para más información sobre el error

final_df['encounter_id'] = final_df['encounter_id'].astype(str)
final_df['patient_nbr'] = final_df['patient_nbr'].astype(str)
ids_features = list(final_df.select_dtypes(include=['object']).columns)


# Selección de variables
sfs = SFS(LogisticRegression(max_iter=10000), k_features=8, forward=True, floating=False, scoring = 'accuracy', cv = 5)
target_variable = 'readmitted'

X_lr = final_df.drop(target_variable, axis=1)
X_lr.drop(columns=ids_features, inplace=True)
y_lr = final_df[target_variable]

sfs.fit(X_lr, y_lr)
variables_elegidas = list(sfs.k_feature_names_)

#Train/test
X_lr = final_df[variables_elegidas] #sobreescribiendo la variable X_lr
# y_lr ya había sido definida unas celdas antes

from sklearn.model_selection import train_test_split
X_lr_train, X_lr_test, y_lr_train, y_lr_test = train_test_split(X_lr, y_lr, test_size = 1/3,
                                                                random_state = 123, shuffle=True,
                                                                stratify=y_lr)

# Balanceo SMOTE
from imblearn.over_sampling import SMOTE
smote = SMOTE(sampling_strategy = .5)
X_lr_resampled_smote, y_lr_resampled_smote = smote.fit_resample(X_lr_train, y_lr_train)


# Entrenamiento del modelo
model_lr_smote = LogisticRegression(max_iter=10000)
model_lr_smote.fit(X_lr_resampled_smote, y_lr_resampled_smote)


# Almacenamiento del modelo
with open('hospread_logistic_regression.pkl', 'wb') as file:
    pickle.dump(model_lr_smote, file)