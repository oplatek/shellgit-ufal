#!/bin/bash

# This script functions as a wrapper of a bash command that uses GPUs.
#
# It sets the CUDA_VISIBLE_DEVICES variable so that it limits the number of GPUs
# used for programs. It is neccesary for running a job on the grid if the job
# would automatically grabs all resources available on the system, e.g. a
# TensorFlow program.

num_gpus=1 # this variable indicates how many GPUs we will allow the command
           # passed to this script will run on. We achieve this by setting the
           # CUDA_VISIBLE_DEVICES variable
set -e

if [ "$1" == "--num-gpus" ]; then
  num_gpus=$2
  shift
  shift
fi

if ! printf "%d" "$num_gpus" >/dev/null || [ $num_gpus -le -1 ]; then
  echo $0: Must pass a positive interger or 0 after --num-gpus
  echo e.g. $0 --num-gpus 2 local/tfrnnlm/run_lstm.sh
  exit 1
fi

if [ $# -eq 0 ]; then
  echo "Usage:  $0 [--num-gpus <num-gpus>] <command> [<arg1>...]"
  echo "Runs <command> with args after setting CUDA_VISIBLE_DEVICES to "
  echo "make sure exactly <num-gpus> GPUs are visible (default: 1)."
  exit 1
fi

num_total_gpus=`nvidia-smi -L | wc -l`
num_gpus_assigned=0
machine=`hostname`

echo "Total gpus on machine $machine $num_total_gpus"
if [ $num_gpus -eq 0 ] ; then
   if ! [ -z $CUDA_VISIBLE_DEVICES ] ; then
       echo "WARNING $CUDA_VISIBLE_DEVICES IS SET DESPITE num_gpus is $num_gpus"
else
    export CUDA_VISIBLE_DEVICES=$(echo $CUDA_VISIBLE_DEVICES | sed "s=,$==g")
    selected_gpus=$($CUDA_VISIBLE_DEVICES | tr ':' '\n' | wc -l)
    if [ $selected_gpus -ne $num_gpus ] ; then
        echo "WARNING $CUDA_VISIBLE_DEVICES CONTAINS UNEXPECTED NUMBER OF GPUS $selected_gpus vs num_gpus $num_gpus"
    fi
fi

"$@"
