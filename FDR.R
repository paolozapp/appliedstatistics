benjaminihochberg <- function (pvalues,alpha_level = 0.05) { #by default alpha is 5%
  
  n <- length(pvalues);
  sorted_pvalues <- sort(pvalues);
  indices <- (sorted_pvalues < seq(alpha_level/n,alpha_level,length.out=n));
  threshold <- 0;
  if (sum(indices)>0) {
  threshold <- sorted_pvalues[max(which(indices))];
  }
  
  
  # TRUE = reject; FALSE = accept;
  
  return(list(pvalues = pvalues, reject = pvalues <= threshold));
}

# give the function your pvalues
pvalues_test <- runif(10)*0.15; #random to test

fdr <- benjaminihochberg(pvalues_test, alpha_level= 0.1);

cbind(pvalues = fdr$pvalues, reject = fdr$reject)

