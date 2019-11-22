getSettings <- function(keyboardName) {
    defaultMapPath <- file.path('keyboards', keyboardName, 'keymap.c')
    defaultMap <- read_file(defaultMapPath)
    defaultMap <- str_split(defaultMap, '_QWERTY]')[[1]][2]
    defaultMap <- str_split(defaultMap, '\n\\)')[[1]][1]
    keys <- str_split(defaultMap, ',')[[1]]
    breaks <- which(str_detect(keys, '\n')) - 1
    breaks <- breaks[2:length(breaks)]
    spacing <- str_length(keys)
    return(list(breaks = breaks, spacing = spacing))
}

dropLastChar <- function(x) {
    return(str_sub(x, 1, str_length(x) - 1))
}

formatLayer <- function(layer) {
    hasAny <- str_detect(layer, 'ANY\\(')
    layer[hasAny] <- str_replace(layer[hasAny], 'ANY\\(', '')
    layer[hasAny] <- dropLastChar(layer[hasAny])
    return(layer)
}

getLayerMap <- function(layer, name, settings) {
    # Add spacing
    layer <- str_pad(layer, width = settings$spacing, side = 'left')
    # Add commas
    layer <- str_c(layer, ',')
    layer[length(layer)] <- str_replace(layer[length(layer)], ',', '')
    # Add breaks
    layer[settings$breaks] <- str_c(layer[settings$breaks], ' \\ \n')
    # Merge
    keys <- str_c(layer, collapse = '')
    layer_map <- str_c('[', name, '] = LAYOUT( \\ \n', keys, '),')
    return(layer_map)
}

getKeymap <- function(keymap_json) {
    layers <- keymap_json$layers
    layer_maps <- list()
    for (i in 1:length(layers)) {
        layer <- formatLayer(layers[[i]])
        name <- str_c('_LAYER', i)
        layer_maps[[i]] <- getLayerMap(layer, name, settings)
    }
    mergedLayers <- dropLastChar(str_c(layer_maps, collapse = '\n\n'))
    result <- str_c(
        'const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {\n\n',
        mergedLayers, '\n\n};', collapse = '')
    return(result)
}
