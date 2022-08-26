[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://evetion.github.io/MDAL.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://evetion.github.io/MDAL.jl/dev)
[![CI](https://github.com/evetion/MDAL.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/evetion/MDAL.jl/actions/workflows/CI.yml)
[![Codecov](https://codecov.io/gh/evetion/MDAL.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/evetion/MDAL.jl)

# [WIP] MDAL.jl
Wraps the [MDAL](https://github.com/lutraconsulting/MDAL) (Mesh Data Abstraction Library) in Julia and enables conversion to the [GeometryTypes.jl](https://github.com/JuliaGeometry/GeometryTypes.jl) library.

*This is a very early work in progress*

## Install
```
]add https://github.com/evetion/MDAL.jl
```

## Abstraction
MDAL defines a Mesh as vertices and faces, including Dataset(s), which have a name and define data on either vertices or faces.


## Examples
Read in a mesh and retrieve all vertices.
```julia
using MDAL

fn = "test/data/test.nc"
mesh = MDAL.load(fn)
collect(coords(mesh))
```
