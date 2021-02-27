finite_diff_grad(f, x::Real; delta=1e-4) = (f(x) - f(x - delta)) / delta

@testset "score" begin
  @testset "Bernoulli" begin
    ps = [.3, .6]
    zs = [0, 1]
    for p in ps, z in zs
      g = score(Bernoulli(p), z)
      g_approx = finite_diff_grad(_p -> binomlogpdf(1, _p, z), p)
      @test g[1] ≈ g_approx atol=1e-3
    end
  end

  @testset "Normal" begin
    Random.seed!(0)
    mus = randn(2)
    sigmas = rand(2) * 3
    zs = randn(2)
    for mu in mus, sigma in sigmas, z in zs
      g = score(Normal(mu, sigma), z)
      gmu_approx = finite_diff_grad(x -> normlogpdf(x, sigma, z), mu)
      gsigma_approx = finite_diff_grad(x -> normlogpdf(mu, x, z), sigma)
      @test g[1] ≈ gmu_approx atol=1e-3
      @test g[2] ≈ gsigma_approx atol=1e-3
    end
  end
end
