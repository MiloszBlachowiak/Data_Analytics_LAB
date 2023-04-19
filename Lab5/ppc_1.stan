generated quantities {
    real<lower=0.0> alpha = normal_rng(2.5, 1);
    real<lower=0.0> theta = normal_rng(0.1, 0.02);
    real<lower=0.0> n_i = normal_rng(5, 1); # miles flown during a year [100 bln]

    real lambda = exp(alpha + theta * n_i);

    int y_i = poisson_rng(lambda); # number of accidents
}