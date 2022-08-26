using Documenter, MDAL

makedocs(;
    modules = [MDAL],
    format = Documenter.HTML(),
    pages = ["Home" => "index.md"],
    repo = "https://github.com/evetion/MDAL.jl/blob/{commit}{path}#L{line}",
    sitename = "MDAL.jl",
    authors = "Maarten Pronk, Deltares",
    assets = String[],
)

deploydocs(; repo = "github.com/evetion/MDAL.jl")
