using BBVI
using BBVI.Distributions
using BBVI.StatsFuns
using BangBang
using Test
using Random

include("util.jl")

@testset "BBVI" begin
  include("score.jl")
end
