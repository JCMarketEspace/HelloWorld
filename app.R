library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Svp, aidez-moi! Je suis une gentille et je suis poursuivie par un méchant."),
      selectInput("OuKilaiLeMechant",h3("Un méchant! Où est-il?"), choices=list("En haut", "En bas", "A droite", "A gauche"), selected = 50),
      sliderInput("PowerLvl",h3("Vegeta, what did the scanner say about his power level?"), min=0, max=9999, value=c(15000,10000))
    ),
    mainPanel(
      textOutput("kikoo"),
      textOutput("cookies")
    )
  )
  
  
  
)

# Define server logic ----
server <- function(input, output) {
  output$kikoo <- renderText({ 
    paste0(input$OuKilaiLeMechant, ", le méchant je suis et la gentille je vais tuer!")
  })
  output$cookies <- renderText({ 
    if (input$PowerLvl[1]>9000 || input$PowerLvl[2]>9000){
      paste0("It's over 9000!!!!!")
    } else {
      paste0("It's over 9.... 
             Wait wait wait... 
             Nope.")
    }
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)