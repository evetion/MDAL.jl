
mutable struct MDALMesh
    mdalm::Ptr{Nothing}
    datasets::Int
end

function MDALMesh(p::Ptr{Nothing})
    p == C_NULL && error("Null pointer")
    n = MDAL_M_datasetGroupCount(p)
    m = MDALMesh(p, n)
    finalizer(MDAL_CloseMesh, m)
    m
end

MDAL_CloseMesh(m::MDALMesh) = MDAL_CloseMesh(m.mdalm)
load(fn::AbstractString) = MDALMesh(MDAL_LoadMesh(fn))

struct MDALNodeIterator
    p::Ptr{Nothing}
    l::Int
end
Base.length(i::MDALNodeIterator) = i.l

function Base.iterate(i::MDALNodeIterator, _state = nothing; buffer = 1)
    coords = repeat([0.0, 0.0, 0.0], buffer)
    count = MDAL_VI_next(i.p, buffer, coords)
    if count == 0
        MDAL_VI_close(i.p)
        return nothing
    else
        return (coords[1:(count*buffer*3)], nothing)
    end
end

function vertices(m::MDALMesh)
    MDALNodeIterator(MDAL_M_vertexIterator(m.mdalm), MDAL_M_vertexCount(m.mdalm))
end

struct MDALFaceIterator
    p::Ptr{Nothing}
    l::Int
end
Base.length(i::MDALFaceIterator) = i.l

function Base.iterate(i::MDALFaceIterator, _state = nothing; buffer = 1)
    coords = repeat([0.0, 0.0, 0.0], buffer)
    count = MDAL_VI_next(i.p, buffer, coords)
    if count == 0
        MDAL_VI_close(i.p)
        return nothing
    else
        return (coords[1:(count*buffer*3)], nothing)
    end
end

function faces(m::MDALMesh)
    MDALNodeIterator(MDAL_M_faceIterator(m.mdalm), MDAL_M_faceCount(m.mdalm))
end
