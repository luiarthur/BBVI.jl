"""
Compute finite difference gradient.
"""
finite_diff_grad(f, x::Real; delta=1e-4) = (f(x) - f(x - delta)) / delta


"""
Test whether score function is consistent with finite difference.

Arguments
=========

d: a Distribution.
ps: a vector of parameters (Vector{<:Tuple})
zs: a vector of scalars z, which are draws from d.
"""
function test_dist(d; ps, zs, seed=0, atol=1e-2, delta=1e-5)
  Random.seed!(0)
  for (p, z) in zip(ps, zs)
    q = d(p...)
    g = score(q, z)
    for j in length(p)
      qjlpdf = x -> logpdf(d(setindex!!(p, x, j)...), z)
      g_approx = finite_diff_grad(qjlpdf, p[j], delta=delta)
      @test isapprox(g[j], g_approx, atol=atol)
    end
  end
  return nothing
end
