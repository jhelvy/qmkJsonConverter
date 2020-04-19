library(rjson)
library(stringr)
library(readr)
source('functions.R')

# User-defined objects --------------------------------------------------------

# keyboard name:
# keyboardName <- 'lily58'
keyboardName <- 'keebio-iris'

# json file name:
# jsonFileName <- 'lily58_rev1_jhelvy'
jsonFileName <- 'keebio_iris_rev2_jhelvy'

# Folder name
folderName <- 'jhelvy'

# Run -------------------------------------------------------------------------

# Define the file paths
jsonFile <- paste0(jsonFileName, '.json')
keymapFile <- paste0(jsonFileName, '.txt')
jsonFilePath <- file.path('keyboards', keyboardName, folderName, jsonFile)
keymapFilePath <- file.path('keyboards', keyboardName, folderName, keymapFile)

# Get converted keymap 
keymap_json <- fromJSON(file = jsonFilePath)
keymap_txt <- makeKeymap(keymap_json)

# Save as .txt file
writeLines(keymap_txt, keymapFilePath)