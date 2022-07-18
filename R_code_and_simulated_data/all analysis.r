

setwd('Chapter2/R_code_and_simulated_data')
library('rjags')
library('runjags')
library('fmsb') #to check the Nagelkerke's R2
library('lme4')
library(xlsx)
library(readxl)
library(dplyr)

# data simulation
#source('Data_simulation/data sim1.r')

## data ##
## change sheet number to get different data scenarios
data <- read_excel('Data/simulated_data.xlsx', sheet=1)

pop.id <- data$`Population ID`
herd.id <- data$`Herd ID`
y <- data$`True y`
RF <- data$RF
test1 <- data$test1
test2 <- data$test2

## estimates check ##
freq_mixed <- glmer(y ~ RF + (1|herd.id) + (1|pop.id), family = binomial(link="logit"), control = glmerControl(optimizer = "bobyqa", optCtrl=list(maxfun=50000)))
summary(freq_mixed)



##### HW models ####
## stratify on region ##
source('HW_model/crosstab.r')

## stratify on herd ##
#source('HW_model/crosstab-2.r')

## stratify on RF ##
#source('HW_model/crosstab-3.r')

source('HW_model/model population.r')
##########################


##### LR models #####
data <- read_excel('Data/simulated_data.xlsx', sheet=1)

pop.id <- data$`Population ID`
herd.id <- data$`Herd ID`
y <- data$`True y`
RF <- data$RF
test1 <- data$test1
test2 <- data$test2
cum.pop <- c(2000, 4000)
source('LR_model/model individual.r')
source('LR_model/model1.1.r') #LR_pop 
#source('LR_model/model1.2.r') #LR_herd
#source('LR_model/model1.3.r') #LR_pop_herd
#source('LR_model/model1.5.r') #LR_RF_pop 
#source('LR_model/model1.6.r') #LR_RF_herd
#source('LR_model/model1.7.r') #LR_all

#source('HW_model/crosstab-3.r')
#source('LR_model/model individual.r')
#source('LR_model/model1.4.r') #LR_RF 


###############################
### forest plots default scenario 
source('Plotting/forestplot_default.r')

## forest plots sensitivity analyses, se & sp have separate x-axis
source('Plotting/forestplot_sensitivity_analyses.r')

### forest plots all scenario's estimates beta_1
source('Plotting/forestplot_beta1.r')


