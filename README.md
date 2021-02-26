# BBVI.jl
[![Build Status][ci-img]](https://github.com/luiarthur/BBVI.jl/actions)
[![Codecov][codecov-img]](https://codecov.io/gh/luiarthur/BBVI.jl)


## Description
Black box variational inference in Julia.

## Workflow
- The `main` branch should accept only working code.
- The `dev` branch should contain all developmental work.
    - If tests pass, they can be added to `main`, at which point, the package
      version in `Project.tomal` and git tag 
      should be updated accordingly (using semver).
    - Commits in dev should be squashed before pushing to `main`.


[ci-img]: https://github.com/luiarthur/MCMC.jl/workflows/CI/badge.svg
[codecov-img]: https://img.shields.io/codecov/c/github/luiarthur/MCMC.jl/master.svg?label=codecov
