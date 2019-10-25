using MDAL
using Test

@testset "MDAL.jl" begin
    # Check version
    @test unsafe_string(MDAL.MDAL_Version()) == "0.3.3"

    # Check status
    x = MDAL.MDAL_LastStatus()

    # Test drivers
    @test MDAL.MDAL_driverCount() >= 13

    # Test driver
    driver = MDAL.MDAL_driverFromIndex(1)
    @test unsafe_string(MDAL.MDAL_DR_name(driver)) == "SELAFIN"
    @test unsafe_string(MDAL.MDAL_DR_longName(driver)) == "Selafin File"

    println("Testing available drivers:")
    for i in 0:MDAL.MDAL_driverCount()-1
        driver = MDAL.MDAL_driverFromIndex(i)
        println("\t$(unsafe_string(MDAL.MDAL_DR_longName(driver)))")
        # println(MDAL.MDAL_LastStatus())
    end

    @test MDAL.MDAL_driverFromName("Foo") == C_NULL


    # Load test file
    fn = "/Users/epta/git/MDAL/tests/data/ugrid/D-Flow1.2/bw_11_zonder_riviergrid_met_1dwtg_clm.nc"
    mesh = MDAL.MDAL_LoadMesh(fn)
    println(mesh)
    MDAL.MDAL_CloseMesh(mesh)

    m = MDALMesh(MDAL.MDAL_LoadMesh(fn))
    println(m)
    v = MDAL.vertices(m)
    println(v)

    dgs = collect(MDAL.DataSetGroups(m))
    for dg in dgs
        println(dg)
    end

    dsg = dgs[1]
    dss = collect(MDAL.DataSets(dsg))
    for ds in dss
        println(ds)
    end

    ds = dss[1]
    println(isvalid(ds))
    println(time(ds))

    # Test error
    @test_throws ErrorException("Err_FileNotFound") MDAL.MDAL_LoadMesh("foo.nc")

end
