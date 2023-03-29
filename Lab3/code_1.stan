generated quantities {
    int<lower=0> N = 50; // Number of trials
    real<lower=0, upper=1> p = beta_rng(20, 80); // a priori probability of allergic reaction
                                                 // beta distribution where expected value equals 0.2 (alpha=20, beta=80)
    int y = binomial_rng(N, p);
}
