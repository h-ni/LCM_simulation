
##### cluster size & within cluster prev based on blood test###

count <- function(x, n){ length((which(x == n))) }


### bedrijf size
herd.size <- c()

for (i in 1:length(unique(herd.id)))
{

herd.size <- c(herd.size,count(unique(herd.id)[i],herd.id))

}





## within herd prevalence  ####
nrper.pos<- aggregate(y, by=list(herd.id), FUN=sum)[2]
herd.prev <- nrper.pos/herd.size

###add herd.prev to each subject###
herd.prev <- herd.prev$x
#cluster.prev <- round(rep(herd.prev, herd.size),3)

print(herd.prev)


herd.prev1 = herd.prev[1:20]
herd.prev2 = herd.prev[21:40]


rangeX<-seq(0,1,0.05)
par(mfrow=c(1,2))
hist(herd.prev1, breaks=20, col="red", xlab="within herd prevalence",main=" ", ylim=c(0, 6), xlim=c(0,1), cex.axis=1.7, cex.main=1.6, cex.lab=1.4)
hist(herd.prev2, breaks=20, col="red", xlab="within herd prevalence",main=" ", ylim=c(0, 6), xlim=c(0,1), cex.axis=1.7, cex.main=1.6, cex.lab=1.4)
plot(density(herd.prev),col='blue', lwd=2,  xlab="within herd prevalence",main="Density for within herd prevalences",cex.axis=1.7, cex.main=1.6, cex.lab=1.4)
