

nr.individual <- length(y)
individual.id <- seq(1,nr.individual)

pop <- c()
pos.pos<- rep(0,nr.individual)
pos.neg<- rep(0,nr.individual)
neg.pos<- rep(0,nr.individual)
neg.neg<- rep(0,nr.individual)


for (i in 1:nr.individual) {
cat('\n')
cat('\t','***************','\n') 
cat('\t', 'Population No:', pop.id[i], '\n')
cat('\t', 'Inidivdual No:', i, '\n')



        if ((test1[i] ==1)&(test2[i] ==1)) pos.pos[i]<- 1

        if ((test1[i] ==1)&(test2[i] ==0)) pos.neg[i]<- 1

        if ((test1[i] ==0)&(test2[i] ==1)) neg.pos[i]<- 1

        if ((test1[i] ==0)&(test2[i] ==0)) neg.neg[i]<- 1


 }  


        popu<- cbind(pos.pos, pos.neg, neg.pos, neg.neg)


pop1 <- pos.pos
pop2 <- pos.neg
pop3 <- neg.pos
pop4 <- neg.neg
#pop<- unname(popu)
#pop<-c(popu)
#n <- rep(1, nr.individual)

colnames(popu) <- c('T1+T2+','T1+T2-','T1-T2+','T1-T2-')
names(dimnames(popu))<- c('Individual', '')


rownames(popu) <- individual.id


tests <- cbind(test1,test2)



