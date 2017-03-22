#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
        values <- reactiveValues()
        
        observe({
                input$FindBMI
                values$bmi <- isolate({
                        input$ing_weight_kg/(input$int_height_cm/100 * input$int_height_cm/100)
                })
        })
        
        # Display your current values
        output$current_weight <- renderText({
                input$FindBMI
                paste("Current Weight in KG : ", isolate(input$ing_weight_kg))
        })
        
        output$current_height <- renderText({
                input$FindBMI
                paste("Current Height in CM :", isolate(input$int_height_cm))
        })
        
        output$waist_size <- renderText({
                input$FindBMI
                paste("Current Waist size in INCH :", isolate(input$waist_size))
        })
        
        output$gender <- renderText({
                input$FindBMI
                paste("Gender :", isolate(input$gender))
        })
        
        # Display your BMI
        output$BMI_result <- renderText({
                if(input$FindBMI == 0) ""
                else
                        paste("Your current BMI is:", values$bmi)
        })
        
        
        output$status_indicator <- renderText({
                
                if(input$FindBMI == 0) ""
                else {
                        if (values$bmi < 18.5)
                        {
                                values$status_indicator = "Underweight"
                        }
                        else if (values$bmi < 24.9)
                        {
                                values$status_indicator = "Normal weight"
                        }
                        else if (values$bmi < 29.9)
                        {
                                values$status_indicator = "Overweight"
                        }
                        else
                        {
                                values$status_indicator = "Obesity"
                        }
                        
                        
                        paste("Category according to BMI value: ", values$status_indicator)
                }
        })
        
        output$status_risk <- renderText({
                
                if(input$FindBMI == 0) ""
                else {
                        if (values$bmi < 18.5)
                        {
                                values$status_indicator = "Underweight"
                                if(input$gender == "Male"){
                                        if(input$waist_size <= 40){
                                                values$status_risk = "--" 
                                        }
                                        else if(input$waist_size > 40){
                                                values$status_risk = "N/A"
                                        }
                                }
                                else if(input$gender == "Female"){
                                        if(input$waist_size <= 35){
                                                values$status_risk = "--" 
                                        }
                                        else if(input$waist_size > 35){
                                                values$status_risk = "N/A"
                                        }
                                }
                        }
                        else if (values$bmi < 24.9)
                        {
                                values$status_indicator = "Normal weight"
                                if(input$gender == "Male"){
                                        if(input$waist_size <= 40){
                                                values$status_risk = "--" 
                                        }
                                        else if(input$waist_size > 40){
                                                values$status_risk = "N/A"
                                        }
                                }
                                else if(input$gender == "Female"){
                                        if(input$waist_size <= 35){
                                                values$status_risk = "--" 
                                        }
                                        else if(input$waist_size > 35){
                                                values$status_risk = "N/A"
                                        }
                                }
                        }
                        else if (values$bmi < 29.9)
                        {
                                values$status_indicator = "Overweight"
                                if(input$gender == "Male"){
                                        if(input$waist_size <= 40){
                                                values$status_risk = "Increased" 
                                        }
                                        else if(input$waist_size > 40){
                                                values$status_risk = "High"
                                        }
                                }
                                else if(input$gender == "Female"){
                                        if(input$waist_size <= 35){
                                                values$status_risk = "Increased" 
                                        }
                                        else if(input$waist_size > 35){
                                                values$status_risk = "High"
                                        }
                                }
                        }
                        else
                        {
                                values$status_indicator = "Obesity"
                                if(input$gender == "Male"){
                                        if(input$waist_size <= 40){
                                                values$status_risk = "High" 
                                        }
                                        else if(input$waist_size > 40){
                                                values$status_risk = "Very High"
                                        }
                                }
                                else if(input$gender == "Female"){
                                        if(input$waist_size <= 35){
                                                values$status_risk = "High" 
                                        }
                                        else if(input$waist_size > 35){
                                                values$status_risk = "Very High"
                                        }
                                }
                        }
                        
                        
                        paste("The risk level: ", values$status_risk)
                }
        })
})
