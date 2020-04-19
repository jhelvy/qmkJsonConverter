# qmkJsonConverter

R code to convert the .json file from the QMK configurator into the format necessary for the keymap.c file

To run, follow these steps:

1. Go to https://config.qmk.fm
2. Create a configuration for your desired keyboard, and download the .json file
3. Put the .json file in the folder for your keymap (e.g. `keyboards/lily58/jhelvy`)
4. Open the `qmkJsonConverter.Rproj` project and open the `convert.R` file
5. Define the `keyboardName` and `jsonFileName` to the desired keyboard
6. Run the whole `convert.R` script
7. Open the resulting .txt file that has now been saved in the same place you put the original .json file you downloaded from the QMK configurator
8. Open the appropriate keymap.c file for the desired keyboard and copy-paste over the formated keymap code stored in the .txt file

One final note: for the time being, this code uses the default keymap.c settings to get the formatting (spacing between keys, etc.). As of now, this may only work with the Lily58 and Iris since I've made sure the formatting works. I'll eventually work to make this more generalizable.
