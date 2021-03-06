module MDAL

import Libdl

# Load in `deps.jl`, complaining if it does not exist
const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if !isfile(depsjl_path)
    error("MDAL was not build properly. Please run Pkg.build(\"MDAL\").")
end
include(depsjl_path)
# Module initialization function
function __init__()
    check_deps()
end

using CEnum

include(joinpath(@__DIR__, "..", "gen", "ctypes.jl"))
export Ctm, Ctime_t, Cclock_t

include(joinpath(@__DIR__, "..", "gen", "libmdal_common.jl"))
include(joinpath(@__DIR__, "..", "gen", "libmdal_api.jl"))

# export everything
foreach(names(@__MODULE__, all=true)) do s
   if startswith(string(s), "SOME_PREFIX")
       @eval export $s
   end
end

include("utils.jl")
include("geometry.jl")
include("data.jl")


export MDALMesh
export load

end # module
