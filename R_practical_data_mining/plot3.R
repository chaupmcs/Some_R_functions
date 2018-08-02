set.seed(8)               # this makes the example reproducible
N     = 100000# this is how many data you want
probs = c(0.5281774, 0.01907089, 0.14569678, 0.3070549)          # these are *cumulative* probabilities; since they 
#   necessarily sum to 1, the last would be redundant
means_ =  c(-39056.8117562, 1902885.30663239, 152396.81151173,-123315.08391198)
sd_ = c(104675.57010048, 553230.55450601, 623484.76430645, 201524.65961199)
dists = runif(N)          # here I'm generating random variates from a uniform
#   to select the relevant distribution

# this is where the actual data are generated, it's just some if->then
#   statements, followed by the normal distributions you were interested in
data = vector(length=N)
for(i in 1:N){
  if(dists[i]<probs[1]){
    data[i] = rnorm(1, mean=means_[1], sd=sd_[1])
  } else if(dists[i]<(probs[2]+probs[1])){
    data[i] = rnorm(1, mean=means_[2], sd=sd_[2])
  } else if(dists[i]<(probs[3] + probs[2]+probs[1])){
    data[i] = rnorm(1,mean=means_[3], sd=sd_[3])
  } else {
    data[i] = rnorm(1, mean=means_[4], sd=sd_[4])
  }
}

# here are a couple of ways of looking at the results
summary(data)


plot(density(data))
