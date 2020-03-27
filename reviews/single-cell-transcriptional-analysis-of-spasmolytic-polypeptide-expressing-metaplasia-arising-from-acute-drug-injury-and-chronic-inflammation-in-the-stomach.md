**Review of: Single-cell transcriptional analyses of spasmolytic polypeptide-expressing metaplasia arising from acute drug injury and chronic inflammation in the stomach**

Peter Tran

In this paper, DiPaolo _et al_. use single-cell RNA-seq (scRNA-seq) in order to identify the transcriptional profile of spasmolytic polypeptide-expressing metaplasia (SPEM) derived from acute drug injury and chronic inflammation of the gastric mucosa. The authors isolated epithelial cells from healthy, acutely damaged, and chronically inflamed stomachs and performed scRNA-seq. The authors found that healthy cells express Mucin 6 and gastric intrinsic factor, but do not express transcripts associated with SPEM. They also found that SPEM and neck cell hyperplasia/hypertrophy have similar SPEM-associated transcriptional profiles, as well as that the profile being similar between drug-induced and chronic inflammation induced SPEM.

In terms of scRNA-seq, the authors used CellRanger from 10x Genomics to process the raw data, and Seurat in R for secondary clustering and differential expression analysis. They removed cells expressing high levels of mitochondrial markers, and scaled each library and performed a log transformation. They clustered cells and visualized it with t-SNE.
