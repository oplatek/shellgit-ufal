#!/bin/bash
# e.g. allowed_ssh_agents=('geri freki blackbird sol8')  # login or work machines
allowed_ssh_agents="$1"
# see https://wiki.ufal.ms.mff.cuni.cz/internal:remote-access
agent_file_prefix="$HOME/.ssh/environment"
hostname=`hostname -s`
agent_file="${agent_file_prefix}/${hostname}"

mkdir -p $agent_file_prefix

function start_agent () {
  >&2 echo "Initialising new SSH agent for $hostname"
  ssh-agent | sed 's/^echo/#echo/' > "$agent_file"
  chmod 600 "$agent_file"
  . "$agent_file" > /dev/null
  ssh-add -l >/dev/null || ssh-add  > /dev/null || >&2 echo "Adding ssh-key to ss-agent failed. Ssh-agen will not probably work."
  use_ssh_agent
}

function use_ssh_agent() {
  alias ssh="ssh -A" # Force X-forwarding (+alias adding the key to agent)
  ssh_pid=$(cat $agent_file 2> /dev/null | grep 'AGENT_PID' | sed 's/.*=\([0-9]*\);.*/\1/')
  >&2 echo "Using SSH agent(pid: $ssh_pid) on $hostname"
}

containsElement () {
  local e
  for e in ${@:2}; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}


# Source SSH settings, if applicable
if ( tty -s) ; then
  if containsElement "$hostname" "${allowed_ssh_agents[@]}" ; then
    if [ ! -f "${agent_file}" ] ; then
      >&2 echo "No settings for ssh agent found. Creating new."
      start_agent
     else
       . "${agent_file}" > /dev/null
       pid_name=$(ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent | rev | cut -d ' ' -f 1 | rev 2> /dev/null)
       if [[ "$pid_name" != 'ssh-agent' ]] ; then
         >&2 echo "Ssh agent with PID $SSH_AGENT_PID is not running anymore.  (Found process '$pid_name' instead). Restarting."
         start_agent
       else
         >&2 echo "Found running ssh-agent $agent_pid"
         use_ssh_agent
       fi
     fi
  else
    >&2 echo "SSH agent on $hostname is not allowed."
  fi
fi
