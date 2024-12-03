#!/bin/bash
printf "\n $(hostname) $CUDA_VISIBLE_DEVICES: Running $@ \n\n"
sleep 1
$@
