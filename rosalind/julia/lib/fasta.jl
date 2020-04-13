function read_fasta(lines::Vector{<:AbstractString})::Vector{Tuple{AbstractString, AbstractString}}
    id_is = findall((x) -> startswith(x, '>'), lines)
    push!(id_is, length(lines) + 1)
    return [(lines[id_i], String(collect(Iterators.flatten(lines[id_i + 1:id_is[i + 1] - 1])))) for (i, id_i) in enumerate(id_is[1:end - 1])]
end

function read_fasta(text::AbstractString)::Vector{Tuple{AbstractString, AbstractString}}
    return read_fasta(split(text, "\n"))
end
