# Genome assembly of _Staphylococcus aureus_

Raw paired-end sequencing reads were obtained from [here](https://zenodo.org/record/582600). Each read is 150bp long, with a read coverage of 19x.

We used [MultiQC](https://multiqc.info/) to quality check the reads. The report can be viewed [here](https://0petya.github.io/bioinformatics-2/homework/genome-assembly-lab/multiqc_report.html). The results for acceptable, with the average [Phread](https://en.wikipedia.org/wiki/Phred_quality_score) quality score well above 28.

We used [BBMap](https://jgi.doe.gov/data-and-tools/bbtools/bb-tools-user-guide/bbmap-guide/) to combine the two FASTA files to create an interleaved file.

```
reformat.sh in1=mutant_R1.fastq in2=mutant_R2.fastq out=mutant_interleaved.fastq
```

Then we used [Velvet](https://www.ebi.ac.uk/~zerbino/velvet/) to assemble the genome. First we had to create the k-mers with `velveth`, then we can perform the actual assembly with `velvetg`.

```
velveth run_29 29 -fastq -shortPaired -interleaved ../data/mutant_interleaved.fastq
velvetg run_29/
```

Once that was complete, we can check the quality of our assembly using (Quast)[http://quast.sourceforge.net/quast].

```
quast contigs.fa
```

Our results were not too great, with an N50 of `5811`, we investigated further with [R](https://www.r-project.org/).

```
R
> library(plotrix)
> data <- read.table("stats.txt", header=TRUE)
> jpeg(‘stats_dist.jpg')
> weighted.hist(data$short1_cov, data$lgth, breaks=0:50)
```

![Read coverage distribution](https://0petya.github.io/bioinformatics-2/homework/genome-assembly-lab/stats_dist.jpg)

You can see that expected coverage is around 15-16, with what appears to be some noise under 6. So we ran Velvet again with a coverage cutoff.

```
velvetg run_29 -cov_cutoff 6 -exp_cov 14
```

This time, the [Quast report](https://0petya.github.io/bioinformatics-2/homework/genome-assembly-lab/velvet.html) was much better, with an N50 of 132140.

Velvet is considered an old assembler, so we tried the assembly with a more modern assembler, [SPAdes](http://cab.spbu.ru/software/spades/).

```
spades.py --12 ../data/mutant_interleaved.fastq -o spades
```

[Here](https://0petya.github.io/bioinformatics-2/homework/genome-assembly-lab/spades.html)'s the Quast report. The N50 was exactly the same at 132140, but with a slightly longer assembly length and no mismatches. We attempted to run SPAdes with a coverage cutoff of 6, but that yielded the same results as the auto-tuned assembler.

Overall the assembly quality between Velvet and SPAdes were very similar, but Velvet required more manual work to tweak it to get a good result, whereas with SPAdes we had to run one command and it figured out the best options for us.

###### _Note: Velvet had to be run with an odd number for the k-mer length in order to deal with palindromic sequences._