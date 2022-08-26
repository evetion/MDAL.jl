# no prototype is found for this function at mdal.h:107:25, please use with caution
function MDAL_Version()
    @ccall mdal.MDAL_Version()::Cstring
end

# no prototype is found for this function at mdal.h:112:25, please use with caution
function MDAL_LastStatus()
    @ccall mdal.MDAL_LastStatus()::MDAL_Status
end

# no prototype is found for this function at mdal.h:118:18, please use with caution
function MDAL_ResetStatus()
    @ccall mdal.MDAL_ResetStatus()::Cvoid
end

function MDAL_SetStatus(Level, status, message)
    @ccall mdal.MDAL_SetStatus(
        Level::MDAL_LogLevel,
        status::MDAL_Status,
        message::Cstring,
    )::Cvoid
end

function MDAL_SetLoggerCallback(callback)
    @ccall mdal.MDAL_SetLoggerCallback(callback::MDAL_LoggerCallback)::Cvoid
end

function MDAL_SetLogVerbosity(verbosity)
    @ccall mdal.MDAL_SetLogVerbosity(verbosity::MDAL_LogLevel)::Cvoid
end

# no prototype is found for this function at mdal.h:153:17, please use with caution
function MDAL_driverCount()
    @ccall mdal.MDAL_driverCount()::Cint
end

function MDAL_driverFromIndex(index)
    @ccall mdal.MDAL_driverFromIndex(index::Cint)::MDAL_DriverH
end

function MDAL_driverFromName(name)
    @ccall mdal.MDAL_driverFromName(name::Cstring)::MDAL_DriverH
end

function MDAL_DR_meshLoadCapability(driver)
    @ccall mdal.MDAL_DR_meshLoadCapability(driver::MDAL_DriverH)::Cint
end

function MDAL_DR_writeDatasetsCapability(driver, location)
    @ccall mdal.MDAL_DR_writeDatasetsCapability(
        driver::MDAL_DriverH,
        location::MDAL_DataLocation,
    )::Cint
end

function MDAL_DR_writeDatasetsSuffix(driver)
    @ccall mdal.MDAL_DR_writeDatasetsSuffix(driver::MDAL_DriverH)::Cstring
end

function MDAL_DR_saveMeshSuffix(driver)
    @ccall mdal.MDAL_DR_saveMeshSuffix(driver::MDAL_DriverH)::Cstring
end

function MDAL_DR_saveMeshCapability(driver)
    @ccall mdal.MDAL_DR_saveMeshCapability(driver::MDAL_DriverH)::Cint
end

function MDAL_DR_name(driver)
    @ccall mdal.MDAL_DR_name(driver::MDAL_DriverH)::Cstring
end

function MDAL_DR_longName(driver)
    @ccall mdal.MDAL_DR_longName(driver::MDAL_DriverH)::Cstring
end

function MDAL_DR_filters(driver)
    @ccall mdal.MDAL_DR_filters(driver::MDAL_DriverH)::Cstring
end

function MDAL_DR_faceVerticesMaximumCount(driver)
    @ccall mdal.MDAL_DR_faceVerticesMaximumCount(driver::MDAL_DriverH)::Cint
end

function MDAL_LoadMesh(uri)
    @ccall mdal.MDAL_LoadMesh(uri::Cstring)::MDAL_MeshH
end

function MDAL_MeshNames(uri)
    @ccall mdal.MDAL_MeshNames(uri::Cstring)::Cstring
end

function MDAL_CloseMesh(mesh)
    @ccall mdal.MDAL_CloseMesh(mesh::MDAL_MeshH)::Cvoid
end

function MDAL_CreateMesh(driver)
    @ccall mdal.MDAL_CreateMesh(driver::MDAL_DriverH)::MDAL_MeshH
end

function MDAL_SaveMesh(mesh, meshFile, driver)
    @ccall mdal.MDAL_SaveMesh(mesh::MDAL_MeshH, meshFile::Cstring, driver::Cstring)::Cvoid
end

function MDAL_SaveMeshWithUri(mesh, uri)
    @ccall mdal.MDAL_SaveMeshWithUri(mesh::MDAL_MeshH, uri::Cstring)::Cvoid
