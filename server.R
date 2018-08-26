# This is the server logic of a Shiny web application. You can run the application by clicking 'Run App' above.
library(shiny)
library(e1071)
SVM<-readRDS(file = "SVM")

MaritalStatus,AgentAge,AgentGender,COPCertified,LastEmployer_Insurance,AcademicQualification
# Define server logic
server = function(input,output,session){
  observeEvent( input$Enter, {
    AcademicQualification = input$AcademicQualification
    AgentAge = input$AgentAge
    COPCertified = input$COPCertified
    MaritalStatus = input$MaritalStatus
    AgentGender = input$AgentGender
    LastEmployer_Insurance = input$LastEmployer_Insurance
    Data = data.frame(MaritalStatus,AgentAge,AgentGender,COPCertified,LastEmployer_Insurance,AcademicQualification)
    
    Data$COPCertified<-as.numeric(Data$COPCertified)
    Data$LastEmployer_Insurance<-as.numeric(Data$Employer_Insurance)
    Data$AgentGender<-as.numeric(Data$AgentGender)
    Data$MaritalStatus<-as.numeric(Data$MaritalStatus)
    
    Pred<-predict(SVMb, Data)
   
    output$text<-renderText({
        if (Pred==1) {
          return(paste("<span style=\"color:red; font-size: 20px\">Your score is 1, Very Poor (probability of lapse 91-100%)</span>"))
         } else {
          if (Pred==2) {
            return(paste("<span style=\"color:purple; font-size: 20px\">Your score is 2, Poor (probability of lapse 76 - 90%)</span>"))
           } else {
            if (Pred==3) {
              return(paste("<span style=\"color:orange; font-size: 20px\">Your score is 3, Fair (probability of lapse 41 - 75%)</span>"))
            } else {
              if (Pred==4) {
                return(paste("<span style=\"color:gold; font-size: 20px\">Your score is 4, Good (probability of lapse 21 - 40%)</span>"))
              } else {
                if (Pred==5) {
                  return(paste("<span style=\"color:blue; font-size: 20px\">Your score is 5, Very Good (probability of lapse 11 - 20%)</span>"))
                } else {
                  return(paste("<span style=\"color:green; font-size: 20px\">Your score is 6, Excellent (probability of lapse 1 - 10%)</span>"))
                  
        }}}}}
      
      })
  })
}