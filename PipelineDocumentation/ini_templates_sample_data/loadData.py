import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime, timedelta

# Reading time traces (clean_tv, TimeVector...) - float64
file_path_tv = r"E:\Pipeline_Projects\database\2024\RBM\Met\clean_tv"
try:
    with open(file_path_tv, "rb") as f:
        tv = np.fromfile(f, dtype=np.float64)
except FileNotFoundError:
    tv = np.array([])

# Converting time from MATLAB datenum to Python datetime format
days = tv % 1
tv_dt = [datetime.fromordinal(int(date)) + timedelta(days=float(date % 1)) - timedelta(days=366) for date in tv]

# Reading data traces - float32
file_path_data = r"E:\Pipeline_Projects\database\2024\RBM\Met\MET_HMP_T_6m_Avg"
try:
    with open(file_path_data, "rb") as f:
        TA_1_1_1 = np.fromfile(f, dtype=np.float32)
except FileNotFoundError:
    TA_1_1_1 = np.array([])
