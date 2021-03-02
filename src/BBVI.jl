module BBVI

using Distributions
using StatsFuns
using SpecialFunctions
using Random

export score

include("opt.jl")
include("variational-distributions.jl")
include("elbo.jl")
include("BBVIEngine.jl")
include("score.jl")

end # module