end

function MDAL_M_projection(mesh)
    @ccall mdal.MDAL_M_projection(mesh::MDAL_MeshH)::Cstring
end

function MDAL_M_setProjection(mesh, projection)
    @ccall mdal.MDAL_M_setProjection(mesh::MDAL_MeshH, projection::Cstring)::Cvoid
end

function MDAL_M_extent(mesh, minX, maxX, minY, maxY)
    @ccall mdal.MDAL_M_extent(
        mesh::MDAL_MeshH,
        minX::Ptr{Cdouble},
        maxX::Ptr{Cdouble},
        minY::Ptr{Cdouble},
        maxY::Ptr{Cdouble},
    )::Cvoid
end

function MDAL_M_addVertices(mesh, vertexCount, coordinates)
    @ccall mdal.MDAL_M_addVertices(
        mesh::MDAL_MeshH,
        vertexCount::Cint,
        coordinates::Ptr{Cdouble},
    )::Cvoid
end

function MDAL_M_addFaces(mesh, faceCount, faceSizes, vertexIndices)
    @ccall mdal.MDAL_M_addFaces(
        mesh::MDAL_MeshH,
        faceCount::Cint,
        faceSizes::Ptr{Cint},
        vertexIndices::Ptr{Cint},
    )::Cvoid
end

function MDAL_M_addEdges(mesh, edgesCount, startVertexIndices, endVertexIndices)
    @ccall mdal.MDAL_M_addEdges(
        mesh::MDAL_MeshH,
        edgesCount::Cint,
        startVertexIndices::Ptr{Cint},
        endVertexIndices::Ptr{Cint},
    )::Cvoid
end

function MDAL_M_vertexCount(mesh)
    @ccall mdal.MDAL_M_vertexCount(mesh::MDAL_MeshH)::Cint
end

function MDAL_M_edgeCount(mesh)
    @ccall mdal.MDAL_M_edgeCount(mesh::MDAL_MeshH)::Cint
end

function MDAL_M_faceCount(mesh)
    @ccall mdal.MDAL_M_faceCount(mesh::MDAL_MeshH)::Cint
end

function MDAL_M_faceVerticesMaximumCount(mesh)
    @ccall mdal.MDAL_M_faceVerticesMaximumCount(mesh::MDAL_MeshH)::Cint
end

function MDAL_M_LoadDatasets(mesh, datasetFile)
    @ccall mdal.MDAL_M_LoadDatasets(mesh::MDAL_MeshH, datasetFile::Cstring)::Cvoid
end

function MDAL_M_metadataCount(mesh)
    @ccall mdal.MDAL_M_metadataCount(mesh::MDAL_MeshH)::Cint
end

function MDAL_M_metadataKey(mesh, index)
    @ccall mdal.MDAL_M_metadataKey(mesh::MDAL_MeshH, index::Cint)::Cstring
end

function MDAL_M_metadataValue(mesh, index)
    @ccall mdal.MDAL_M_metadataValue(mesh::MDAL_MeshH, index::Cint)::Cstring
end

function MDAL_M_setMetadata(mesh, key, val)
    @ccall mdal.MDAL_M_setMetadata(mesh::MDAL_MeshH, key::Cstring, val::Cstring)::Cvoid
end

function MDAL_M_datasetGroupCount(mesh)
    @ccall mdal.MDAL_M_datasetGroupCount(mesh::MDAL_MeshH)::Cint
end

function MDAL_M_datasetGroup(mesh, index)
    @ccall mdal.MDAL_M_datasetGroup(mesh::MDAL_MeshH, index::Cint)::MDAL_DatasetGroupH
end

function MDAL_M_addDatasetGroup(
    mesh,
    name,
    dataLocation,
    hasScalarData,
    driver,
    datasetGroupFile,
)
    @ccall mdal.MDAL_M_addDatasetGroup(
        mesh::MDAL_MeshH,
        name::Cstring,
        dataLocation::MDAL_DataLocation,
        hasScalarData::Cint,
        driver::MDAL_DriverH,
        datasetGroupFile::Cstring,
    )::MDAL_DatasetGroupH
