module BBVI

using Distributions
using StatsFuns
using SpecialFunctions

export score

include("core.jl")
include("score.jl")

end # module
