###############################################################################
##            Simulation study for latent class models                       ##
##                                                                           ##
##                         Simulate the datasets                             ##
##                                                                           ##
##                          last updated 23-05-2021                          ##
##                                haifang ni                                 ##
###############################################################################



### for all simulated datasets: seed=203 ##
#set.seed(203)

## two regions are simulated for each scenario
## both regions contain 20 herds, within each herd 100 animals
## For simulation of each region, we use the same model, same risk factor, same beta_1
## but different fixed intercept  (i.e., beta_0) to obtain different region prevalences [10%; 30%]

## determine the sample size
J=20  # number of herds per region
k=100 # number of animals per herd (equal sized)

n_j <- rep(k, J)  # number of animals in each herd (i.e., 100)
herds_region1 <- rep(seq(1, J), n_j)     # herd ID per animal in region 1
herds_region2 <- rep(seq(J+1, 2*J), n_j) # herd ID per animal in region 2
N1 <- sum(n_j) # sample size region 1
N2 <- sum(n_j) # sample size region 2
pop.id1 <- rep(1, J*k) # region ID per animal in region 1
pop.id2 <- rep(2, J*k)# region ID per animal in region 2

## simulate risk factor with success/present rate of 0.30 within each region
x1<-rbinom(N1, 1, 0.3)
x2<-rbinom(N2, 1, 0.3)



## assign values to the parameters
## default: region1=10%, region2=30%, seed=203
icc <- 0.20
beta_1 <- 0.40
beta_0_region1 <- -2.32
beta_0_region2 <- -0.97




# variance for the random herd effects calculated from the ICC value
var_u <- (icc*(pi^2)/3)/(1-icc)

### random herd effects for all herds from the two regions
u_j <-rnorm(J*2, 0, sqrt(var_u))


## calculate the linear predictor
eta1 <- beta_0_region1 + beta_1 * x1 + u_j[herds_region1]
eta2 <- beta_0_region2 + beta_1 * x2 + u_j[herds_region2]

# calculate the disease probability for each animal based on the linear predictor
p1 <- exp(eta1)/(1 + exp(eta1))
p2 <- exp(eta2)/(1+ exp(eta2))


# sample the binary outcome for each animal on the basis of the disease probability 
y1 <- rbinom(N1, 1, p1)
y2 <- rbinom(N2, 1, p2)


## bind the data
pop.id <- c(pop.id1, pop.id2)  # region ID
herd.id <- c(herds_region1, herds_region2)     # herd ID
RF <- c(x1, x2)                # risk factor
y <- c(y1, y2)                 # true binary outcome
p <- c(p1, p2)                 # true disease probability 

data <- cbind(pop.id, herd.id, y, RF,  u_j[herd.id])
data_opslaan <- cbind(pop.id, herd.id, y, p, RF, u_j[herd.id])
colnames(data_opslaan) <- c('Population ID', 'Herd ID', 'True disease status (y)','True disease probability (p)', 'Risk factor (x)', 'Random herd effect')


#control the prevalences of the 2 regions
prev1<-sum(y1)/(J*k)
prev2<-sum(y2)/(J*k)
cat( '  prevalence model development dataset  =', prev1)
cat('\n')
cat( '  prevalence model application dataset  =', prev2)
cat('\n')
cat('\n')
cat('\n')



