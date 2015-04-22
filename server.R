library(shinydashboard)
library(shiny)
suppressMessages(library(randomForest))  # Machine learning
suppressMessages(library(caret))




shinyServer(function(input, output, session) {

load("CARET.Arhetipi.RData")
  
output$plot4 <- renderPlot({
    varImpPlot(model.caret$finalModel, main="Importance",cex=1,pch=21,bg="red")
}, height = 600)
  
  
output$st.bz.g <- renderUI({
  sliderInput("inSlider1", "Number of brands respondent buys for household", min=0, max=input$st.bz.pozna, value=1)
})

output$st.bz.l <- renderUI({
  sliderInput("inSlider2", "Number of brands respondent buys in Pubs", min=0, max=input$st.bz.pozna, value=1)
})


#output$weatherWidget <- renderWeather(530634, "c", session=session)



get.input.data <- reactive({
  
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # Predict Arhetip using example parameters
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  data.frame(Demo_spol = input$Demo_spol,
             Demo_star = input$Demo_star,
             st.bz.pozna = input$st.bz.pozna,
             frek.g = as.numeric(input$frek.g),
             frek.l = as.numeric(input$frek.l),
             st.bz.g = 1,#input$inSlider1,
             st.bz.l = 1,#input$inSlider2,
             p.01 = as.numeric(input$p.01),
             p.02 = as.numeric(input$p.02),
             p.03 = as.numeric(input$p.03),
             p.04 = as.numeric(input$p.04),
             p.05 = as.numeric(input$p.05),
             p.06 = as.numeric(input$p.06),
             p.07 = as.numeric(input$p.07),
             p.08 = as.numeric(input$p.08),
             p.09 = as.numeric(input$p.09),
             p.10 = as.numeric(input$p.10),
             p.11 = as.numeric(input$p.11),
             p.12 = as.numeric(input$p.12),
             p.13 = as.numeric(input$p.13),
             p.14 = as.numeric(input$p.14),
             p.15 = as.numeric(input$p.15),
             p.16 = as.numeric(input$p.16),
             p.17 = as.numeric(input$p.17),
             p.18 = as.numeric(input$p.18),
             p.19 = as.numeric(input$p.19),
             p.20 = as.numeric(input$p.20),
             p.21 = as.numeric(input$p.21),
             p.22 = as.numeric(input$p.22),
             p.23 = as.numeric(input$p.23),
             p.24 = as.numeric(input$p.24),
             p.25 = as.numeric(input$p.25),
             p.26 = as.numeric(input$p.26),
             p.27 = as.numeric(input$p.27),
             p.28 = as.numeric(input$p.28),
             p.29 = as.numeric(input$p.29),
             p.30 = as.numeric(input$p.30),
             p.31 = as.numeric(input$p.31),
             p.32 = as.numeric(input$p.32),
             p.33 = as.numeric(input$p.33),
             p.34 = as.numeric(input$p.34),
             stringsAsFactors = TRUE)
})

  

predict.sample <- reactive({
  predict(model.caret, get.input.data())
})

predict.prob <- reactive({
  predict(model.caret, get.input.data(), type="prob")
})


output$prediction.novodobniki <- renderText({paste("Segment A:",100*predict.prob()[1],"%")
})

output$prediction.zmaji <- renderText({paste("Segment B:",100*predict.prob()[2],"%")
})

output$prediction.pivoplus <- renderText({paste("Segment C:",100*predict.prob()[3],"%")
})

output$prediction.zlatorogi <- renderText({paste("Segment D:",100*predict.prob()[4],"%")
})

output$prediction.etabliranci <- renderText({paste("Segment E:",100*predict.prob()[5],"%")
})


  
  
  output$arhetip <- renderValueBox({ #tole bo za tekst arhetipa
    valueBox(width = NULL, value = predict.sample(), subtitle = "Segment Prediction",icon = icon("beer", lib = "font-awesome"),
      color = "yellow"
    )
  })
  
  
  output$plot.bar <- renderPlot({
    #par(bg = "gray")
    barplot(c(as.numeric(100*predict.prob()[1]),as.numeric(100*predict.prob()[2]),
              as.numeric(100*predict.prob()[3]),
              as.numeric(100*predict.prob()[4]),
              as.numeric(100*predict.prob()[5])),
            names.arg=c("Segment A", "Segment B", "Segment C", "Segment D", "Segment F"),
            cex.names=1, ,main="Segment Probability", xlab="Segment",ylab="Probability",
            axes=T,border=NA,axis.lty=1,ylim=c(0,100),
            col="red")
    text(0.7,6,100*predict.prob()[1],col="blue",cex = 1.5)
    text(1.9,6,100*predict.prob()[2],col="blue",cex = 1.5)
    text(3.1,6,100*predict.prob()[3],col="blue",cex = 1.5)
    text(4.3,6,100*predict.prob()[4],col="blue",cex = 1.5)
    text(5.5,6,100*predict.prob()[5],col="blue",cex = 1.5)
  })
  
  
  
  
}
)