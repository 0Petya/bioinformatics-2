# RNA-seq analysis of calorie-restricted and non-restricted WT yeast

[Here](https://www.cell.com/cell-metabolism/fulltext/S1550-4131(14)00167-3?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS1550413114001673%3Fshowall%3Dtrue) is the paper in which we are getting our data from. The GEO ID is [GSE53720](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE53720).

SRR1066657 and SRR1066658 were on non-restricted diets, then SRR1066659 and SRR1066660 were on restricted diets.

In order to download the dataset, we use `fasterq-dump`, which is a part of the NCBI [sra-tools](https://github.com/ncbi/sra-tools) package. The script to download the data is under `./src/data/download`. The script places the data under `./data/raw`. It will also download the reference genome with annotations from [NCBI](https://www.ncbi.nlm.nih.gov/genome/?term=Saccharomyces%20cerevisiae[Organism]&cmd=DetailsSearch).

After the data is downloaded, we use [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) to generate quality control reports of the data and use [MultiQC](https://multiqc.info/) to visualize it. This done with `./src/data/quality_control`. The report will be under [`./reports/qc/multiqc_report.html`](https://0petya.github.io/bioinformatics-2/homework/rna-seq/reports/qc/multiqc_report.html).

The per base sequence quality is great for all samples, so no need to trim.
![Per base sequence quality](https://0petya.github.io/bioinformatics-2/homework/rna-seq/reports/figures/fastqc_per_sequence_quality_scores_plot.png)

Great, now we move on to aligning the reads with [STAR](https://github.com/alexdobin/STAR). Before doing so we need to convert the GFF reference annotation file to GTF format. We use `gffread` which is a part of [Cufflinks](http://cole-trapnell-lab.github.io/cufflinks/). Finally, we can build the genome indexes with STAR. This is all done in `./src/processing/build_star_indicies`. Once that's done, we actually align the reads with `./src/processing/star_align`.

Once reads are aligned, we use [featureCounts](http://bioinf.wehi.edu.au/featureCounts/) to quantify. That is under `./src/processing/quantify_star_alignments`. Great, but let's also try using a transcript abundance estimator as well to see how that compares.

A popular transcript estimator is [Salmon](https://salmon.readthedocs.io/en/latest/salmon.html), which is an alignment-free method of quantification. It requires a transcriptome to map to, however, so we use [this one](https://www.ncbi.nlm.nih.gov/genome/?term=S288C%20saccharomyces%20cerevisiae&utm_source=gquery&utm_medium=search) (included under the `./src/data/download` script.

It requires you to create an index of the transcriptome, we do so in `./src/processing/build_salmon_indicies`. Then the quantification is done in `./src/processing/quantify_salmon_reads`.

After getting both counts and estimations, we analyze them in [R](https://www.r-project.org/) using the [DESeq2](https://bioconductor.org/packages/release/bioc/html/DESeq2.html) library for differential expression analysis. The notebooks are under `./notebooks/`, but you can find the report for STAR [here](https://0petya.github.io/bioinformatics-2/homework/rna-seq/reports/star_counts_analysis.nb.html) and for Salmon [here](https://0petya.github.io/bioinformatics-2/homework/rna-seq/reports/salmon_estimation_analysis.nb.html). In the reports you will find extra detail regarding the code and preparation required.

In closing, there's definitely a different expression profile between the non-restricted/calorie-restricted diet in Yeast. The differences between STAR and Salmon output are negligible as indicated by the log fold change and PCA plots.
