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

units = pd.read_table(config["units"], dtype=str).set_index(["contrast"], drop = False)
CONTRAST = units['contrast'].unique().tolist()
COUNT_DAT = config["general"]["count_dat"]


##############
# Wildcards
##############
wildcard_constraints:
    contrast = "[A-Za-z0-9]+"

################## DESIRED OUTPUT ##################
# Here we define the outputs of rules we want the pipeline to produce.
# The varialble defined here is then used in the `rule all`.
DIFF_GENES           =           expand(RESULT_DIR   +   "{contrast}/diff/diff_genes.xlsx", contrast = CONTRAST)
#VOLCANO             =           expand(RESULT_DIR   +   "{contrast}/diff/volcano_plot.pdf", contrast = CONTRAST)
#BP_barplot          =           expand(RESULT_DIR   +   "{contrast}/go/all_BP_barplot.pdf", contrast = CONTRAST)
#GSEA                =           expand(RESULT_DIR   +   "{contrast}/gsea/c1", contrast = CONTRAST)
#KEGG                =           expand(RESULT_DIR   +   "{contrast}/kegg/KEGG.csv", contrast = CONTRAST)
#PCA                 =           expand(RESULT_DIR   +   "{contrast}/qc/pca.pdf", contrast = CONTRAST)
#HTMAP               =           expand(RESULT_DIR   +   "{contrast}/qc/top1000_htmap.pdf", contrast = CONTRAST)

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
