#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100G
#SBATCH --cpus-per-task=1
#SBATCH --time=0-12:00:00
#SBATCH --output=nextflow-spliz.slurm.%a.stdout
#SBATCH --array=1
#SBATCH --mail-user=abel.david@meei.harvard.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="NF-SPLIZ"
#SBATCH --account="l2_jan_lab"

echo "Log -- Start Nextflow Spliz Job"
echo "Log -- ================="  
echo "Log -- Date: $(date)"

conda activate nf-spliz-env
# nextflow run salzmanlab/spliz -r main -latest -c petipre_sgn_2022.config -N abel.david@vanderbilt.edu
nextflow run . -c petipre_sgn_test.config -N abel.david@vanderbilt.edu

echo "Log -- Date: $(date)"
echo "Log -- End Job" 





