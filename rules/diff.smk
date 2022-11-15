rule get_diff_genes:
    output:
        diff_genes = RESULT_DIR   +   "{CONTRAST}/diff/diff_genes.xlsx"
    params:
        case = units[units.contrast == "{CONTRAST}"]['case'],
        control = units[units.contrast == "{CONTRAST}"]['control'],
        species = str(config['general']['species']),
        count_dat = COUNT_DAT,
        out_dir = RESULT_DIR   +   "{CONTRAST}"
    log:
        RESULT_DIR + "{CONTRAST}/logs/get_diff_genes.log"
    threads: 1
    script:
        "../R/diff_genes.R"
