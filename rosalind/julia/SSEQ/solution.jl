include("../lib/fasta.jl")

file_path = input("Insert file name: ")
lines = readlines(file_path)
fasta = read_fasta(lines)
s = fasta[1][2]
t = collect(fasta[2][2])

indicies = []
for i = 1:length(s)
    if isempty(t)
        break
    elseif s[i] == t[1]
        push!(indicies, i)
        deleteat!(t, 1)
    end
end

if isempty(t)
    print(join(indicies, ' '))
else
    print("Motif not found.")
end
