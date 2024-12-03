#!/bin/bash
# Credits goes to Zdenek Kasner
squeue --me | \
  awk 'NR>1 {print $1, $3}' | \
  while read job_id job_name; do
    tmux new-window -d -n "$job_name" "sattach --pty ${job_id}.0"
  done
