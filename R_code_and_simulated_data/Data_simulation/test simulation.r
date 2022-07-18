
### true y's
nr.pos <- sum(y==1)
nr.neg <- sum(y==0)

### test1, true accuracy: 70% se, 99% sp
#set.seed(203)

change1 <- sample(which(y == 1), round(nr.pos*0.30),0)
test1 <- y
test1[change1] <- 0

change2 <- sample(which(y == 0), round(nr.neg*0.01),0)
test1[change2] <- 1




### test2, true accuracy: 75% se, 95% sp

change2.1 <- sample(which(y == 1), round(nr.pos*0.25),0)
test2 <- y
test2[change2.1] <- 0

change2.2 <- sample(which(y == 0), round(nr.neg*0.05),0)
test2[change2.2] <- 1


