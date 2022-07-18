setwd('Chapter2/R_code_and_simulated_data')

library('rjags')
library('runjags')
library('coda')

cum.pop1=cum.pop[1]
cum.pop2=cum.pop[2]


inits1<-list(Se1=0.9, Sp1=0.9, Se2=0.9, Sp2=0.9)
inits2<-list(Se1=0.6, Sp1=0.8, Se2=0.6, Sp2=0.8)
inits3<-list(Se1=0.7, Sp1=0.7, Se2=0.7, Sp2=0.7)
inits4<-list(Se1=0.8, Sp1=0.6, Se2=0.8, Sp2=0.6)
inits <- list(inits1, inits2, inits3, inits4)


latent <- run.jags('LR_model/model1.4.txt', monitor= c('Se1','Sp1','Se2','Sp2','beta_0','beta_1','pop1','pop2'), 
                   data =list(cum.pop1=cum.pop1, cum.pop2=cum.pop2, RF=RF, pop=structure(.Data=popu, .Dim=c(cum.pop2, 4)), 
                   tests= structure(.Data=tests, .Dim=c(cum.pop2,2))), 
                   inits=inits,
                   n.chains = 4, burnin=5000, sample=10000, adapt=5000, method = 'parallel')

print(latent, digits=3)

print(divide.jags(latent, which.chains=1))
print(divide.jags(latent, which.chains=2))
print(divide.jags(latent, which.chains=3))
print(divide.jags(latent, which.chains=4))




## check the chains
output <- divide.jags(latent, which.chains=c(1,2,3,4))
output
resultaat <- round(output$summaries,3)
resultaat


# use coda plot() or use ggplot2 traceplot()##
plot(beta1_mcmc)
traceplot(beta1_mcmc)

se1_4chains <- cbind(se1_mcmc[[1]],se1_mcmc[[2]],se1_mcmc[[3]],se1_mcmc[[4]])
sp1_4chains <- cbind(sp1_mcmc[[1]],sp1_mcmc[[2]],sp1_mcmc[[3]],sp1_mcmc[[4]])
se2_4chains <- cbind(se2_mcmc[[1]],se2_mcmc[[2]],se2_mcmc[[3]],se2_mcmc[[4]])
sp2_4chains <- cbind(sp2_mcmc[[1]],sp2_mcmc[[2]],sp2_mcmc[[3]],sp2_mcmc[[4]])
beta0_4chains <- cbind(beta0_mcmc[[1]],beta0_mcmc[[2]],beta0_mcmc[[3]],beta0_mcmc[[4]])
beta1_4chains <- cbind(beta1_mcmc[[1]],beta1_mcmc[[2]],beta1_mcmc[[3]],beta1_mcmc[[4]])



















