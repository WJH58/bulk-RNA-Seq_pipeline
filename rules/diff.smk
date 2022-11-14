rule get_diff_genes:
    output:
        out_dir = RESULT_DIR + "{contrast}/diff",
        diff_genes = RESULT_DIR + "{contrast}/diff/diff_genes.xlsx"
    params:
        case = units.loc[units.treatment == "case"]['sample'],
        control = units.loc[units.treatment == "control"]['sample'],
        speceis = str(config['general']['species'])
    log:
        RESULT_DIR + "logs/{contrast}/get_diff_genes.log"
    threads: 10
    script:
        "R/diff_genes.R"