end

function MDAL_M_driverName(mesh)
    @ccall mdal.MDAL_M_driverName(mesh::MDAL_MeshH)::Cstring
end

function MDAL_M_vertexIterator(mesh)
    @ccall mdal.MDAL_M_vertexIterator(mesh::MDAL_MeshH)::MDAL_MeshVertexIteratorH
end

function MDAL_VI_next(iterator, verticesCount, coordinates)
    @ccall mdal.MDAL_VI_next(
        iterator::MDAL_MeshVertexIteratorH,
        verticesCount::Cint,
        coordinates::Ptr{Cdouble},
    )::Cint
end

function MDAL_VI_close(iterator)
    @ccall mdal.MDAL_VI_close(iterator::MDAL_MeshVertexIteratorH)::Cvoid
end

function MDAL_M_edgeIterator(mesh)
    @ccall mdal.MDAL_M_edgeIterator(mesh::MDAL_MeshH)::MDAL_MeshEdgeIteratorH
end

function MDAL_EI_next(iterator, edgesCount, startVertexIndices, endVertexIndices)
    @ccall mdal.MDAL_EI_next(
        iterator::MDAL_MeshEdgeIteratorH,
        edgesCount::Cint,
        startVertexIndices::Ptr{Cint},
        endVertexIndices::Ptr{Cint},
    )::Cint
end

function MDAL_EI_close(iterator)
    @ccall mdal.MDAL_EI_close(iterator::MDAL_MeshEdgeIteratorH)::Cvoid
end

function MDAL_M_faceIterator(mesh)
    @ccall mdal.MDAL_M_faceIterator(mesh::MDAL_MeshH)::MDAL_MeshFaceIteratorH
end

function MDAL_FI_next(
    iterator,
    faceOffsetsBufferLen,
    faceOffsetsBuffer,
    vertexIndicesBufferLen,
    vertexIndicesBuffer,
)
    @ccall mdal.MDAL_FI_next(
        iterator::MDAL_MeshFaceIteratorH,
        faceOffsetsBufferLen::Cint,
        faceOffsetsBuffer::Ptr{Cint},
        vertexIndicesBufferLen::Cint,
        vertexIndicesBuffer::Ptr{Cint},
    )::Cint
end

function MDAL_FI_close(iterator)
    @ccall mdal.MDAL_FI_close(iterator::MDAL_MeshFaceIteratorH)::Cvoid
end

function MDAL_G_mesh(group)
    @ccall mdal.MDAL_G_mesh(group::MDAL_DatasetGroupH)::MDAL_MeshH
end

function MDAL_G_datasetCount(group)
    @ccall mdal.MDAL_G_datasetCount(group::MDAL_DatasetGroupH)::Cint
end

function MDAL_G_dataset(group, index)
    @ccall mdal.MDAL_G_dataset(group::MDAL_DatasetGroupH, index::Cint)::MDAL_DatasetH
end

function MDAL_G_metadataCount(group)
    @ccall mdal.MDAL_G_metadataCount(group::MDAL_DatasetGroupH)::Cint
end

function MDAL_G_metadataKey(group, index)
    @ccall mdal.MDAL_G_metadataKey(group::MDAL_DatasetGroupH, index::Cint)::Cstring
end

function MDAL_G_metadataValue(group, index)
    @ccall mdal.MDAL_G_metadataValue(group::MDAL_DatasetGroupH, index::Cint)::Cstring
end

function MDAL_G_setMetadata(group, key, val)
    @ccall mdal.MDAL_G_setMetadata(
        group::MDAL_DatasetGroupH,
        key::Cstring,
        val::Cstring,
    )::Cvoid
end

function MDAL_G_name(group)
    @ccall mdal.MDAL_G_name(group::MDAL_DatasetGroupH)::Cstring
end

function MDAL_G_driverName(group)
    @ccall mdal.MDAL_G_driverName(group::MDAL_DatasetGroupH)::Cstring
end

function MDAL_G_hasScalarData(group)
    @ccall mdal.MDAL_G_hasScalarData(group::MDAL_DatasetGroupH)::Cint
end

