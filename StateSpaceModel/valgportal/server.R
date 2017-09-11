
#######           Shiny server to inspect election-trend by county          #####

library(shiny)
load("www/fylketrender.rdata")

names(fylketrender) <- c("Akershus", "Aust-Agder", "Buskerud", "Finnmark", "Hedmark", "Hordaland",
                "Nordland", "Nord-Trøndelag", "Oppland", "Oslo", "Østfold", "Rogaland",
                "Romsdal", "Sogn og Fjordane", "Sør-Trøndelag", "Telemark", "Troms",
                "Vest-Agder", "Vestfold")

xrange <- as.numeric(seq.Date(as.Date("2017-01-01"), as.Date("2017-09-11"), "day"))


partycolors <- c("#AB0017", "#0256A1", "#000194", "#A1044F",
                 "#0C5000", "#B98A00", "#28D03A", "#455C01",
                 "#940A00", "#504A4E")
partycolors<- paste0(partycolors, "70") #Alpha
names(partycolors) <- c("ap", "h", "frp", "sv",
                        "sp", "krf", "v", "mdg",
                        "r", "andre")


#### Get the wanted county #####
function(input, output, session) {
  updateSelectizeInput(session, 'fylke', choices = names(fylketrender),
                       server = TRUE)
  
  dat <- reactive({
    fylketrender[[input$fylke]]
  })

  output$plot <- renderPlot({
    plot(xrange, rep(0, length(xrange)),
         ylim=c(min(input$yval), max(input$yval)),
         xlim=c(min(input$xval), max(input$xval)),
         xlab="",
         ylab="Prosent",
         bty="n",
         type="n",
         axes=FALSE)
    abline(v=as.numeric(seq.Date(as.Date("2017-01-01"), as.Date("2017-09-11"), "month")),
           lty="dashed", col=grey(0.2, alpha=0.5))
    abline(h=seq(0, 100, 5),
           lty="dashed", col=grey(0.2, alpha=0.5))
    axis(2, at=seq(0, 100, 10), las=2, col="white")
    axis(1, at=as.numeric(c(seq.Date(as.Date("2017-01-01"), as.Date("2017-09-01"), "month"), as.Date("2017-09-11"))),
         labels = c(seq.Date(as.Date("2017-01-01"), as.Date("2017-09-01"), "month"), as.Date("2017-09-11")),
         las=2, col="white", cex.axis=0.8)
    
    
    for(j in paste0("_", input$parti, "2")){
      polygon(c(xrange, rev(xrange)),
              c(dat()$X2.5.[grep(j, dat()$id)], rev(dat()$X97.5.[grep(j, dat()$id)])),
              border=FALSE,
              col=partycolors[gsub("[_0-9]", "", j)])
      
      lines(xrange, dat()$mean[grep(j, dat()$id)],
            lwd=2,
            col=partycolors[gsub("[_0-9]", "", j)])
    }
  })
  
  
  }


