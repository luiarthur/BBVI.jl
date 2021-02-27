"""
Return gradient of logpdf (score) of bernoulli w.r.t. parameters (p,).
`z` is a Bernoulli realization.
"""
function score(q::Bernoulli, z::Real)
  return (z / q.p - (1 - z) / (1 - q.p), )
end


"""
Return gradient of logpdf (score) of normal w.r.t. parameters (mu, sigma).
`z` is a normal realization.
"""
function score(q::Normal, z::Real)
  sigma = std(q)
  sigmasq = var(q)
  mu = mean(q)
  gsigma = -1/sigma + (z - mu)^2 / sigma^3
  gmu = (z - mu) / sigmasq
  return (gmu, gsigma)
end


"""
Return gradient of logpdf (score) of gamma w.r.t. parameters (shape, scale).
`z` is a gamma realization.
"""
function score(q::Gamma, z::Real)
  shape, scale = params(q)
  gshape = log(z) - digamma(shape) - log(scale)
  gscale = z / scale^2 - shape / scale
  return (gshape, gscale)
end


# TODO: Implement for
# - Beta
# - InverseGamma
# - Dirichlet
# - LogNormal
# - Logistic
# - NegativeBinomial
# - Binomial
# - TDist
# - LogitNormal
