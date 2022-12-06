rule qc:
    output:
        pca_plot = RESULT_DIR   +   "{CONTRAST}/qc/pca.pdf",
        htmap = RESULT_DIR   +   "{CONTRAST}/qc/top1000_htmap.pdf"
    params:
        case = lambda wildcards: units[units.contrast == wildcards.CONTRAST]['case'],
        control = lambda wildcards: units[units.contrast == wildcards.CONTRAST]['control'],
        fpkm_dat = FPKM_DAT,
        out_dir = RESULT_DIR   +   "{CONTRAST}"
    log:
        RESULT_DIR + "{CONTRAST}/logs/qc.log"
    threads: 10
    script:
        "../R/qc.R"
