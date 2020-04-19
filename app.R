library(shiny)
library(shinycssloaders)
library(rjson)
library(stringr)
library(readr)
source('functions.R')

ui <- fluidPage(
    
    titlePanel("QMK json converter"),
    
    sidebarLayout(
        sidebarPanel(
            fileInput("uploadFile", "Upload json file:",
                      multiple = FALSE,
                      accept = c("text/json", ".json")),
            actionButton(
                inputId = "convert",
                label    = "Convert!"),
            downloadButton(
                outputId = "download",
                label    = "Download"),
            br(),
            # Insert footer
            tags$div(HTML(paste(readLines("footer.html"), collapse = " ")))
        ),
        
        mainPanel(
            div(style="width:600px; padding-left:50px; pre { white-space: pre-wrap; word-break: keep-all; }",
                fluidRow(verbatimTextOutput("keymap", placeholder = TRUE))
            )
        )
    )
)

server <- function(input, output, session) {
    output$keymap <- renderText({

        inFile <- input$uploadFile

        if (is.null(inFile)) {
            return("Please upload a json file")
        } else {
            keymap_json <- fromJSON(file = inFile$datapath)
            keymap <- makeKeymap(keymap_json)
            return(keymap)
        }
    })
    
}

shinyApp(ui = ui, server = server)
