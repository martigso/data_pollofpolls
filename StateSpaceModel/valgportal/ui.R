

######          UI to inspect election trend by county        #####

#
shinyUI(
  #fluidPage allows rows with columns
  fluidPage(
    
    #This app will have a sidebar
    sidebarPanel(

      
      #Fylke
      selectizeInput("fylke", label="Hvilket fylke?", 
                  choices = NULL),
      
      #Party
      checkboxGroupInput("parti", "Hvilke partier?", 
                         choiceNames = c("Arbeiderpartiet", "Høyre", "Fremskrittspartiet", "Sosialistisk Venstreparti",
                                     "Senterpartiet", "Kristelig Folkeparti", "Venstre", "Miljøpartiet De Grønne",
                                     "Rødt", "Andre"),
                         choiceValues = c("ap", "h", "frp", "sv",
                                         "sp", "krf", "v", "mdg",
                                         "r", "andre"),
                         selected = c("ap", "h")),
      
      
      #Yaxis
      sliderInput("yval", label="Lengde på Y-aksen", 
                   step = 5,
                   min = 0, max = 100,
                  value=c(0, 60)),
      
      sliderInput("xval", label="Lengde på Y-aksen", 
                  step = 1,
                  min = min(seq.Date(as.Date("2017-01-01"), as.Date("2017-09-11"), "day")),
                  max = max(seq.Date(as.Date("2017-01-01"), as.Date("2017-09-11"), "day")),
                  
                  value=c(min(seq.Date(as.Date("2017-01-01"), as.Date("2017-09-11"), "day")),
                          max(seq.Date(as.Date("2017-01-01"), as.Date("2017-09-11"), "day"))))
    ),
    
    mainPanel( plotOutput("plot") )
    
    
  ))