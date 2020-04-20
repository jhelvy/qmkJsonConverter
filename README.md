[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

<a href="https://github.com/jhelvy/qmkJsonConverter" target="_blank">
<i class="fa fa-github fa-lg"></i></a>

### Overview

After using the wonderful [QMK configurator](https://config.qmk.fm/) to design my keyboard keymap, you can download the json file for the keymap or compile it into the .hex format to flash to your keyboard. But what if you want to add a few other settings first, like RGB settings or complex Tap Dance functionality?

Well, to solve that problem, simply download the json file from the QMK configurator and upload it on this app. The app converts the json file to the format required for the keymap.c file in your QMK settings. Combine that with a config.h and rules.mk file and you've got yourself everything you need to compile the software for your keyboard. 

Here's the workflow to follow:

1. Go to https://config.qmk.fm and create a keymap for your keyboard
2. Download the .json file and upload it on this app
3. Open the appropriate `keymap.c` file for the desired keyboard you are working on and copy-paste over the formated keymap code
4. Add any other additional features you desire to the keymap.c file

### Manual conversion

The underlying R code that makes this app work can also be directly used in R. To run it, follow these steps:

1. Fork or download all the files in this repo. 
2. Place the QMK keyboard files you are working with in the `keyboards` folder (e.g. `keyboards/lily58/jhelvy`).
3. Go to https://config.qmk.fm and create a keymap for your keyboard
4. Download the .json file and put in your keymap folder (e.g. `keyboards/lily58/jhelvy`)
5. Open the `qmkJsonConverter.Rproj` project and open the `convert.R` file (you'll need to have [R](https://cloud.r-project.org/) and [RStudio](https://rstudio.com/products/rstudio/download/) installed to make this work).
6. Open the `convert.R` script and define the `keyboardName`, `jsonFileName`, and `folderName`
7. Run the whole `convert.R` script
8. Open the resulting .txt file that has now been saved in the same folder where you put the original .json file you downloaded from the QMK configurator
9. Open the appropriate `keymap.c` file for the desired keyboard and copy-paste over the formated keymap code stored in the .txt file
10. Add any other additional features you desire to the keymap.c file
