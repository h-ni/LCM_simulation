
library('coda')

inits1<-list(Se1=0.9, Sp1=0.9, Se2=0.9, Sp2=0.9)
inits2<-list(Se1=0.6, Sp1=0.8, Se2=0.6, Sp2=0.8)
inits3<-list(Se1=0.7, Sp1=0.7, Se2=0.7, Sp2=0.7)
inits4<-list(Se1=0.8, Sp1=0.6, Se2=0.8, Sp2=0.6)
inits <- list(inits1, inits2, inits3, inits4)

latent <- run.jags('model-population.txt', monitor= c('Se1', 'Sp1', 'Se2','Sp2', 'p'), 
                   data =list(pop=pop, nr.pops=nr.pops, n=n), 
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



