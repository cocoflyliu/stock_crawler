if (!require(quantmod)) {
  stop("This app requires the quantmod package. To install it, run 'install.packages(\"quantmod\")'.\n")
}

# Download data for a stock if needed, and return the data
require_symbol <- function(symbol, envir = parent.frame()) {
  if (is.null(envir[[symbol]])) {
    envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
  }

  envir[[symbol]]
}


shinyServer(function(input, output) {

  # Create an environment for storing data
  symbol_env <- new.env()

  # Make a chart for a symbol, with the settings from the inputs
  make_chart <- function(symbol) {
    symbol_data <- require_symbol(symbol, symbol_env)

    chartSeries(symbol_data,
                name      = symbol,
                type      = input$chart_type,
                subset    = paste(input$daterange, collapse = "::"),
                log.scale = input$log_y,
                theme     = "white")
  }

  output$plot_S1 <- renderPlot({ make_chart(input$stock_name1) })
  output$plot_S2 <- renderPlot({ make_chart(input$stock_name2) })
  
  output$value <- renderText({ input$caption })
})
