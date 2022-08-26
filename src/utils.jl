function check_MDAL()
    status = MDAL_LastStatus()
    if status != MDAL.None
        error(status)
    end
    nothing
end
