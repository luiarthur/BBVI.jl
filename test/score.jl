@testset "score" begin
  Random.seed!(0)

  @testset "Bernoulli" begin
    test_dist(Bernoulli,
              ps=[[.3], [.4], [.5], [.6], [.7]],
              zs=[1, 0, 1, 0, 1])
  end

  @testset "Normal" begin
    ntest = 5
    test_dist(Normal,
              ps=[[randn(), rand(Uniform(.5, 1))] for _ in 1:ntest],
              zs=randn(ntest))
  end

  @testset "InverseGamma" begin
    ntest = 5
    test_dist(InverseGamma,
              ps=[rand(Uniform(.5, 3), 2) for _ in 1:ntest],
              zs=rand(Uniform(.5, 3), ntest))
  end

  @testset "Gamma" begin
    ntest = 5
    test_dist(Gamma,
              ps=[rand(Uniform(.5, 3), 2) for _ in 1:ntest],
              zs=rand(Uniform(.5, 3), ntest))
  end

  @testset "Beta" begin
    ntest = 5
    test_dist(Beta,
              ps=[rand(Uniform(.1, 3), 2) for _ in 1:ntest],
              zs=rand(ntest))
  end
end
