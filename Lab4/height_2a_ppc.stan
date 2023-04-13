data {
    int<lower=0> N;
    real weight[N];
}

generated quantities {
   real<lower=0.0> alpha = normal_rng(155, 5);
   real<lower=0.0> sigma = normal_rng(15, 1);
   real beta = std_normal_rng();

   real height[N];

   for (n in 1:N) {
     height[n] = normal_rng(alpha + beta * weight[n], sigma);
   }
}