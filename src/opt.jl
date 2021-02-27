# Adapted from Flux.jl

mutable struct Adam
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
  eps::Float64
end

Adam(; eta=0.01, beta=(0.9, 0.999), state=IdDict(), eps=1e-8) = Adam(eta, beta, state, eps)

# NOTE: x is a vector which acts as a key.
function apply!(o::Adam, x, Δ)
  m, v, beta = get!(o.state, x) do
    (zero(x), zero(x), Float64[o.beta[1], o.beta[2]])
  end

  @. m = o.beta[1] * m + (1 - o.beta[1]) * Δ
  @. v = o.beta[2] * v + (1 - o.beta[2]) * Δ^2
  @. Δ =  o.eta * m / (1 - beta[1]) / (sqrt(v / (1 - beta[2])) + o.eps)
  beta .*= o.beta

  return Δ
end
