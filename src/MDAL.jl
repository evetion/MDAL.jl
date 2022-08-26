module MDAL

using MDAL_jll
const mdal = :libmdal


include("mdal_common.jl")
include("mdal_api.jl")

include("utils.jl")
include("geometry.jl")
include("data.jl")

export Ctm, Ctime_t, Cclock_t
export MDALMesh
export load

end # module
