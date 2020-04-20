library(shiny)
library(rclipboard)
library(rjson)
library(stringr)

source('functions.R')

ui <- fluidPage(
    
    rclipboardSetup(),
    
    titlePanel("QMK json converter"),
    
    sidebarLayout(
        sidebarPanel(
            fileInput("uploadFile", "Upload json file:",
                      multiple = FALSE,
                      accept = c("text/json", ".json")),
            uiOutput("clip"),
            br(),br(),
            tags$div(HTML(paste(readLines("footer.html"), collapse = " ")))
        ),
        
        mainPanel(
            div(style="width:600px; padding-left:50px;",
                h3("Keymap:"),
                fluidRow(verbatimTextOutput("keymap", placeholder = TRUE))
            )
        )
    )
)

server <- function(input, output, session) {
    
    output$keymap <- renderText({
        getKeymap(input)
    })
    
    # Add clipboard buttons
    output$clip <- renderUI({
        rclipButton("clipbtn", "Copy to clipboard", getKeymap(input), icon("clipboard"))
    })
    
}

shinyApp(ui = ui, server = server)
