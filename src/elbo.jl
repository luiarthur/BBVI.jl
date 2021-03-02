# NOTE: don't know if this is correct.
const SurrogatePosterior = NamedTuple{S, NTuple{N, <:VarDist}} where {S, N}

function computeELBO(loglike::Function, logprior::Function, surrogateposterior::NamedTuple) end
