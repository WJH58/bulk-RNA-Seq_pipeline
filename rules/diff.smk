rule get_diff_genes:
    output:
        out_dir = expand(RESULT_DIR + "{contrast}/diff", contrast = CONTRAST),
        diff_genes = expand(RESULT_DIR + "{contrast}/diff/diff_genes.xlsx", contrast = CONTRAST)
    params:
        case = units[units.contrast == expand("{contrast}", contrast = CONTRAST)]['case'],
        control = units[units.contrast == expand("{contrast}", contrast = CONTRAST)]['control'],
        species = str(config['general']['species'])
    log:
        expand(RESULT_DIR + "logs/{contrast}/get_diff_genes.log", contrast = CONTRAST)
    threads: 10
    script:
        "R/diff_genes.R"
