pkgs <- c("fs", "futile.logger", "ggpubr", "configr", "stringr", "ggthemes",
          "jhtools", "glue", "ggsci", "patchwork", "tidyverse", "dplyr",
          "DESeq2", "clusterProfiler", "ComplexHeatmap", "matrixStats", "FactoMineR",
          "factoextra", "jhuanglabGO")
for (pkg in pkgs){
  suppressPackageStartupMessages(library(pkg, character.only = T))
}

output_dir <- snakemake@params[[1]]
fpkm <- snakemake@params[[2]] %>% read_csv()
case <- snakemake@params[[3]] %>% strsplit(split = " ") %>% unlist()
control <- snakemake@params[[4]] %>% strsplit(split = " ") %>% unlist()
gsea_dir <- glue::glue("{output_dir}/gsea")
jhuanglabGSEA_all(dat = fpkm, case_samples = case,
                  control_samples = control,
                  out_dir = gsea_dir,
                  gmt_version = "v7.5")
