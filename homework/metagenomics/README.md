# Metagenomics analysis of oral microbiome in oral cancers

[Here](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0098741) is the paper in which we are getting our data from.

In order to download the data, use `./src/data/download`. The data can be extracted with `./src/data/extract`.

After extracting the data, we can do some quality control with [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) and [MultiQC](https://multiqc.info/). This is under `./src/data/pre-trim_quality_control`.

The results are decent, but a few reads aren't doing so great.
![Pre-trim per base sequence quality](https://0petya.github.io/bioinformatics-2/homework/metagenomics/reports/figures/pre-trim_fastqc_per_sequence_quality_scores_plot.png)

So we'll trim the reads with [kneaddata](https://bitbucket.org/biobakery/kneaddata/wiki/Home). This can be done with `./src/preprocess/trim`.

Once that's done, we can run quality control again with `./src/data/post-trim_quality_control`, and this time it looks a little better.
![Post-trim per base sequence quality](https://0petya.github.io/bioinformatics-2/homework/metagenomics/reports/figures/post-trim_fastqc_per_sequence_quality_scores_plot.png)

Before using [Humann2](https://huttenhower.sph.harvard.edu/humann), if you haven't yet, you can run these two commands to download the demo databases to reduce run time.

```
humann2_databases --download chocophlan DEMO humann2_database_downloads
humann2_databases --download uniref DEMO_diamond humann2_database_downloads
```

Then we can test it on one sample first with `./src/profile/test_humann2`. Once that looks good, we can run it on all samples with `./src/profile/run_humann2`.

After that, we can do some postprocessing on the data in `./src/postprocess/merge_metaphlan` to prepare it for analysis in [STAMP](https://beikolab.cs.dal.ca/software/STAMP). After getting the final SPF file, manually open it and remove and _unclassified_ columns, such as `t__Haemophilus_sputorum_unclassified`, before opening it with STAMP.

Here's a PCA plot from the STAMP analysis.
![PCA plot of STAMP analysis](https://0petya.github.io/bioinformatics-2/homework/metagenomics/reports/figures/PCA.png)

Here's a box plot of the most significant genus.
![Box plot of STAMP analysis, most significant genus](https://0petya.github.io/bioinformatics-2/homework/metagenomics/reports/figures/box_plot.png)

To analyze a subset of the Humann2, you can use `./src/data/profile/subset_humann2`. However, upon running it we ended up with no data. Perhaps there was an error made at some point in the pipeline.
