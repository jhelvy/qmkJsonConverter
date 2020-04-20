library(shiny)
library(shinythemes)
library(markdown)
library(rclipboard)
library(stringr)
library(rjson)

source('functions.R')

ui <- navbarPage(title = "QMK json converter",
    theme = shinytheme("united"),
    tabPanel("Convert", 
        icon = icon(name = "expand", lib = "font-awesome"),
        rclipboardSetup(),
        mainPanel(width = 6,
            # custom styling
            tags$head(tags$style(HTML(paste(readLines("style.css"), 
                                            collapse=" ")))),
            fileInput("uploadFile", "Upload json file:",
                      multiple = FALSE,
                      accept = c("text/json", ".json")),
            h4("Keymap:"),
            uiOutput("clip"),
            br(),
            verbatimTextOutput("keymap")
        )
    ),
    tabPanel("About",
        icon = icon(name = "question-circle", lib = "font-awesome"),
        mainPanel(width = 6,
            includeMarkdown("README.md"),br()
        )
    )
)

server <- function(input, output, session) {

    output$keymap <- renderText({
        getKeymap(input)
    })

    # Add clipboard buttons
    output$clip <- renderUI({
        rclipButton("clipbtn", "Copy to clipboard", getKeymap(input), 
                    icon("clipboard"))
    })

}

shinyApp(ui = ui, server = server)
