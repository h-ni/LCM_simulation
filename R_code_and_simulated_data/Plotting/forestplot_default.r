
library(rmeta)
library(forestplot)
library(readxl)
library(gridExtra)


setwd('Chapter2/R_code_and_simulated_data/Plotting')


estimate_input <- read_excel('forestplot_input.xlsx', sheet=1)

models <- c("HW_r","LR_r","HW_h","LR_h","HW_RF","LR_RF","LR_r_h","LR_RF_r","LR_RF_h","LR_RF_r_h")
tabletext <- cbind(c("Models","\n",models))

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
pushViewport(viewport(layout.pos.row = 1, layout.pos.col = 1))

### Se1 ###
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,se1_median), 
           lower=c(NA,NA,se1_lower), upper=c(NA,NA,se1_upper),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(50, 60, 70, 80, 90, 100),  
           #xlab= "Test 1:  Se1 (%),  Sp1 (%)",
           xlab= 'Se1 (%)',
           zero=70, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)


### Sp1 ###
popViewport()
pushViewport(viewport(layout.pos.row = 2, layout.pos.col = 1))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,sp1_median), 
           lower=c(NA,NA,sp1_lower), upper=c(NA,NA,sp1_upper),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(50, 60, 70, 80, 90, 99, 100), 
           #xlab= "Test 1:  Se1 (%),  Sp1 (%)",
           xlab= 'Sp1 (%)',
           zero=99, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)


### Se2 ###
popViewport()
#pushViewport(viewport(layout.pos.row = 2))
pushViewport(viewport(layout.pos.row = 3, layout.pos.col = 1))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,se2_median), 
           lower=c(NA,NA,se2_lower), upper=c(NA,NA,se2_upper),
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(50, 60, 70, 75, 80, 90, 100), 
           #xlab= "Test 2:  Se2 (%),  Sp2 (%)",
           xlab= 'Se2 (%)',
           zero=75, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)


### Sp2 ###
popViewport()
#pushViewport(viewport(layout.pos.row = 2))
pushViewport(viewport(layout.pos.row = 4, layout.pos.col = 1))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,sp2_median), 
           lower=c(NA,NA,sp2_lower), upper=c(NA,NA,sp2_upper),
           #title="Sp2 (%)",
           hrzl_line = list("9" = gpar(lwd = 1, lty=2, col = "black")),
           
           txt_gp=fpTxtGp(#label=gpar(cex=1),
             ticks=gpar(cex=0.8),
             #title=gpar(cex = 1.5)),
             xlab=gpar(cex=1)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(50, 60, 70, 80, 90, 95, 100), 
           #xlab= "Test 2:  Se2 (%),  Sp2 (%)",
           xlab= 'Sp2 (%)',
           zero=95, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)


