# Server for mass molarity and dilution calculator
# A. Bailey 19th October 2015

library(shiny)

# Define server 
shinyServer(function(input, output) {
        # Mass molarity calculations
        #
        # Reactive conversion of input volume
        vol <-  reactive({
                # If vol.unit = L
                if(input$vol.unit == 1){
                        vol<- input$fv
                }
                # If input$vol.unit = mL
                else if(input$vol.unit == 2){
                        vol <- input$fv/1e3
                }
                # If input$vol.unit = uL
                else if(input$vol.unit == 3 ){
                        vol <- input$fv/1e6
                }
        })
        # Reactive conversion of input concentration
        conc <- reactive(
                # if input$conc.unit = M
                if(input$conc.unit == 1){
                        conc <- input$dc
                }
                # if input$conc.unit = mM
                else if(input$conc.unit == 2){
                       conc <- input$dc/1e3
                        
                }
                # if input$conc.unit = uM
                else if(input$conc.unit == 3){
                        conc <- input$dc/1e6
                        
                }
                # if input$conc.unit = nM
                else if(input$conc.unit == 4){
                        conc<- input$dc/1e9
                        
                }
                # if input$conc.unit = pM
                else if(input$conc.unit == 5){
                        conc <- input$dc/1e12
                        
                }
                # if input$conc.unit = fM
                else if(input$conc.unit == 6){
                        conc <- input$dc/1e15
                })
        # Reactive input of formula weight
        fw <- reactive({input$fw})
        
        # Calculate required mass and output to UI
        output$mass <- renderText({paste("You need to weigh out",
                                         vol()*conc()*fw(),
                                         "grams")})
        output$ex1 <- renderUI({
                withMathJax(helpText('Dynamic output 1:  $$\\alpha^2$$'))
        })
        
        # Solution dilution calculation
        #
        # Reactive conversion of stock concentration
        m1 <-  reactive({
                # If M1.unit = M
                if(input$M1.unit == 1){
                        m1 <- input$M1
                }
                # If input$M1.unit = mM
                else if(input$M1.unit == 2){
                        m1 <- input$M1/1e3
                }
                # If input$M1.unit = uM
                else if(input$M1.unit == 3 ){
                        m1 <- input$M1/1e6
                }
                # If input$M1.unit = nM
                else if(input$M1.unit == 4 ){
                        m1 <- input$M1/1e9
                }
                # If input$M1.unit = pM
                else if(input$M1.unit == 5 ){
                        m1 <- input$M1/1e12
                }
                # If input$M1.unit = fM
                else if(input$M1.unit == 6 ){
                        m1 <- input$M1/1e15
                }
        })
        
        # Reactive conversion of desired concentration
        m2 <-  reactive({
                # If M2.unit = M
                if(input$M2.unit == 1){
                        m2 <- input$M2
                }
                # If input$M2.unit = mM
                else if(input$M2.unit == 2){
                        m2 <- input$M2/1e3
                }
                # If input$M2.unit = uM
                else if(input$M2.unit == 3 ){
                        m2 <- input$M2/1e6
                }
                # If input$M2.unit = nM
                else if(input$M2.unit == 4 ){
                        m2 <- input$M2/1e9
                }
                # If input$M2.unit = pM
                else if(input$M2.unit == 5 ){
                        m2 <- input$M2/1e12
                }
                # If input$M2.unit = fM
                else if(input$M2.unit == 6 ){
                        m2 <- input$M2/1e15
                }
        })
        
        # Calculate required volume of stock V1 in terms of V2
        v1 <- reactive({
                if(input$V2.unit == 1){
                        v1 <- paste((m2()*input$V2)/m1(), "L")
                }
                else if(input$V2.unit == 2){
                        v1 <- paste((m2()*input$V2)/m1(), "mL")
                }
                else if(input$V2.unit == 3){
                        v1 <- paste((m2()*input$V2)/m1(), "uL")
                }
        })
        
        # Output of stock volume requred to UI
        output$V1 <- renderText({paste("You need",
                                         v1(),
                                         "of stock")
                })       
        
        })