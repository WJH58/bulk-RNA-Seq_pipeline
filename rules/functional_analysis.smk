rule go:
    input:
        res = RESULT_DIR   +  "{CONTRAST}/diff/diff_genes.xlsx"
    output:
        go = RESULT_DIR   +   "{CONTRAST}/go/all_BP_barplot.pdf"
    params:
        species = str(config['general']['species']),
        out_dir = RESULT_DIR   +   "{CONTRAST}",
        res = RESULT_DIR   +  "{CONTRAST}/diff/diff_genes.xlsx"
    output:
    log:
        RESULT_DIR + "{CONTRAST}/logs/go.log"
    threads: 10
    script:
        "../R/go.R"

rule kegg:
    input:
        res = RESULT_DIR   +  "{CONTRAST}/diff/diff_genes.xlsx"
    output:
        kegg = RESULT_DIR   +   "{CONTRAST}/kegg/KEGG.csv"
    params:
        species = str(config['general']['species']),
        out_dir = RESULT_DIR   +   "{CONTRAST}",
        res = RESULT_DIR + "{CONTRAST}/diff/diff_genes.xlsx"
    log:
        RESULT_DIR + "{CONTRAST}/logs/kegg.log"
    threads: 10
    script:
        "../R/kegg.R"

rule gsea:
    output:
        gsea = RESULT_DIR   +   "{CONTRAST}/gsea/c1"
    params:
        out_dir = RESULT_DIR   +   "{CONTRAST}",
        fpkm_dat = FPKM_DAT,
        case = lambda wildcards: units[units.contrast == wildcards.CONTRAST]['case'],
        control = lambda wildcards: units[units.contrast == wildcards.CONTRAST]['control'],
    log:
        RESULT_DIR + "{CONTRAST}/logs/gsea.log"
    threads: 10
    script:
        "../R/gsea.R"
