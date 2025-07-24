library(ggplot2)

# Reading time traces (clean_tv, TimeVector...) - float64
file_path_tv <- "E:/Pipeline_Projects/database/2025/RBM/Met/clean_tv"
if (file.exists(file_path_tv)) {
  con <- file(file_path_tv, "rb")
  tv <- readBin(con, what = "double", n = file.info(file_path_tv)$size / 8, size = 8)
  close(con)
} else {
  tv <- numeric()
}

# Converting MATLAB datenum to R datetime format
tv_dt <- as.POSIXct(tv * 86400, origin = "0000-01-01", tz = "UTC")

# Reading data traces - float32
file_path_data <- "E:/Pipeline_Projects/database/2025/RBM/Met/MET_HMP_T_6m_Avg"
if (file.exists(file_path_data)) {
  con <- file(file_path_data, "rb")
  TA_1_1_1 <- readBin(con, what = "numeric", n = file.info(file_path_data)$size / 4, size = 4)
  close(con)
} else {
  TA_1_1_1 <- numeric()
}
