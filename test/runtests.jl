using MDAL
using Test
using Downloads

@testset "MDAL.jl" begin

    test_nc = Downloads.download(
        "https://github.com/lutraconsulting/MDAL/raw/master/tests/data/ugrid/D-Flow1.2/bw_11_zonder_riviergrid_met_1dwtg_clm.nc",
    )

    # Check version
    @test unsafe_string(MDAL.MDAL_Version()) == "0.9.4"

    # Check status
    x = MDAL.MDAL_LastStatus()

    # Test drivers
    @test MDAL.MDAL_driverCount() >= 13

    # Test driver
    driver = MDAL.MDAL_driverFromIndex(1)
    @test unsafe_string(MDAL.MDAL_DR_name(driver)) == "XMS_TIN"
    @test unsafe_string(MDAL.MDAL_DR_longName(driver)) == "XMS Tin Mesh File"

    println("Testing available drivers:")
    for i = 0:MDAL.MDAL_driverCount()-1
        driver = MDAL.MDAL_driverFromIndex(i)
        println("\t$(unsafe_string(MDAL.MDAL_DR_longName(driver)))")
    end

    @test MDAL.MDAL_driverFromName("Foo") == C_NULL

    # Load test file
    mesh = MDAL.MDAL_LoadMesh(test_nc)
    MDAL.MDAL_CloseMesh(mesh)

    m = MDALMesh(MDAL.MDAL_LoadMesh(test_nc))
    v = MDAL.vertices(m)

    dgs = collect(MDAL.DataSetGroups(m))
    # for dg in dgs
    # println(dg)
    # end

    dsg = dgs[1]
    dss = collect(MDAL.DataSets(dsg))
    # for ds in dss
    # println(ds)
    # end

    ds = dss[1]
    # println(isvalid(ds))
    # println(time(ds))

    # Test error
    MDAL.MDAL_LoadMesh("foo.nc")
    @test_throws ErrorException("Err_FileNotFound") MDAL.check_MDAL()

end
