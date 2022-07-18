
nr.pops <- 2
data2 <- cbind(RF,y, test1, test2)

data3<-data2[order(data2[,1]),] # sort data with RF


RF <- data3[,1]
y <- data3[,2]
test1 <- data3[,3]
test2 <- data3[,4]


popu <- c()

### population size
pop.size1 <- sum(RF==0)
pop.size2 <- sum(RF==1)
pop.size <- c(pop.size1, pop.size2)


cum.pop <- ave(pop.size,  FUN=cumsum)

for (d in 1:nr.pops) {
cat('\n')
cat('\t','***************','\n') 
cat('\t', 'Population No:', d, '\n')
cat('\t','***************','\n') 
cat('\n')

pos.pos<- 0
pos.neg<- 0
neg.pos<- 0
neg.neg<- 0

crosstab<-c()
for (j in (cum.pop[d]-pop.size[d]+1):(cum.pop[d])) {
cat('\t', 'Subject No:', j, '\n')



        if ((test1[j] ==1)&(test2[j] ==1)) pos.pos<-pos.pos+1

        if ((test1[j] ==1)&(test2[j] ==0)) pos.neg<-pos.neg+1

        if ((test1[j] ==0)&(test2[j] ==1)) neg.pos<-neg.pos+1

        if ((test1[j] ==0)&(test2[j] ==0)) neg.neg<-neg.neg+1

 
 

                         }  
        crosstab<- c(crosstab,c(pos.pos, pos.neg, neg.pos, neg.neg))
        popu <- rbind(popu,crosstab)

}

pop<-c(t(popu))
n <- c(rowSums(popu))
n<- unname(n)


colnames(popu) <- c('T1+T2+','T1+T2-','T1-T2+','T1-T2-')
names(dimnames(popu))<- c('Population', '')

rownames(popu) <- c(0,1)



setwd('Chapter2/R_code_and_simulated_data/Data')
write.xlsx(data.frame(popu), "cross_tab_RF.xlsx", sheetName="Sheet1")
setwd('Chapter2/R_code_and_simulated_data')

