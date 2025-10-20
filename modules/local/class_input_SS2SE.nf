process CLASS_INPUT_SS2SE {
    tag "${params.dataname}"
    
    label 'process_high'

    input:
    tuple val(sample_ID), file(bam_R1)
    val dataname
    val libraryType
    path annotator_pickle
    path gtf

    output:
    tuple val(sample_ID), path(outname),    emit: class_input

    script:
    outname = "${sample_ID}.class_input"

    """
    light_class_input_subcols.py \\
        --bams ${bam_R1} \\
        --libraryType ${libraryType} \\
        --annotator ${annotator_pickle} \\
        --gtf ${gtf} \\
        --outname ${outname} 
    """

}