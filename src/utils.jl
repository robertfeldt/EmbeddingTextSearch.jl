function vectors2matrix(v::AbstractVector{V}) where {V <: AbstractVector{<:Real}} 
    MT = Matrix{eltype(v[1])}(undef, length(v[1]), length(v))
    for i in eachindex(v)
        MT[:, i] = v[i]
    end
    return MT
end

function extract_documents(jsonfile, textfield)
    @info "Reading source file"
    @time all = open(jsonfile, "r") do io
        JSON.parse(read(io, String))
    end
    
    @info "Extracting documents"
    @time return map(d -> d[textfield], all)
end