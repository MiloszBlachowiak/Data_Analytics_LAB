data {
    int<lower=0> N;
    real heights[N];
    real weight[N];
}

parameters {
    real<lower=0> sigma;
    real<lower=0> alpha;
    real<lower=0> beta;
}

transformed parameters {
   real mu[N];

    for (n in 1:N){
        mu[n] = alpha + beta * weight[n];
    }
}

model {
    alpha ~ normal(155, 5);
    sigma ~ normal(15, 1);
    beta ~ lognormal(0, 1);

    for (n in 1:N) {
        heights[n] ~ normal(mu[n], sigma);
    }
}

generated quantities {
   real height_mu[N];

   for (n in 1:N) {
     height_mu[n] = normal_rng(mu[n], sigma);
   }
}