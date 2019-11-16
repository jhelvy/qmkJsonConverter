library(rjson)
library(stringr)
library(readr)
source(file.path('functionsAndSettings.R'))

keyboardName <- 'lily58'
jsonFileName <- 'lily1_karabiner'
# keyboardName <- 'keebio/iris'
# jsonFileName <- 'iris2_karabiner'

# Get converted keymap 
settings <- getSettings(keyboardName)
jsonFilePath <- file.path('keymaps', paste0(jsonFileName, '.json'))
keymap_json <- fromJSON(file = jsonFilePath)
keymap_txt <- getKeymap(keymap_json)

# Save as .txt file
txtFilePath <- file.path('keymaps', paste0(jsonFileName, '.txt'))
writeLines(keymap_txt, txtFilePath)
