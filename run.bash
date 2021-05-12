#!/usr/bin/env bash
#$ -t 1
#$ -V
#$ -S /bin/bash
#$ -j y
#$ -cwd
#$ -o /dev/null
#$ -e /dev/null

# An example bash script demonstrating how to run the entire snakemake pipeline
# on the UCSD Datahub
# This script creates two separate log files in the output dir:
# 	1) log - the basic snakemake log of completed rules
# 	2) qlog - a more detailed log of the progress of each rule and any errors

# Before running this snakemake pipeline, remember to complete the config file
# with the required input info.
# Also, make sure that this script is executed from the directory that it lives in!

# you can specify a directory for all output here:
out_path="out"
mkdir -p "$out_path"

# clear leftover log files
if [ -f "${out_path}/log" ]; then
	echo ""> "${out_path}/log";
fi
if [ -f "${out_path}/qlog" ]; then
	echo ""> "${out_path}/qlog";
fi

# try to find and activate the snakemake conda env if we need it
if ! command -v 'snakemake' &>/dev/null && \
	command -v 'conda' &>/dev/null && \
   [ "$CONDA_DEFAULT_ENV" != "snakemake" ] && \
   conda info --envs | grep "$CONDA_ROOT/snakemake" &>/dev/null; then
        echo "Snakemake not detected. Attempting to switch to snakemake environment." >> "$out_path/log"
        eval "$(conda shell.bash hook)"
        conda activate snakemake
fi

# check: are we being executed from within qsub?
snakemake \
--config out="$out_path" \
--latency-wait 60 \
--use-conda \
-k \
-j 32 \
"$@" 2>>"$out_path/log" >>"$out_path/qlog"
