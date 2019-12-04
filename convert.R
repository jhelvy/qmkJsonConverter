library(rjson)
library(stringr)
library(readr)
library(here)
source(here::here('functions.R'))

# Build the lily58:
keyboardName <- 'lily58'
jsonFileName <- 'lily58_rev1_jhelvy'

# Build the iris:
keyboardName <- 'keebio-iris'
jsonFileName <- 'keebio_iris_rev2_jhelvy'

# Get converted keymap 
settings <- getSettings(keyboardName)
jsonFilePath <- here::here('keymaps', paste0(jsonFileName, '.json'))
keymap_json <- fromJSON(file = jsonFilePath)
keymap_txt <- getKeymap(keymap_json)

# Save as .txt file
txtFilePath <- here::here('keymaps', paste0(jsonFileName, '.txt'))
writeLines(keymap_txt, txtFilePath)
