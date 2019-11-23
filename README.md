# qmkJsonConverter

R code to convert the .json file from the QMK configurator into the format necessary for the keymap.c file

To run, follow these steps:

1. Go to https://config.qmk.fm
2. Create a configuration for your desired keyboard, and download the .json file
3. Put the .json file in the `keymaps` folder
4. Open the `qmkJsonConverter.Rproj` project and open the `convert.R` file
5. Define the `keyboardName` and `jsonFileName` to the desired keyboard
6. Run the whole `convert.R` script
7. Open the resulting .txt file that has now been saved in the `keymaps` folder.
8. Go open the appropriate keymap.c file for the desired keyboard and copy-paste over the keymap from the .txt file
