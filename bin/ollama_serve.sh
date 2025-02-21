#!/bin/bash

ollama_host="0.0.0.0:11434"
mem=64
gpu_mem=48

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export PATH="$SCRIPT_DIR:$PATH"
. $SCRIPT_DIR/parse_options.sh

port="$(echo $ollama_host | cut -d: -f2)"

OLLAMA_MODELS="/lnet/work/projects/LLM/ollama" \
OLLAMA_HOST="$ollama_host" \
OLLAMA_KEEP_ALIVE=-1 \
gpu-bash --mem "$mem" --gpu_mem "$gpu_mem" --jobname "O${port}" --async false \
ollama serve
