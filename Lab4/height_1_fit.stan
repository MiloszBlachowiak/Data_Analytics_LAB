data {
    int<lower=0> N;
    real<lower=0> heights[N];
}

parameters {
    real<lower=0> mu;
    real<lower=0> sigma;
}

model {
    mu ~ normal(155, 5);
    sigma ~ normal(15, 1);
    heights ~ normal(mu, sigma);
}

generated quantities {
   real<lower=0> height = normal_rng(mu, sigma);
}