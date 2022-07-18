setwd('Chapter2/R_code_and_simulated_data')

library('rjags')
library('runjags')
library('coda')

cum.pop1=cum.pop[1]
cum.pop2=cum.pop[2]

inits1<-list(Se1=0.8, Sp1=0.8, Se2=0.8, Sp2=0.8)
inits2<-list(Se1=0.7, Sp1=0.7, Se2=0.7, Sp2=0.7)
inits3<-list(Se1=0.6, Sp1=0.6, Se2=0.6, Sp2=0.6)
inits4<-list(Se1=0.5, Sp1=0.5, Se2=0.5, Sp2=0.5)
inits <- list(inits1, inits2, inits3, inits4)

latent <- run.jags('LR_model/model1.7.txt', monitor= c('Se1','Sp1','Se2','Sp2','beta_0','beta_1','pop1','pop2','var_r','var_h'), 
                   data =list(cum.pop1=cum.pop1, cum.pop2=cum.pop2, herd.id=herd.id, pop.id=pop.id, RF=RF, pop=structure(.Data=popu, .Dim=c(cum.pop2,4)), 
                   tests= structure(.Data=tests, .Dim=c(cum.pop2,2))), 
                   inits= inits,
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














