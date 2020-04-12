file_path = input("Insert file name: ")
sequence = readline(file_path)

counts = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
for n in sequence
    counts[n] += 1
end

print("$(counts['A']) $(counts['C']) $(counts['G']) $(counts['T'])")
