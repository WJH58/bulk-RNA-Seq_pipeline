case <- snakemake@params[['case']]
control <- snakemake@params[['control']]
count_dat <- snakemake@params[['count_dat']]
species <- snakemake@params[['species']]
output_dir <- snakemake@ouput[['out_dir']]
library(jhuanglabGO)
jhuanglabGO::get_diff_genes(case, control, count_dat, species = "mouse", output_dir)
