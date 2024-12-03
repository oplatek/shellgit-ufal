#!/bin/bash

ollama_host="0.0.0.0:11434"

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export PATH="$SCRIPT_DIR:$PATH"
. $SCRIPT_DIR/parse_options.sh

port="$(echo $ollama_host | cut -d: -f2)"

OLLAMA_HOST="$ollama_host" OLLAMA_KEEP_ALIVE=-1 gpu-bash --jobname "O${port}" --async false ollama serve
