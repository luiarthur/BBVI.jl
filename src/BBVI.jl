module BBVI

using Distributions
using StatsFuns

export gradlogq

include("core.jl")
include("gradlogq.jl")

end # module
