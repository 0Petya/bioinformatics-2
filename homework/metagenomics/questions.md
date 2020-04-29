# Questions for lab

1. How many samples are there in total (you can either look at the map.txt file or count the FASTQ files)?
    * $12$
2. How many samples are there of each sample type?
    * $6$ cancer types and $6$ normal types.
3.  Run the FASTQC for each paired-end sample. Run MultiQC. Run kneaddata using your script. Then, run FASTQC again with the pre-processed samples. Run MultiQC. Provide your scripts and MultiQC output.
    * Refer to [README.md](https://github.com/0Petya/bioinformatics-2/blob/master/homework/metagenomics/README.md).
4. What is the relative abundance of organisms unclassified at the species level for the genus Neisseria for the sample p144C?
    * $0$. Only $3$ genus were found in my analysis, _Fusobacterium_, _Haemophilus_, and _Prevotella_.
5. Make you own shell script (run_humann2.sh) to run it. The shell script should get the FASTQ list of files in a directory in a shell script, and run the humann2 iteratively. Copy and paste your shell script to the answer sheet. Use 8 (or 12) threads to run each run.
    * The script is [here](https://github.com/0Petya/bioinformatics-2/blob/master/homework/metagenomics/src/profile/run_humann2).
6. How did you replace "_metaphlan_bugs_list" into NULL? Check the sed command in the web manual, but I hope you work it using your own way. Copy and paste your command into your solution sheet.
    * I used `sed` because it's awesome. You can see it [here](https://github.com/0Petya/bioinformatics-2/blob/master/homework/metagenomics/src/postprocess/merge_metaphlan).
7. How much of the variation is explained by PC3?
    * $13\%$
8. Which genus is significant based on its raw P-value?
    * g__Gemella
9. Save this boxplot of the Q9 genus by going to File -> Save plot and attach here
    * Refer to [README.md](https://github.com/0Petya/bioinformatics-2/blob/master/homework/metagenomics/README.md).
