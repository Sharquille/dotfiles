#!/usr/bin/env bash

# Script to set up new MacOS operating systems to suit my need 

set -e # Exit script immediately on any error. 
set -u # treat undefined variables as an error.
set -o pipefail # Capture errors in piped commands. 

LOGFILE="$HOME/bootstrap.log"

echo "starting macOS bootstrap...."
echo "Logs will be saved to: $LOGFILE"
echo "________________________________"

# Helper function: log and print messages

log() {
  echo "[*] $1"
  echo "[*] $1" >> "$LOGFILE"
}

if ! command -v brew &>/dev/null; then 
  log "homebrew not found. installing..."
  /bin/bash -c 

