benjaminihochberg <- function (pvalues,alpha = 0.05) { #by default alpha is 5%
  
  n <- length(pvalues);
  sorted_pvalues <- sort(pvalues_test);
  threshold <- sorted_pvalues[max(which(sorted_pvalues < seq(0,alpha,length.out=n)))];
  
  # TRUE = reject; FALSE = accept;
  
  return(pvalues < threshold);
}

# give the function your pvalues
pvalues_test <- runif(40)*0.1; #random to test

rejected <- benjaminihochberg(pvalues_test, alpha = 0.09);

cbind(pvalues = pvalues_test, reject = rejected)
