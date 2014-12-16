
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Linelist table"),

  h4("Number of lines: ", nrow(linelist)),
  p("This application allows to visualize the linelist as a data table."),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
                 if (c("Species", "Transition", "Frequency(Mhz)") %in% names(linelist)) {
                     selected <- c("Species", "Transition", "Frequency(Mhz)")
                 } else {
                     selected <- names(linelist)
                 },
                 checkboxGroupInput('show_vars', 'Columns in the linelist to show:', names(linelist), selected=selected)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      dataTableOutput(outputId="table")
    )
  )
))
