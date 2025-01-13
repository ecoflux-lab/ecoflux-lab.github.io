# variables/paths to edit to run 'flux_shiny_app.R'

# Specify file paths to biomet.net library and your database directory
# ****CHANGE THESE TWO FILEPATHS****
biomet_dir <- "/Users/rosie/Documents/Micromet/Biomet.net"  # path to Biomet.net directory 
main_dir <- "/Users/rosie/Documents/Micromet/Projects/My_Micromet/Database"   # database path 
            # Is there a way to read this in from matlab biomet_database_default.m?? 
            # Perhaps using system() command? Then users only need enter one file path above.

# Path for met/flux variables to display
basepath <- main_dir
level <- c("Clean/ThirdStage") # Select which folder/subfolder(s) to load data from (can concatenate more than one)
tv_input <- "clean_tv" # MAKE SURE time vector is in folder - this can sometimes generate an error.

# Specify the path to csv file with units
UnitCSVFilePath <- file.path(biomet_dir,"R/RShiny_flux_plots/flux_variables.csv")

# Specify the path to shiny app
arg <- file.path(biomet_dir,"R/RShiny_flux_plots/")

# provide names for incoming shortwave radiation and incoming PPDF
var_rad <- c('SW_IN_1_1_1') 

# path and file name of site coordinates - you will need to DOWNLOAD and EDIT this file the first time. 
# This file should be under your /Calculation_Procedures/RShiny_flux_plots_ini folder that you created
# Note that the standard meridian is = to your UTC offset (without daylight savings) x 15 (e.g., Montreal is UTC-5 so the standard meridian is -75)
# Also note that latitude and longitude are in decimal degrees, and negative for West and South coordinates

# ****Change siteID in Excel filename below****
coordinatesXLSXFilePath <- file.path(main_dir,"Calculation_Procedures/RShiny_flux_plots_ini/site_coordinates_TUT.xlsx")