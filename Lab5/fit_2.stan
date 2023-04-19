data {
    int<lower=0> N;
    real<lower=0.0> n[N]; # miles flown during a year [100 bln]
    int y[N]; # number of accidents
}

parameters {
    real alpha[N]; # different alpha for each year
    real theta;
}

transformed parameters {
    real lambda[N];

    for (i in 1:N){
        lambda[i] = exp(alpha[i] + theta * n[i]);
    }
}

model {
    alpha ~ normal(2.5, 1);
    theta ~ normal(0.1, 0.02);

    for (i in 1:N) {
        y[i] ~ poisson(lambda[i]);
    }
}

generated quantities {
   real y_p[N];

   for (i in 1:N) {
     y_p[i] = poisson_rng(lambda[i]);
   }
}