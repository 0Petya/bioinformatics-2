using HTTP

include("../lib/fasta.jl")

file_path = input("Insert file name: ")
proteins = readlines(file_path)

glyco_motif = r"N[^P][ST][^P]"
for protein in proteins
    r = HTTP.get("http://www.uniprot.org/uniprot/$protein.fasta")
    fasta = read_fasta(String(r.body))[1]
    n_glycosylation_motif_postions = [m.offset for m in collect(eachmatch(glyco_motif, (fasta[2]), overlap=true))]
    if !isempty(n_glycosylation_motif_postions)
        println(protein)
        println(join(n_glycosylation_motif_postions, ' '))
    end
end
