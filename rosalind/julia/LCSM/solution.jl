include("../lib/fasta.jl")

file_path = input("Insert file name: ")
lines = readlines(file_path)
fasta = read_fasta(lines)
sequences = [x[2] for x in fasta]

found = false
first_sequence = sequences[1]
other_sequences = sequences[2:end]
for i = length(first_sequence):-1:1, j in 0:length(first_sequence) - i
    subsequence = first_sequence[1 + j:i + j]
    if all([occursin(subsequence, other_sequence) for other_sequence in other_sequences])
        print(subsequence)
        global found = true
        break
    end
end

if !found
    print("No longest common subsequence found.")
end
