generated quantities {
   real<lower=0.0> mu = normal_rng(155, 5);
   real<lower=0.0> sigma = normal_rng(15, 1);
   real<lower=0.0> height = normal_rng(mu, sigma);
}