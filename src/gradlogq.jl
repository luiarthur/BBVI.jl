"""
Return gradient of logpdf of bernoulli w.r.t. variational parameters.
`z` is a Bernoulli realization.
"""
function gradlogq(q::Bernoulli, z::Real)
  return (z / q.p - (1 - z) / (1 - q.p), )
end


function gradlogq(q::Normal, z::Real)
  sigma = std(q)
  sigmasq = var(q)
  mu = mean(q)
  gsigma = -1/sigma + (z - mu)^2 / sigma^3
  gmu = (z - mu) / sigmasq
  return (gmu, gsigma)
end

# TODO: Implement for
# - Logistic
# - TDist
# - Gamma
# - LogNormal
# - InverseGamma
# - Binomial
# - Poisson
# - NegativeBinomial
# - Beta
# - Uniform
# - LogitNormal
