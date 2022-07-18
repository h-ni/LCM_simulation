
nr.pops <- length(unique(herd.id))


popu <- c()

### population size
count <- function(x, n){ length((which(x == n))) }
pop.size <- c()
for (i in 1:length(unique(herd.id)))
{

pop.size <- c(pop.size,count(unique(herd.id)[i],herd.id))
}


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

rownames(popu) <- c(unique(herd.id))


setwd('Chapter2/R_code_and_simulated_data/Data')
write.xlsx(data.frame(popu), "cross_tab_herd.xlsx", sheetName="Sheet1")
setwd('Chapter2/R_code_and_simulated_data')


