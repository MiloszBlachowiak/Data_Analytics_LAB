data {
    int<lower=0> N;
    vector[N] heights;
    vector[N] weight;
}

parameters {
    real<lower=0> sigma;
    real<lower=0> alpha;
    real<lower=0> beta;
    real<lower=0> gamma;
}

transformed parameters {
   vector[N] mu = alpha + beta * weight + gamma * square(weight);
}

model {
    alpha ~ normal(155, 5);
    sigma ~ normal(15, 1);
    beta ~ lognormal(0, 1);
    gamma ~ lognormal(0, 1);

    heights ~ normal(mu, sigma);

}

generated quantities {
   real height_mu[N];

   for (n in 1:N) {
     height_mu[n] = normal_rng(mu[n], sigma);
   }
}