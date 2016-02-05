setwd("~/Desktop/nyc DSB/Shiny")
#load library
library(shiny)
library(googleVis)
#set factors
factors<-c("Education","Race","Region","Marital_Status","Work_time","Job_type")
#load data
all<-read.table("AllIncomeData.txt",header=T,sep="\t")

shinyServer(function(input, output) {
  
  mydata <- reactive({
    tb<-subset(all, factor%in%input$factor)
    tb<-tb[,-c(2:5,7)]
    tb$GroupID<-as.numeric(tb$group)
    return(tb)
  })
  
  output$motionchart<- renderGvis({
    motion=gvisMotionChart(mydata(), 
                           idvar="group", 
                           timevar="Year",
                           xvar="Average_Income",yvar="Difference_Income",
                           sizevar="Population",colorvar="GroupID")
    return(motion)
  })
 # outputOptions(output, "motionchart", suspendWhenHidden = FALSE)
})


