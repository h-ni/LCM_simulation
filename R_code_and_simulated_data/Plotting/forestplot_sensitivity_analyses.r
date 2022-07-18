
library(rmeta)
library(forestplot)
library(readxl)
library(gridExtra)


setwd('Chapter2/R_code_and_simulated_data/Plotting')

### input per data scenario ###
#estimate_default_input <- read_excel('forestplot_input.xlsx', sheet=1) ## default

estimate_input <- read_excel('forestplot_input.xlsx', sheet=2) ## icc=0.10
#estimate_input <- read_excel('forestplot_input.xlsx', sheet=3) ## icc=0.30

#estimate_input <- read_excel('forestplot_input.xlsx', sheet=4) ## beta_1=1
#estimate_input <- read_excel('forestplot_input.xlsx', sheet=5) ## beta_1=2

#estimate_input <- read_excel('forestplot_input.xlsx', sheet=6) ## prev [5%, 25%]
#estimate_input <- read_excel('forestplot_input.xlsx', sheet=7) ## prev [30%, 50%]

#estimate_input <- read_excel('forestplot_input.xlsx', sheet=8) ## prev [10%, 20%]
#estimate_input <- read_excel('forestplot_input.xlsx', sheet=9) ## prev [10%, 50%]

estimate_input <- read_excel('forestplot_input.xlsx', sheet=10) ## RF rate = 0.50


models <- c("HW_r","LR_r","HW_h","LR_h","HW_RF","LR_RF","LR_r_h","LR_RF_r","LR_RF_h","LR_RF_r_h")
tabletext <- cbind(c("RF success rate = 0.50","\n",models)) 


se1_lower_default <- estimate_default_input$se1_lower
se1_median_default<- estimate_default_input$se1_median
se1_upper_default <- estimate_default_input$se1_upper
sp1_lower_default <- estimate_default_input$sp1_lower
sp1_median_default<- estimate_default_input$sp1_median
sp1_upper_default <- estimate_default_input$sp1_upper
se2_lower_default <-  estimate_default_input$se2_lower
se2_median_default<- estimate_default_input$se2_median
se2_upper_default <- estimate_default_input$se2_upper
sp2_lower_default <- estimate_default_input$sp2_lower
sp2_median_default<- estimate_default_input$sp2_median
sp2_upper_default <- estimate_default_input$sp2_upper

se1_lower <- estimate_input$se1_lower
se1_median<- estimate_input$se1_median
se1_upper <- estimate_input$se1_upper
sp1_lower <- estimate_input$sp1_lower
sp1_median<- estimate_input$sp1_median
sp1_upper <- estimate_input$sp1_upper
se2_lower <- estimate_input$se2_lower
se2_median<- estimate_input$se2_median
se2_upper <- estimate_input$se2_upper
sp2_lower <- estimate_input$sp2_lower
sp2_median<- estimate_input$sp2_median
sp2_upper <- estimate_input$sp2_upper


  
grid.newpage()
pushViewport(viewport(layout = grid.layout(4, 1)))
pushViewport(viewport(layout.pos.row = 1,layout.pos.col = 1))

### output forest plot ###
### Se1 ###
  forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,se1_median_default), 
           lower=c(NA,NA,se1_lower_default), upper=c(NA,NA,se1_upper_default),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(50,60,70,80, 90,100), 
           #xlab= "Test 1:  Se1 (%),  Sp1 (%)",
           xlab='Se1 (%)',
           zero=70, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)


popViewport()
pushViewport(viewport(layout.pos.row = 1,layout.pos.col = 1))

  
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,se1_median), 
           lower=c(NA,NA,se1_lower), upper=c(NA,NA,se1_upper),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(50,60,70,80, 90,100),   
           #xlab= "Test 1:  Se1 (%),  Sp1 (%)",
           xlab= 'Se1 (%)',
           #zero=69.5%, # voor [10%, 20%]
           zero=70, 
           lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)
           




### output forest plot ###
### Sp1 ###
popViewport()
#pushViewport(viewport(layout.pos.row = 1))
pushViewport(viewport(layout.pos.row = 2,layout.pos.col = 1))


forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,sp1_median_default), 
           lower=c(NA,NA,sp1_lower_default), upper=c(NA,NA,sp1_upper_default),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(50,60, 70, 80, 90, 99,100), 
           #xlab= "Test 1:  Se1 (%),  Sp1 (%)",
           xlab= 'Sp1 (%)',
           zero=99, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)
           


popViewport()
#pushViewport(viewport(layout.pos.row = 1))
pushViewport(viewport(layout.pos.row = 2,layout.pos.col = 1))


forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,sp1_median), 
           lower=c(NA,NA,sp1_lower), upper=c(NA,NA,sp1_upper),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(50,99,100), 
           #xlab= "Test 1:  Se1 (%),  Sp1 (%)",
           xlab = 'Sp1 (%)',
           zero=99, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)







### output forest plot ###
### Se2 ###
popViewport()
#pushViewport(viewport(layout.pos.row = 2))
pushViewport(viewport(layout.pos.row = 3,layout.pos.col = 1))


forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,se2_median_default), 
           lower=c(NA,NA,se2_lower_default), upper=c(NA,NA,se2_upper_default),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(50,60, 70, 75,80, 90, 100), 
           #xlab= "Test 2:  Se2 (%),  Sp2 (%)",
           xlab='Se2 (%)',
           zero=75, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)


popViewport()
#pushViewport(viewport(layout.pos.row = 2))
pushViewport(viewport(layout.pos.row = 3,layout.pos.col = 1))


forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,se2_median), 
           lower=c(NA,NA,se2_lower), upper=c(NA,NA,se2_upper),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(50, 75,100), 
           #xlab= "Test 2:  Se2 (%),  Sp2 (%)",
           xlab='Se2 (%)',
           zero=75, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)




### output forest plot ###
### Sp2 ###
popViewport()
#pushViewport(viewport(layout.pos.row = 2))
pushViewport(viewport(layout.pos.row = 4,layout.pos.col = 1))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,sp2_median_default), 
           lower=c(NA,NA,sp2_lower_default), upper=c(NA,NA,sp2_upper_default),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(50,60, 70, 80, 90, 95,100), 
           #xlab= "Test 2:  Se2 (%),  Sp2 (%)",
           xlab='Sp2 (%)',
           zero=95, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)


popViewport()
#pushViewport(viewport(layout.pos.row = 2))
pushViewport(viewport(layout.pos.row = 4,layout.pos.col = 1))


forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,sp2_median), 
           lower=c(NA,NA,sp2_lower), upper=c(NA,NA,sp2_upper),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(50,95,100), 
           #xlab= "Test 2:  Se2 (%),  Sp2 (%)",
           xlab='Sp2 (%)',
           zero=95, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)


