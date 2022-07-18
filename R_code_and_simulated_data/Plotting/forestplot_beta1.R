
library(rmeta)
library(forestplot)
library(readxl)
library(gridExtra)


setwd('Chapter2/R_code_and_simulated_data/Plotting')

### input all data scenario's ###
estimate_input <- read_excel('forestplot_input.xlsx', sheet=11) ## risk factor estimates
models <- c("LR_RF","LR_RF_r","LR_RF_h","LR_RF_r_h")
tabletext <- cbind(c("Models","\n",models)) 

### combine all the forest plots
grid.newpage()
pushViewport(viewport(layout = grid.layout(5, 2)))

### default: beta_1 = 0.4 ##
pushViewport(viewport(layout.pos.row = 1, layout.pos.col=1))
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$default_median), 
           lower=c(NA,NA,estimate_input$default_lower), upper=c(NA,NA,estimate_input$default_upper),
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(0, 0.4, 1), 
           xlab= "Beta_1 = 0.4 / 1 / 2", zero=0.4, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)


## beta_1 =1
popViewport()
pushViewport(viewport(layout.pos.row = 1, layout.pos.col=2))
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$beta1_1_median), 
           lower=c(NA,NA,estimate_input$beta1_1_lower), upper=c(NA,NA,estimate_input$beta1_1_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(0.5, 1, 1.5), 
           xlab= "Beta_1 = 0.4 / 1 / 2", zero=1, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)



### sensitivity analysis 8: beta_1 =2 ##
## beta_1 =2 
popViewport()
pushViewport(viewport(layout.pos.row = 5, layout.pos.col=1))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$beta1_2_median), 
           lower=c(NA,NA,estimate_input$beta1_2_lower), upper=c(NA,NA,estimate_input$beta1_2_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(1.5, 2, 2.5), 
           xlab= "Beta_1 = 0.4 / 1 / 2", zero=2, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)



### icc=0.10 ##
## default (gray)
popViewport()
pushViewport(viewport(layout.pos.row = 2, layout.pos.col=1))
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$default_median), 
           lower=c(NA,NA,estimate_input$default_lower), upper=c(NA,NA,estimate_input$default_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(0,0.4,1), 
           xlab= "ICC = 0.10", zero=0.4, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9,new_page=FALSE)

## icc=0.10
popViewport()
pushViewport(viewport(layout.pos.row = 2, layout.pos.col=1))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$icc_0.1_median), 
           lower=c(NA,NA,estimate_input$icc_0.1_lower), upper=c(NA,NA,estimate_input$icc_0.1_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(0,0.4,1), 
           xlab= "ICC = 0.10", zero=0.4, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)


### icc=0.30 ##
## default (gray)
popViewport()
pushViewport(viewport(layout.pos.row = 2, layout.pos.col=2))
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$default_median), 
           lower=c(NA,NA,estimate_input$default_lower), upper=c(NA,NA,estimate_input$default_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(0,0.4,1), 
           xlab= "ICC = 0.30", zero=0.4, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)

## icc=0.30
popViewport()
pushViewport(viewport(layout.pos.row = 2, layout.pos.col=2))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$icc_0.3_median), 
           lower=c(NA,NA,estimate_input$icc_0.3_lower), upper=c(NA,NA,estimate_input$icc_0.3_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(0,0.4,1), 
           xlab= "ICC = 0.30", zero=0.4, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)




### prev [5%, 25%] ##
## default (gray)
popViewport()
pushViewport(viewport(layout.pos.row = 3, layout.pos.col=1))
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$default_median), 
           lower=c(NA,NA,estimate_input$default_lower), upper=c(NA,NA,estimate_input$default_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(0,0.4,1), 
           xlab= "Population prevalences [5%; 25%]", zero=0.4, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)

## prev [5%, 25%]
popViewport()
pushViewport(viewport(layout.pos.row = 3, layout.pos.col=1))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$`5_25_median`), 
           lower=c(NA,NA,estimate_input$`5_25_lower`), upper=c(NA,NA,estimate_input$`5_25_upper`),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(0,0.4,1), 
           xlab= "Population prevalences [5%; 25%]", zero=0.4, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)




### prev [30%, 50%] ##
## default (gray)
popViewport()
pushViewport(viewport(layout.pos.row =3, layout.pos.col=2))
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$default_median), 
           lower=c(NA,NA,estimate_input$default_lower), upper=c(NA,NA,estimate_input$default_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(0,0.4,1), 
           xlab= "Population prevalences [30%; 50%]", zero=0.4, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)

## prev [30%, 50%]
popViewport()
pushViewport(viewport(layout.pos.row = 3, layout.pos.col=2))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$`30_50_median`), 
           lower=c(NA,NA,estimate_input$`30_50_lower`), upper=c(NA,NA,estimate_input$`30_50_upper`),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(0,0.4,1), 
           xlab= "Population prevalences [30%; 50%]", zero=0.4, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)




### prev [10%, 20%] ##
## default (gray)
popViewport()
pushViewport(viewport(layout.pos.row = 4, layout.pos.col=1))
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$default_median), 
           lower=c(NA,NA,estimate_input$default_lower), upper=c(NA,NA,estimate_input$default_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(0,0.4,1), 
           xlab= "Population prevalences [10%; 20%]", zero=0.4, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)

## prev [10%, 20%]
popViewport()
pushViewport(viewport(layout.pos.row = 4, layout.pos.col=1))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$`10_20_median`), 
           lower=c(NA,NA,estimate_input$`10_20_lower`), upper=c(NA,NA,estimate_input$`10_20_upper`),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(0,0.4,1), 
           xlab= "Population prevalences [10%; 20%]", zero=0.4, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)




### prev [10%, 50%] ##
## default (gray)
popViewport()
pushViewport(viewport(layout.pos.row = 4, layout.pos.col=2))
forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$default_median), 
           lower=c(NA,NA,estimate_input$default_lower), upper=c(NA,NA,estimate_input$default_upper),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="gray65", lines="lightgray", zero = "lightgray"), xticks= c(0,0.4,1), 
           xlab= "Population prevalences [10%; 50%]", zero=0.4, lineheight = "auto", boxsize=0.3, colgap=unit(8,"mm"),
           lwd.ci=9, new_page=FALSE)

## prev [10%, 50%]
popViewport()
pushViewport(viewport(layout.pos.row = 4, layout.pos.col=2))

forestplot(labeltext=tabletext, graph.pos=2, 
           mean=c(NA,NA,estimate_input$`10_50_median`), 
           lower=c(NA,NA,estimate_input$`10_50_lower`), upper=c(NA,NA,estimate_input$`10_50_upper`),
           
           txt_gp=fpTxtGp(
             ticks=gpar(cex=0.8),
             xlab=gpar(cex=0.9)),
           
           col=fpColors(box="black", lines="black", zero = "gray50"), xticks= c(0,0.4,1), 
           xlab= "Population prevalences [10%; 50%]", zero=0.4, lineheight = "auto", boxsize=0.2, colgap=unit(8,"mm"),
           lwd.ci=1, ci.vertices=TRUE, ci.vertices.height = 0.2, new_page=FALSE)