function MDAL_G_dataLocation(group)
    @ccall mdal.MDAL_G_dataLocation(group::MDAL_DatasetGroupH)::MDAL_DataLocation
end

function MDAL_G_maximumVerticalLevelCount(group)
    @ccall mdal.MDAL_G_maximumVerticalLevelCount(group::MDAL_DatasetGroupH)::Cint
end

function MDAL_G_minimumMaximum(group, min, max)
    @ccall mdal.MDAL_G_minimumMaximum(
        group::MDAL_DatasetGroupH,
        min::Ptr{Cdouble},
        max::Ptr{Cdouble},
    )::Cvoid
end

function MDAL_G_addDataset(group, time, values, active)
    @ccall mdal.MDAL_G_addDataset(
        group::MDAL_DatasetGroupH,
        time::Cdouble,
        values::Ptr{Cdouble},
        active::Ptr{Cint},
    )::MDAL_DatasetH
end

function MDAL_G_addDataset3D(group, time, values, verticalLevelCount, verticalExtrusions)
    @ccall mdal.MDAL_G_addDataset3D(
        group::MDAL_DatasetGroupH,
        time::Cdouble,
        values::Ptr{Cdouble},
        verticalLevelCount::Ptr{Cint},
        verticalExtrusions::Ptr{Cdouble},
    )::MDAL_DatasetH
end

function MDAL_G_isInEditMode(group)
    @ccall mdal.MDAL_G_isInEditMode(group::MDAL_DatasetGroupH)::Cint
end

function MDAL_G_closeEditMode(group)
    @ccall mdal.MDAL_G_closeEditMode(group::MDAL_DatasetGroupH)::Cvoid
end

function MDAL_G_referenceTime(group)
    @ccall mdal.MDAL_G_referenceTime(group::MDAL_DatasetGroupH)::Cstring
end

function MDAL_G_setReferenceTime(group, referenceTimeISO8601)
    @ccall mdal.MDAL_G_setReferenceTime(
        group::MDAL_DatasetGroupH,
        referenceTimeISO8601::Cstring,
    )::Cvoid
end

function MDAL_G_isTemporal(group)
    @ccall mdal.MDAL_G_isTemporal(group::MDAL_DatasetGroupH)::Cint
end

function MDAL_G_uri(group)
    @ccall mdal.MDAL_G_uri(group::MDAL_DatasetGroupH)::Cstring
end

function MDAL_D_group(dataset)
    @ccall mdal.MDAL_D_group(dataset::MDAL_DatasetH)::MDAL_DatasetGroupH
end

function MDAL_D_time(dataset)
    @ccall mdal.MDAL_D_time(dataset::MDAL_DatasetH)::Cdouble
end

function MDAL_D_volumesCount(dataset)
    @ccall mdal.MDAL_D_volumesCount(dataset::MDAL_DatasetH)::Cint
end

function MDAL_D_maximumVerticalLevelCount(dataset)
    @ccall mdal.MDAL_D_maximumVerticalLevelCount(dataset::MDAL_DatasetH)::Cint
end

function MDAL_D_valueCount(dataset)
    @ccall mdal.MDAL_D_valueCount(dataset::MDAL_DatasetH)::Cint
end

function MDAL_D_isValid(dataset)
    @ccall mdal.MDAL_D_isValid(dataset::MDAL_DatasetH)::Cint
end

function MDAL_D_hasActiveFlagCapability(dataset)
    @ccall mdal.MDAL_D_hasActiveFlagCapability(dataset::MDAL_DatasetH)::Cint
end

function MDAL_D_data(dataset, indexStart, count, dataType, buffer)
    @ccall mdal.MDAL_D_data(
        dataset::MDAL_DatasetH,
        indexStart::Cint,
        count::Cint,
        dataType::MDAL_DataType,
        buffer::Ptr{Cvoid},
    )::Cint
end

function MDAL_D_minimumMaximum(dataset, min, max)
    @ccall mdal.MDAL_D_minimumMaximum(
        dataset::MDAL_DatasetH,
        min::Ptr{Cdouble},
        max::Ptr{Cdouble},
    )::Cvoid
end
