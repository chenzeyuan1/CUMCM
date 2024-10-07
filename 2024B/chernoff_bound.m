function n = chernoff_bound(p0, p1, alpha, beta)
    D = @(p1, p0) p1 * log(p1 / p0) + (1 - p1) * log((1 - p1) / (1 - p0));
    
    D_kl = D(p1, p0);

    lnA = log((1 - beta) / alpha);
    lnB = log(beta / (1 - alpha));

    n = ceil((lnA - lnB) / (2.5 * D_kl));
end
