#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Risk of Associated Disease According to BMI and Waist Size"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            helpText("Body Mass Index (BMI) and Waist size are common measure for health, this application helps you find it out"),            
            br(),           
            numericInput("int_height_cm",label = "What is your height (CM):",min = 50, max = 250,0), #,value = 170
            numericInput("ing_weight_kg",label = "How much do you weight (KG):",min = 40, max = 300,0), #, value = 70
            sliderInput("waist_size", "What is your waist size (IN):", min=20, max=100, value=30),
            radioButtons("gender", "Your gender:",
                         c("Male" = "Male",
                           "Female" = "Female")),
            br(),   
            actionButton("FindBMI", label = "Calculate")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
            tabsetPanel(
                    tabPanel("BMI Result",
                             p(h4("Here are your current measures:")),
                             textOutput("current_height"),
                             textOutput("current_weight"),
                             textOutput("waist_size"),
                             textOutput("gender"),
                             br(),
                             p(h4("Your calculated BMI is:")),
                             textOutput("BMI_result"),
                             br(),
                             p(h4("Your BMI category is:")),
                             textOutput("status_indicator"),
                             br(),
                             p(h4("Risk of associated disease is:")),
                             textOutput("status_risk")
                    ),
                    tabPanel(
                            "Documentation",
                            p(h3("The Application")),
                            helpText("This simple application calculates a person BMI based on current weight and height."),
                            p(h3("What is Body Mass Index (BMI)?")),
                            helpText("BMI can be said as a screening tool which serves the purpose of identifying weight problems that possibly happen to adults, people over 18 years old."),
                            helpText("It only helps to calculate the possibility of weight problems, nothing more nothing less."),
                            helpText("The index will show that you are underweight, normal weight, overweight, or obesity."),
                            p(h3("What is BMI Formula?")),
                            helpText("BMI is calculated by dividing weight by the square of height as follows:"),
                            helpText("BMI = Weight (kg)/Height (m)2"),
                            p(h3("Waist circumference and disease risk")),
                            helpText("Waist circumference thresholds which indicate increased risk of disease are below:"),
                            helpText("For women:
                                     risk is increased at more than or equal to 80 cm
                                     risk is high at more than or equal to 88 cm"),
                            helpText("For men:
                                     risk is increased at more than or equal to 94 cm
                                     risk is high at more than or equal to 102 cm for men")
                            
                    )
            )
    )
  )
))
