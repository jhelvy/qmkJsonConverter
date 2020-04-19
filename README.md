# qmkJsonConverter

R code to convert the .json file from the QMK configurator into the format necessary for the keymap.c file

To run, follow these steps:

1. Go to https://config.qmk.fm
2. Create a configuration for your desired keyboard, and download the .json file
3. Put the .json file in the folder for your keymap folder (e.g. `keyboards/lily58/jhelvy`)
4. Open the `qmkJsonConverter.Rproj` project and open the `convert.R` file
5. Define the `keyboardName`, `jsonFileName`, and `folderName` to the desired keyboard
6. Run the whole `convert.R` script
7. Open the resulting .txt file that has now been saved in the same place you put the original .json file you downloaded from the QMK configurator
8. Open the appropriate keymap.c file for the desired keyboard and copy-paste over the formated keymap code stored in the .txt file
9. Add any other additional features you desire to the keymap.c file
