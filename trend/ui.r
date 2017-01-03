library(quantmod)
library(xts)
library(zoo)

shinyUI(pageWithSidebar(
  headerPanel("Stocks"),

  sidebarPanel(
    wellPanel(
      
     
      textInput("stock_name1", "Input stock no.", "2330.TW"),
      textInput("stock_name2", "Input stock no.", "1216.TW"),
      verbatimTextOutput("value")
      
    ),

    selectInput(inputId = "chart_type",
                label = "Chart type",
                choices = c("Candlestick" = "candlesticks",
                            "Matchstick" = "matchsticks",
                            "Bar" = "bars",
                            "Line" = "line")
    ),
    

    dateRangeInput(inputId = "daterange", label = "Date range",
      start = Sys.Date() - 365, end = Sys.Date()),

    checkboxInput(inputId = "log_y", label = "log y axis", value = FALSE)
  ),

  mainPanel(
    plotOutput("plot_S1"),
    plotOutput("plot_S2")
   
  )
))
