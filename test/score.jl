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

  @testset "Dirichlet" begin
    ntest = 5
    K = 6
    test_dist(Dirichlet,
              ps=[[rand(Uniform(.5, 3), K)] for _ in 1:ntest],
              zs=[rand(Dirichlet(K, 1)) for _ in 1:ntest])
  end

  @testset "score with vector of univariate distributions" begin
    K = 3
    qs = [Normal(randn(), rand()) for _ in 1:K]
    zs = randn(K)
    scorevec = score(qs, zs)
    scoreuni = [score(q, z) for (q, z) in zip(qs, zs)]
    @test all([all(abs.(v .- u) .< 1e-5) for (v, u) in zip(scorevec, scoreuni)])
  end

  @testset "score with matrix of univariate distributions" begin
    J, K = 3, 4
    qs = [Gamma(rand(), rand()) for _ in 1:J, _ in 1:K]
    zs = rand(J, K) * 3
    scorevec = score(qs, zs)
    scoreuni = [score(q, z) for (q, z) in zip(qs, zs)]
    @test all([all(abs.(v .- u) .< 1e-5) for (v, u) in zip(scorevec, scoreuni)])
  end
end
