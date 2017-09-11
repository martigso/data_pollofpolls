data {
  int polls;              // number of polls
  int T;                  // number of days
  
  //norge
  matrix[T, polls] Y_norge_ap;     // polls
  matrix[T, polls] sigma_norge_ap; // polls standard deviations
  real initial_prior_norge_ap;     // Election result 2013 norge Ap
  
  matrix[T, polls] Y_norge_h;     // polls
  matrix[T, polls] sigma_norge_h; // polls standard deviations
  real initial_prior_norge_h;     // Election result 2013 norge H

  matrix[T, polls] Y_norge_frp;       // polls
  matrix[T, polls] sigma_norge_frp; // polls standard deviations
  real initial_prior_norge_frp;     // Election result 2013 norge

  matrix[T, polls] Y_norge_sv;       // polls
  matrix[T, polls] sigma_norge_sv; // polls standard deviations
  real initial_prior_norge_sv;     // Election result 2013 norge

  matrix[T, polls] Y_norge_sp;       // polls
  matrix[T, polls] sigma_norge_sp; // polls standard deviations
  real initial_prior_norge_sp;     // Election result 2013 norge

  matrix[T, polls] Y_norge_krf;       // polls
  matrix[T, polls] sigma_norge_krf; // polls standard deviations
  real initial_prior_norge_krf;     // Election result 2013 norge

  matrix[T, polls] Y_norge_v;       // polls
  matrix[T, polls] sigma_norge_v; // polls standard deviations
  real initial_prior_norge_v;     // Election result 2013 norge

  matrix[T, polls] Y_norge_mdg;       // polls
  matrix[T, polls] sigma_norge_mdg; // polls standard deviations
  real initial_prior_norge_mdg;     // Election result 2013 norge
  
  matrix[T, polls] Y_norge_r;       // polls
  matrix[T, polls] sigma_norge_r; // polls standard deviations
  real initial_prior_norge_r;     // Election result 2013 norge
  
  matrix[T, polls] Y_norge_a;       // polls
  matrix[T, polls] sigma_norge_a; // polls standard deviations
  real initial_prior_norge_a;     // Election result 2013 norge
  
}
parameters {
  
  //norge
  vector<lower = 0>[T] mu_norge_ap;                      // Latent for norge Ap
  matrix[T, polls] shrunken_polls_norge_ap;   // Imputed polls norge Ap
  real<lower = 0> tau_norge_ap;               // the standard deviation of the random effects for norge ap
  
  vector<lower = 0>[T] mu_norge_h;                      // Latent for norge H
  matrix[T, polls] shrunken_polls_norge_h;   // Imputed polls norge H
  real<lower = 0> tau_norge_h;               // the standard deviation of the random effects for norge h
  
  vector<lower = 0>[T] mu_norge_frp;                      // Latent for norge frp
  matrix[T, polls] shrunken_polls_norge_frp;   // Imputed polls norge frp
  real<lower = 0> tau_norge_frp;               // the standard deviation of the random effects for norge frp
 
  vector<lower = 0>[T] mu_norge_sv;                      // Latent for norge
  matrix[T, polls] shrunken_polls_norge_sv;   // Imputed polls norge
  real<lower = 0> tau_norge_sv;               // the standard deviation of the random effects for norge
 
  vector<lower = 0>[T] mu_norge_sp;                      // Latent for norge
  matrix[T, polls] shrunken_polls_norge_sp;   // Imputed polls norge
  real<lower = 0> tau_norge_sp;               // the standard deviation of the random effects for norge
 
  vector<lower = 0>[T] mu_norge_krf;                      // Latent for norge
  matrix[T, polls] shrunken_polls_norge_krf;   // Imputed polls norge
  real<lower = 0> tau_norge_krf;               // the standard deviation of the random effects for norge
 
  vector<lower = 0>[T] mu_norge_v;                      // Latent for norge
  matrix[T, polls] shrunken_polls_norge_v;   // Imputed polls norge
  real<lower = 0> tau_norge_v;               // the standard deviation of the random effects for norge
 
  vector<lower = 0>[T] mu_norge_mdg;                      // Latent for norge
  matrix[T, polls] shrunken_polls_norge_mdg;   // Imputed polls norge
  real<lower = 0> tau_norge_mdg;               // the standard deviation of the random effects for norge
 
  vector<lower = 0>[T] mu_norge_r;                      // Latent for norge
  matrix[T, polls] shrunken_polls_norge_r;   // Imputed polls norge
  real<lower = 0> tau_norge_r;               // the standard deviation of the random effects for norge
 
  vector<lower = 0>[T] mu_norge_a;                      // Latent for norge
  matrix[T, polls] shrunken_polls_norge_a;   // Imputed polls norge
  real<lower = 0> tau_norge_a;             // the standard deviation of the random effects for norge
 
}
model {


   //norge
   
   //Priors for sum of mus
   
   
  // Priors norge AP
  // prior on initial difference norge AP
  mu_norge_ap[1] ~ normal(initial_prior_norge_ap, 1);
  tau_norge_ap ~ student_t(4, 0, 5);
  
  // state model norge AP
  for(t in 2:T) {
    mu_norge_ap[t] ~ normal(mu_norge_ap[t-1], 0.25);
  }
  

  // Priors norge H
  // prior on initial difference norge H
  mu_norge_h[1] ~ normal(initial_prior_norge_h, 1);
  tau_norge_h ~ student_t(4, 0, 5);
  
  // state model norge H
  for(t in 2:T) {
    mu_norge_h[t] ~ normal(mu_norge_h[t-1], 0.25);
  }
  
  mu_norge_frp[1] ~ normal(initial_prior_norge_frp, 1);
  tau_norge_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_norge_frp[t] ~ normal(mu_norge_frp[t-1], 0.25);
  }
  
  mu_norge_sv[1] ~ normal(initial_prior_norge_sv, 1);
  tau_norge_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_norge_sv[t] ~ normal(mu_norge_sv[t-1], 0.25);
  }
  
  mu_norge_sp[1] ~ normal(initial_prior_norge_sp, 1);
  tau_norge_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_norge_sp[t] ~ normal(mu_norge_sp[t-1], 0.25);
  }
  
  mu_norge_krf[1] ~ normal(initial_prior_norge_krf, 1);
  tau_norge_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_norge_krf[t] ~ normal(mu_norge_krf[t-1], 0.25);
  }
  
  mu_norge_v[1] ~ normal(initial_prior_norge_v, 1);
  tau_norge_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_norge_v[t] ~ normal(mu_norge_v[t-1], 0.25);
  }
  
  mu_norge_mdg[1] ~ normal(initial_prior_norge_mdg, 1);
  tau_norge_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_norge_mdg[t] ~ normal(mu_norge_mdg[t-1], 0.25);
  }
  
  mu_norge_r[1] ~ normal(initial_prior_norge_r, 1);
  tau_norge_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_norge_r[t] ~ normal(mu_norge_r[t-1], 0.25);
  }
  
  mu_norge_a[1] ~ normal(initial_prior_norge_a, 1);
  tau_norge_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_norge_a[t] ~ normal(mu_norge_a[t-1], 0.25);
  }

   //norge MEASUREMENT MODELS  
  // measurement model norge Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_ap[t, p] != -9) {
        Y_norge_ap[t,p]~ normal(shrunken_polls_norge_ap[t, p], sigma_norge_ap[t,p]);
        shrunken_polls_norge_ap[t, p] ~ normal(mu_norge_ap[t], tau_norge_ap);
	} else {
        shrunken_polls_norge_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model norge H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_h[t, p] != -9) {
        Y_norge_h[t,p]~ normal(shrunken_polls_norge_h[t, p], sigma_norge_h[t,p]);
        shrunken_polls_norge_h[t, p] ~ normal(mu_norge_h[t], tau_norge_h);
	} else {
        shrunken_polls_norge_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model norge _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_frp[t, p] != -9) {
        Y_norge_frp[t,p]~ normal(shrunken_polls_norge_frp[t, p], sigma_norge_frp[t,p]);
        shrunken_polls_norge_frp[t, p] ~ normal(mu_norge_frp[t], tau_norge_frp);
	} else {
        shrunken_polls_norge_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model norge _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_sv[t, p] != -9) {
        Y_norge_sv[t,p]~ normal(shrunken_polls_norge_sv[t, p], sigma_norge_sv[t,p]);
        shrunken_polls_norge_sv[t, p] ~ normal(mu_norge_sv[t], tau_norge_sv);
	} else {
        shrunken_polls_norge_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model norge _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_sp[t, p] != -9) {
        Y_norge_sp[t,p]~ normal(shrunken_polls_norge_sp[t, p], sigma_norge_sp[t,p]);
        shrunken_polls_norge_sp[t, p] ~ normal(mu_norge_sp[t], tau_norge_sp);
	} else {
        shrunken_polls_norge_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model norge _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_krf[t, p] != -9) {
        Y_norge_krf[t,p]~ normal(shrunken_polls_norge_krf[t, p], sigma_norge_krf[t,p]);
        shrunken_polls_norge_krf[t, p] ~ normal(mu_norge_krf[t], tau_norge_krf);
	} else {
        shrunken_polls_norge_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model norge _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_v[t, p] != -9) {
        Y_norge_v[t,p]~ normal(shrunken_polls_norge_v[t, p], sigma_norge_v[t,p]);
        shrunken_polls_norge_v[t, p] ~ normal(mu_norge_v[t], tau_norge_v);
	} else {
        shrunken_polls_norge_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model norge _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_mdg[t, p] != -9) {
        Y_norge_mdg[t,p]~ normal(shrunken_polls_norge_mdg[t, p], sigma_norge_mdg[t,p]);
        shrunken_polls_norge_mdg[t, p] ~ normal(mu_norge_mdg[t], tau_norge_mdg);
	} else {
        shrunken_polls_norge_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model norge _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_r[t, p] != -9) {
        Y_norge_r[t,p]~ normal(shrunken_polls_norge_r[t, p], sigma_norge_r[t,p]);
        shrunken_polls_norge_r[t, p] ~ normal(mu_norge_r[t], tau_norge_r);
	} else {
        shrunken_polls_norge_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model norge _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_norge_a[t, p] != -9) {
        Y_norge_a[t,p]~ normal(shrunken_polls_norge_a[t, p], sigma_norge_a[t,p]);
        shrunken_polls_norge_a[t, p] ~ normal(mu_norge_a[t], tau_norge_a);
	} else {
        shrunken_polls_norge_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
 }