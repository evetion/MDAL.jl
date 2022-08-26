struct DataSetGroup
    name::AbstractString
    p::Ptr{Nothing}
    l::Int
    meta::Dict{AbstractString,AbstractString}
end
Base.length(dsg::DataSetGroup) = MDAL_G_datasetCount(dsg.p)


function DataSetGroup(p::Ptr{Nothing}, i::Int)
    @info "Getting group $i"
    group = MDAL_M_datasetGroup(p, i)
    name = unsafe_string(MDAL_G_name(group))
    l = MDAL_G_datasetCount(group)
    c = MDAL_G_metadataCount(group)
    @info "$c metadata in datasetgroup"
    m = Dict(
        unsafe_string(MDAL_G_metadataKey(group, i)) =>
            unsafe_string(MDAL_G_metadataValue(group, i)) for i = 0:c-1
    )
    DataSetGroup(name, group, l, m)
end

DataSetGroup(m::MDALMesh, i::Int) = DataSetGroup(m.mdalm, i)
function DataSetGroups(m::MDALMesh)
    c = MDAL_M_datasetGroupCount(m.mdalm)
    @info "$c groups in mesh"
    (DataSetGroup(m, i) for i = 1:c-1)
end

struct DataSet
    p::Ptr{Nothing}
end
Base.length(ds::DataSet) = MDAL_D_valueCount(ds.p)
Base.isvalid(ds::DataSet) = MDAL_D_isValid(ds.p)
Base.time(ds::DataSet) = MDAL_D_time(ds.p)

DataSet(m::DataSetGroup, i::Int) = DataSet(m.p, i)
function DataSet(p::Ptr{Nothing}, i::Int)
    ds = MDAL_G_dataset(p, i)
    DataSet(ds)
end

function DataSets(p::DataSetGroup)
    c = MDAL_G_datasetCount(p.p)
    @info "$c datasets in group"
    (DataSet(p, i) for i = 1:c-1)
end
