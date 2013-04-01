#!/bin/sh

####
# This script pauses SSH tunnels and resumes them before they disconnect.
# the goal is to increase battery life when the tunnel is not needed, but
# should remain open for future use.
####

# resume ssh on signals.
trap "echo ' resuming ssh tunnels'; pkill -SIGCONT -f 'ssh -L'; exit" SIGINT SIGTERM

while true; do
    pkill -SIGSTOP -f 'ssh -L'
    sleep 30
    pkill -SIGCONT -f 'ssh -L'
    sleep 5
done

