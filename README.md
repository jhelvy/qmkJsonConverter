[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

<a href="https://github.com/jhelvy/qmkJsonConverter" target="_blank">
<i class="fa fa-github fa-lg"></i></a>
<a href="https://shiny.rstudio.com/" target="_blank">Built with <img alt="Shiny" src="https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png" height="20"></a>

### Overview

This app converts the .json file exported from the [QMK configurator](https://config.qmk.fm/) into the code for the keymap.c file in your QMK settings. Here is the recommended workflow to follow:

1. Go to https://config.qmk.fm and create a keymap for your keyboard
2. Download the .json file and upload it on this app
3. Open the appropriate `keymap.c` file for the desired keyboard you are working on and copy-paste over the formated keymap code
4. Add any other additional features you desire to the keymap.c file

### Run locally

The app is hosted for [free online](https://jhelvy.shinyapps.io/qmkJsonConverter/), but you can also run the app locally on your computer by following these steps:

1. Install [R](https://cloud.r-project.org/)
2. Run this code in R to install the [shiny library](https://shiny.rstudio.com/):

```
install.packages("shiny")
```

3. Run this code in R to launch the app:

```
library(shiny)
runGitHub('jhelvy/qmkJsonConverter')
```

### Manual conversion

The underlying R code that makes this app work can also be directly used in R. To run it, follow these steps:

1. Fork or download all the files in this repo.
2. Place the QMK keyboard files you are working with in the `keyboards` folder (e.g. `keyboards/lily58/jhelvy`).
3. Go to https://config.qmk.fm and create a keymap for your keyboard
4. Download the .json file and put in your keymap folder (e.g. `keyboards/lily58/jhelvy`)
5. Open the `qmkJsonConverter.Rproj` project and open the `convert.R` file (you'll need to have [R](https://cloud.r-project.org/) and [RStudio](https://rstudio.com/products/rstudio/download/) installed).
6. Open the `convert.R` script and define the `keyboardName`, `jsonFileName`, and `folderName`
7. Run the whole `convert.R` script
8. Open the resulting .txt file that has now been saved in the same folder where you put the original .json file you downloaded from the QMK configurator
9. Open the appropriate `keymap.c` file for the desired keyboard and copy-paste over the formatted keymap code stored in the .txt file
10. Add any other additional features you desire to the keymap.c file
