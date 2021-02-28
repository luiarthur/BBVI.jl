abstract type VarDist end
abstract type UnivariateVD <: VarDist end
abstract type MultivariateVD <: VarDist end

Base.rand(d::UnivariateVD) = rand(Random.GLOBAL_RNG, d)
Base.rand(d::UnivariateVD, dims::Integer...) = rand(Random.GLOBAL_RNG, d, dims...)


mutable struct VDNormal <: UnivariateVD
  mu::Float64
  logsigma::Float64
end
sigma(d::VDNormal) = exp(d.logsigma)
VDNormal() = VDNormal(0, 0)
Base.rand(rng::AbstractRNG, d::VDNormal) = randn(rng) * sigma(d) + d.mu
Base.rand(rng::AbstractRNG, d::VDNormal, dims::Integer...) = randn(rng, dims...) * sigma(d) .+ d.mu
Distributions.logpdf(d::VDNormal, x::Real) = normlogpdf(d.mu, sigma(d), x)


mutable struct VDBernoulli <: UnivariateVD
  logitp::Float64
end
VDBernoulli() = VDBernoulli(0)
p(d::VDBernoulli) = logistic(d.logitp)
Base.rand(rng::AbstractRNG, d::VDBernoulli) = p(d) > rand(rng) 
Base.rand(rng::AbstractRNG, d::VDBernoulli, dims::Integer...) = p(d) .> rand(rng, dims...)
Distributions.logpdf(d::VDBernoulli, x::Real) = binomlogpdf(1, p(d), x)



# TODO:
# 1. Implement the distributions in score.jl as subtype of VarDist.
#     - VarDist has unconstrained parameters. See VDNormal
# 2. Re-implement the `score` functions and corresponding tests.
# 3. Write tests for these distributions.
