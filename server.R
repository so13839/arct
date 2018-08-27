#This is the server logic of a Shiny web application. You can run the application by clicking 'Run App' above.
library(shiny)
library(e1071)
load(file = "SVM")

# Define server logic
server = function(input,output,session){
  observeEvent( input$Enter, {
    AcademicQualification1 = input$AcademicQualification
    AgentAge = input$AgentAge
    COPCertified1 = input$COPCertified
    MaritalStatus1 = input$MaritalStatus
    AgentGender1 = input$AgentGender
    LastEmployer_Insurance1 = input$LastEmployer_Insurance
    Data = data.frame(MaritalStatus1,AgentAge,AgentGender1,COPCertified1,LastEmployer_Insurance1,AcademicQualification1)
    Data$COPCertified<-as.numeric(Data$COPCertified)
    Data$LastEmployer_Insurance<-as.numeric(Data$LastEmployer_Insurance)
    Data$AgentGender<-as.numeric(Data$AgentGender)
    Data$MaritalStatus<-as.numeric(Data$MaritalStatus)
    Data$AcademicQualification<-as.numeric(Data$AcademicQualification)
    Pred<-predict(SVM, Data)
   
    output$text<-renderText({
        if (Pred==1) {
          return(paste("<span style=\"color:red; font-size: 20px\">Agent score is 1, Very Poor (probability of a customer to lapse is 91-100%)</span>"))
         } else {
          if (Pred==2) {
            return(paste("<span style=\"color:purple; font-size: 20px\">Agent score is 2, Poor (probability of a customer to lapse is 76 - 90%)</span>"))
           } else {
            if (Pred==3) {
              return(paste("<span style=\"color:orange; font-size: 20px\">Agent score is 3, Fair (probability of a customer to lapse is 41 - 75%)</span>"))
            } else {
              if (Pred==4) {
                return(paste("<span style=\"color:gold; font-size: 20px\">Agent score is 4, Good (probability of a customer to lapse is 21 - 40%)</span>"))
              } else {
                if (Pred==5) {
                  return(paste("<span style=\"color:blue; font-size: 20px\">Agent score is 5, Very Good (probability of a customer to lapse is 11 - 20%)</span>"))
                } else {
                  return(paste("<span style=\"color:green; font-size: 20px\">Agent score is 6, Excellent (probability of a customer to lapse 1 - 10%)</span>"))
                  
        }}}}}
      
      })
  })
}