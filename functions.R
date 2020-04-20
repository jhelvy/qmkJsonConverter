getKeymap <- function(input) {
    inFile <- input$uploadFile
    if (is.null(inFile)) {
        return("Please upload a json file")
    } 
    keymap_json <- fromJSON(file = inFile$datapath)
    return(makeKeymap(keymap_json))
}

makeKeymap <- function(keymap_json) {
    layers <- keymap_json$layers
    header <- getHeader(layers)
    layerMaps <- getLayerMaps(layers)
    return(paste(header, layerMaps, collapse = ''))
}

getHeader <- function(layers) {
    n <- length(layers)
    start <- '#include QMK_KEYBOARD_H\n\n\n'
    # define layers
    layerNums <- seq(0, n-1)
    defLayerNames <- paste0('#define _LAYER', layerNums, ' ', layerNums)
    defLayerNames <- paste0(paste(defLayerNames, collapse = '\n'), '\n\n')
    # enum layers
    enumStart <- 'enum custom_keycodes {\n    LAYER0 = SAFE_RANGE,\n'
    enumLayerNames <- paste0('    LAYER', layerNums, ',\n')
    if (n > 1) {
        enumLayerNames <- paste0(enumLayerNames[2:n], collapse = '')
    } else {
        enumLayerNames <- ''   
    }
    enum <- paste0(enumStart, enumLayerNames, '};\n\n', collapse = '')
    return(paste0(start, defLayerNames, enum, collapse = ''))
}

getLayerMaps <- function(layers) {
    layerMapsStart <- 'const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {\n\n'
    layerMaps <- list()
    for (i in 1:length(layers)) {
        layer <- layers[[i]]
        layerMaps[[i]] <- getLayerMap(layer, i)
    }
    layerMaps <- paste(layerMaps, collapse = ',\n\n')
    return(paste(layerMapsStart, layerMaps, '\n\n};', collapse = ''))
}

getLayerMap <- function(layer, i) {
    start <- paste0('[_LAYER', i-1, '] = LAYOUT(')
    # Remove "ANY()"
    ids <- which(str_detect(layer, "^ANY\\("))
    if (length(ids) > 0) {
        layer[ids] <- str_replace(layer[ids], 'ANY\\(', '')
        layer[ids] <- str_replace(layer[ids], '\\)', '')
    }
    keymap <- paste0(paste(layer, collapse = ', '), ')')
    return(paste0(start, keymap, collapse = ''))
}
