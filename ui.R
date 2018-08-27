# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

library(shiny)

# Define UI for application
shinyUI(fluidPage(
 # title
  
  titlePanel("Agent Recruitment and Classification Tool/Service"),
  
  # Sidebar with input variables 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId="MaritalStatus", label="Marital Status", 
                   choices = list("Married"="1","Engaged"="4","Divorced"="3","Single"="2")),
      numericInput(inputId="AgentAge", label="Age", 
                    value=0,min=0, max=120),
      selectInput(inputId = "AgentGender", label="Gender", 
                   choices = list("Female"="2","Male"="1")),
      selectInput(inputId="COPCertified", label="COP Certified", 
                    choices = list("Yes"="1","No"="0")),
      selectInput(inputId="LastEmployer_Insurance", label="Is your last employer Insurance industry?", 
                    choices = list("Yes"="1","No"="2")),
      selectInput(inputId="AcademicQualification", label="Academic Qualification", 
                   choices = list("Primary"="1","Ordinary-level"="2","Advanced-level"="3","Certificate"="4","Diploma"="5","Degree"="6","Masters"="7","PhD"="8"))    
      ),
    
    # get prediction
    mainPanel(
      actionButton("Enter", "Get Score"),
      htmlOutput(""),
      htmlOutput("text")
      
    )
  )
))

#runApp('C:/Users/walkerro/Desktop/opiyo')
