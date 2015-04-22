## ui.R ##
library(shinydashboard)
library(shiny)
#library(ShinyDash)
#shinyUI(


dashboardPage(
  
  dashboardHeader(title = "RF Prediction"),

  dashboardSidebar(
    sidebarMenu(
      #menuItem(""),
      menuItem(""),
      menuItem(""),
      menuItem("Prediction", tabName = "napoved", icon = icon("dashboard")),  # badgeLabel = "new", badgeColor = "green"
      #menuItem("Importance", tabName= "importance", icon=icon("database")),
      menuItem("About", tabName="about", icon = icon("pencil"))
    )
  ),
  
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "napoved",
               fluidRow(
                 box(title="Basic", solidHeader=T, collapsible = T, background = "black",width=4,status = "primary",
                     selectInput("Demo_spol","Gender",
                                 choices = list("Male"="Moški","Female"="Ženski"), selected="Moški"), 
                                 #choices = list("Male"="MoĹˇki","Female"="Ĺ˝enski"), selected="MoĹˇki"),
                     sliderInput("Demo_star","Age",min=18,max=75,value=30),
                     sliderInput("st.bz.pozna","Number of brands respondent knows about",1,30,10),
                     selectInput("frek.g","Frequency of purchase",
                                 choices=list("Every day" = 365, "Once per week" = 52, "Once per 14 days" = 26,
                                              "Once per month" = 12, "Once per 3 months" = 4, "Once per 6 months" = 2,
                                              "Rarely than once per 6 months" =  1), selected=26),
                     selectInput("frek.l","Frequency of visiting Pubs",
                                 choices=list("Every day" = 365, "Once per week" = 52, "Once per 14 days" = 26,
                                              "Once per month" = 12, "Once per 3 months" = 4, "Once per 6 months" = 2,
                                              "Rarely than once per 6 months" =  1), selected=26),
                     uiOutput("st.bz.g"),
                     uiOutput("st.bz.l")
                     ),
                 box(title="Which brands do consumer purchase",collapsible = T, background = "black",width=8,status = "primary",
                     fluidRow(
                       column(4,checkboxInput("p.01","Brand A", value=FALSE)),
                       column(4,checkboxInput("p.02","Brand B", value=FALSE)),
                       column(4,checkboxInput("p.03","Brand C", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.04","Brand D", value=FALSE)),
                       column(4,checkboxInput("p.05","Brand E", value=FALSE)),
                       column(4,checkboxInput("p.06","Brand F", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.07","Brand G", value=FALSE)),
                       column(4,checkboxInput("p.08","Brand H", value=FALSE)),
                       column(4,checkboxInput("p.09","Brand I", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.10","Brand J", value=FALSE)),
                       column(4,checkboxInput("p.11","Brand K", value=FALSE)),
                       column(4,checkboxInput("p.12","Brand L", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.13","Brand M", value=FALSE)),
                       column(4,checkboxInput("p.14","Brand N", value=FALSE)),
                       column(4,checkboxInput("p.15","Brand O", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.16","Brand P", value=FALSE)),
                       column(4,checkboxInput("p.17","Brand Q", value=FALSE)),
                       column(4,checkboxInput("p.18","Brand R", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.19","Brand S", value=FALSE)),
                       column(4,checkboxInput("p.20","Brand T", value=FALSE)),
                       column(4,checkboxInput("p.21","Brand U", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.22","Brand V", value=FALSE)),
                       column(4,checkboxInput("p.23","Brand Z", value=FALSE)),
                       column(4,checkboxInput("p.24","Brand X", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.25","Brand Y", value=FALSE)),
                       column(4,checkboxInput("p.26","Brand AA", value=FALSE)),
                       column(4,checkboxInput("p.27","Brand BB", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.28","Brand CC", value=FALSE)),
                       column(4,checkboxInput("p.29","Brand DD", value=FALSE)),
                       column(4,checkboxInput("p.30","Brand EE", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.31","Brand FF", value=FALSE)),
                       column(4,checkboxInput("p.32","Brand GG", value=FALSE)),
                       column(4,checkboxInput("p.33","Brand HH", value=FALSE))
                       
                     ),
                     fluidRow(
                       column(4,checkboxInput("p.34","Brand II", value=FALSE))
                     ) 
                 )
                 
                 ),
              hr(),
              #h4(paste("The respondent is a:")),  
              fluidRow(
                 #valueBoxOutput("arhetip"),
                 box(title="Segment Probability",collapsible = T, background = "black",width=8,status = "warning",
                  textOutput("prediction.novodobniki"),
                  textOutput("prediction.zmaji"),
                  textOutput("prediction.pivoplus"),
                  textOutput("prediction.zlatorogi"),
                  textOutput("prediction.etabliranci")
                 )
               ),
              fluidRow(
                box(title="Segment | Probability",solidHeader=T, collapsible = T, width=12,status = "warning",
                plotOutput("plot.bar"))
              )
              ),
                
      # Second tab content
      #tabItem(tabName = "importance", plotOutput("plot4")),
      tabItem(tabName = "about", includeMarkdown("about.Rmd"))
    )
    #gridster(tile.width = 250, tile.height = 250,
     #        gridsterItem(col =1, row = 1, size.x = 1, size.y = 1,
      #                    weatherWidgetOutput("weatherWidget", width="100%", height="90%")))
  )
 )
#)