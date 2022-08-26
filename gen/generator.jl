using Clang.Generators
using MDAL_jll
using JuliaFormatter

cd(@__DIR__)

include_dir = normpath(MDAL_jll.artifact_dir, "include")

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$include_dir")

headers = detect_headers(include_dir, args)

ctx = create_context(headers, args, options)

build!(ctx)
format(joinpath(@__DIR__, ".."))
