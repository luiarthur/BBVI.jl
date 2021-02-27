module BBVI

using Distributions
using StatsFuns
using SpecialFunctions

export score

include("opt.jl")
include("BBVIEngine.jl")
include("score.jl")

end # module
