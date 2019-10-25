const errors = CEnum.namemap(MDAL_Status)

function check_MDAL(p::Ptr{Nothing})
    if p != C_NULL
        return p
    else
        state = errors[Int(MDAL.MDAL_LastStatus())]
        if state == :None
            return p
        else
            error(state)
        end
    end
end

function check_MDAL(p::Any)
    state = errors[Int(MDAL.MDAL_LastStatus())]
    if state == :None
        p
    else
        error(state)
    end
end
