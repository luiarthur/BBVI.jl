@testset "score" begin
  @testset "Bernoulli" begin
    test_dist(Bernoulli,
              ps=[[.3], [.4], [.5], [.6], [.7]],
              zs=[1, 0, 1, 0, 1])
  end

  @testset "Normal" begin
    ntest = 5
    test_dist(Normal,
              ps=[[randn(), rand()] for _ in 1:ntest],
              zs=randn(ntest))
  end

  @testset "Gamma" begin
    ntest = 5
    test_dist(Gamma,
              ps=[rand(Uniform(.5, 3), 2) for _ in 1:ntest],
              zs=rand(Uniform(.5, 3), ntest))
  end
end
