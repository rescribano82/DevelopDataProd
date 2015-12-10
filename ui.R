library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
   
   ## Title
   titlePanel("Prediction of the fuel consumption of your 70s car!!"),
   hr(),
   
   ## Sidebar
   sidebarLayout(
      sidebarPanel(width=3,
         h3('Car properties'),
         selectInput("cyls", "Number of cylinders:", choices=c(2,4,6)), 
         sliderInput("disp", "Displacement (cu.in.):", 
                     min=70, max=475, value=304), 
         sliderInput("hp", "Gross horsepower:",  min=50 , max=335, value=200), 
         sliderInput("drat", "Rear axle ratio:", min=2.5, max=5  , value=3.5), 
         sliderInput("wt", "Weight (lb/1000):",  min=1.5, max=5.5, value=3), 
         sliderInput("qsec", "1/4 mile time:",   min=14 , max=23 , value=16), 
         selectInput("vs", "V/S:", choices=c(1, 0)), 
         selectInput("am", "Transmission (0=automatic, 1=manual):", 
                     choices=c(0, 1)), 
         selectInput("gear", "Number of forward gears:", choices=c(3, 4, 5), 4), 
         selectInput("carb", "Number of carburetors:", choices=(1:8)[-5], 3)
      ),
      
      ## Outputs
      mainPanel(
         h3('Documentation'),
         p('This application predicts the consumption in miles per gallon of 
           70s cars defined by its mechanical properties. You can specify these
           properties in the left panel and the application calculates 
           automatically the consumption of the car by three models.'),
         p(),
         p('The app determines the consumtion by means of three different models:
           linear, logarithmic and regression tree. These models are trained
           with the database mtcars, which extracted from the 1974 Motor Trend 
           US magazine, and comprises fuel consumption and 10 aspects of 
           automobile design and performance for 32 automobiles (1973-74 models)'),
         
         
         hr(), 
         h3('Fuel consumption of your car in Miles per gallon'),
         h4("Prediction of a ", strong('linear model'), ":"),
         textOutput("linear_mpg"),
         h3(), h3(),
         h4("Prediction of a ", strong('logarithmic model'), ":"),
         textOutput("logarithmic_mpg"),
         h3(), h3(),
         h4("Prediction of a ", strong('regression tree'), ":"),
         textOutput("tree_mpg")
      )
   )
))
