module BBVI

using Distributions
using StatsFuns
using SpecialFunctions
using Random

export score

include("opt.jl")
include("BBVIEngine.jl")
include("score.jl")

end # module
