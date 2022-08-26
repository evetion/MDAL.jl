@enum MDAL_Status::UInt32 begin
    None = 0
    Err_NotEnoughMemory = 1
    Err_FileNotFound = 2
    Err_UnknownFormat = 3
    Err_IncompatibleMesh = 4
    Err_InvalidData = 5
    Err_IncompatibleDataset = 6
    Err_IncompatibleDatasetGroup = 7
    Err_MissingDriver = 8
    Err_MissingDriverCapability = 9
    Err_FailToWriteToDisk = 10
    Err_UnsupportedElement = 11
    Warn_InvalidElements = 12
    Warn_ElementWithInvalidNode = 13
    Warn_ElementNotUnique = 14
    Warn_NodeNotUnique = 15
    Warn_MultipleMeshesInFile = 16
end

@enum MDAL_LogLevel::UInt32 begin
    Error = 0
    Warn = 1
    Info = 2
    Debug = 3
end

@enum MDAL_DataLocation::UInt32 begin
    DataInvalidLocation = 0
    DataOnVertices = 1
    DataOnFaces = 2
    DataOnVolumes = 3
    DataOnEdges = 4
end

const MDAL_MeshH = Ptr{Cvoid}

const MDAL_MeshVertexIteratorH = Ptr{Cvoid}

const MDAL_MeshEdgeIteratorH = Ptr{Cvoid}

const MDAL_MeshFaceIteratorH = Ptr{Cvoid}

const MDAL_DatasetGroupH = Ptr{Cvoid}

const MDAL_DatasetH = Ptr{Cvoid}

const MDAL_DriverH = Ptr{Cvoid}

# typedef void ( * MDAL_LoggerCallback ) ( MDAL_LogLevel logLevel , MDAL_Status status , const char * message )
const MDAL_LoggerCallback = Ptr{Cvoid}

@enum MDAL_DataType::UInt32 begin
    SCALAR_DOUBLE = 0
    VECTOR_2D_DOUBLE = 1
    ACTIVE_INTEGER = 2
    VERTICAL_LEVEL_COUNT_INTEGER = 3
    VERTICAL_LEVEL_DOUBLE = 4
    FACE_INDEX_TO_VOLUME_INDEX_INTEGER = 5
    SCALAR_VOLUMES_DOUBLE = 6
    VECTOR_2D_VOLUMES_DOUBLE = 7
end

# Skipping MacroDefinition: MDAL_EXPORT __attribute__ ( ( visibility ( "default" ) ) )
