library(shiny)

shinyServer(function(input, output) {

   output$linear_mpg <- renderText({ 
      
      nData <- data.frame(cyl=as.numeric(input$cyls), disp=as.numeric(input$disp), 
                          hp=as.numeric(input$hp), drat=as.numeric(input$drat), 
                          wt=as.numeric(input$wt), qsec=as.numeric(input$qsec), 
                          vs=as.numeric(input$vs), am=as.numeric(input$am), 
                          gear=as.numeric(input$gear), carb=as.numeric(input$carb))
      
      mod <- lm(mpg ~ ., data=mtcars)
      pre <- predict.lm(mod, newdata=nData)
      paste(round(pre, 2))
   })
   
   
   output$logarithmic_mpg <- renderText({ 
      
      nData <- data.frame(cyl=as.numeric(input$cyls), disp=as.numeric(input$disp), 
                          hp=as.numeric(input$hp), drat=as.numeric(input$drat), 
                          wt=as.numeric(input$wt), qsec=as.numeric(input$qsec), 
                          vs=as.numeric(input$vs), am=as.numeric(input$am), 
                          gear=as.numeric(input$gear), carb=as.numeric(input$carb))
      
      mod <- lm(formula=log10(mpg) ~ ., data=mtcars)
      pre <- 10^predict(mod, newdata=nData)
      paste(round(pre, 2))
   })
   
   
   output$tree_mpg <- renderText({ 
      library(tree)
      
      nData <- data.frame(cyl=as.numeric(input$cyls), disp=as.numeric(input$disp), 
                          hp=as.numeric(input$hp), drat=as.numeric(input$drat), 
                          wt=as.numeric(input$wt), qsec=as.numeric(input$qsec), 
                          vs=as.numeric(input$vs), am=as.numeric(input$am), 
                          gear=as.numeric(input$gear), carb=as.numeric(input$carb))
      
      mod <- tree(mpg ~ ., data=mtcars)
      pre <- predict(mod, newdata=nData)
      paste(round(pre, 2))
   })
})
