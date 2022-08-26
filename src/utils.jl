function check_MDAL()
    status = MDAL_LastStatus()
    if status != MDAL.None
        error(status)
    end
    nothing
end

macro check(obj, ex)
    return :($(esc(ex)) == 0 ? nothing : laszip_error($(esc(obj))))
end
