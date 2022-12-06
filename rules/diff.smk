rule get_diff_genes:
    output:
        diff_genes = RESULT_DIR   +   "{CONTRAST}/diff/diff_genes.xlsx",
        volcano = RESULT_DIR   +   "{CONTRAST}/diff/volcano_plot.pdf"
    params:
        case = lambda wildcards: units[units.contrast == wildcards.CONTRAST]['case'],
        control = lambda wildcards: units[units.contrast == wildcards.CONTRAST]['control'],
        species = str(config['general']['species']),
        count_dat = COUNT_DAT,
        out_dir = RESULT_DIR   +   "{CONTRAST}"
    log:
        RESULT_DIR + "{CONTRAST}/logs/get_diff_genes.log"
    threads: 10
    script:
        "../R/diff_genes.R"
