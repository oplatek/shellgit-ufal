#!/bin/bash
set -e
# Example parameter usage:
#       DIAL gpt_bpe 4 11 8 44 66  
# Parse arguments
[ "$#" -ge 7 ] || { echo Usage: "$0 name config gpus gpu_ram processes_per_gpu ram hard_ram" >&2; exit 1;}
name="$1"       # Name of the run
config="$2"     # Config file
gpus="$3"       # Number of GPUs to use 
gr="$4"         # Required size of GPUs in GB
workers="$5"    # Number of processes per single GPU
mf="$6"         # RAM in GB
hd="$7"         # Hard RAM constraint, something like 1.5 times RAM 
threads=$(($workers * $gpus))
qsub -N "$name" -cwd -b y -j y -q 'gpu-*' -pe smp "$threads" \
  -l gpu=$gpus,gpu_ram=${gr}G,mem_free="$mf"G,act_mem_free="$mf"G,h_data="$hd"G \
  $(which python3) SEMHLE_PTATRI_TVUJ_SKRIPT.py --gpus $gpus --num-workers $workers --config "configs/$config.yaml" --name $name
