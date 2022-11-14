################## Import libraries ##################

import pandas as pd
import os
import sys
from subprocess import call
import itertools
from snakemake.utils import R


################## Configuration file and PATHS##################

configfile: "config.yaml"

RESULT_DIR          = config["results_dir"]

units = pd.read_table(config["units"], dtype=str)
count_dat = pd.read_csv(config["general"]["count_dat"])


##############
# Wildcards
##############
wildcard_constraints:
    sample = "[A-Za-z0-9]+"

wildcard_constraints:
    unit = "[A-Za-z0-9]+"

################## DESIRED OUTPUT ##################
# Here we define the outputs of rules we want the pipeline to produce.
# The varialble defined here is then used in the `rule all`.

DIFF_GENES          =           expand(RESULT_DIR   +   "diff/diff_genes.xlsx")
VOLCANO             =           expand(RESULT_DIR   +   "diff/volcano_plot.pdf")
BP_barplot          =           expand(RESULT_DIR   +   "go/all_BP_barplot.pdf")
GSEA                =           expand(RESULT_DIR   +   "gsea/c1")
KEGG                =           expand(RESULT_DIR   +   "kegg/KEGG.csv")
PCA                 =           expand(RESULT_DIR   +   "qc/pca.pdf")
HTMAP               =           expand(RESULT_DIR   +   "qc/top1000_htmap.pdf")

rule all:
    input:
        DIFF_GENES
       # VOLCANO,
       # BP_barplot,
       # GSEA,
       # KEGG,
       # PCA,
       # HTMAP

    message : "Analysis is complete!"
    log : "log/rule_all.log"
    shell : ""

################## INCLUDE RULES ##################
#include: "rules/qc.smk"
include: "rules/diff.smk"
#include: "rules/functioanl_analysis.smk"
