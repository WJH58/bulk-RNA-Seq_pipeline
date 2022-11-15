pkgs <- c("readr", "jhuanglabGO", "tidyverse", "ggplot2")
for (pkg in pkgs){
  suppressPackageStartupMessages(library(pkg, character.only = T))
}
case <- snakemake@params[[1]] %>% strsplit(split = " ") %>% unlist()
control <- snakemake@params[[2]] %>% strsplit(split = " ") %>% unlist()
count_dat <- snakemake@params[[4]] %>% read_csv()
species <- snakemake@params[[3]]
output_dir <- snakemake@params[[5]]
res <- jhuanglabGO::get_diff_genes(case, control, count_dat, species, output_dir)
jhuanglabGO::volcano_plot_rna(res, output_dir = output_dir)
