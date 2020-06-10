#!/bin/bash

function handle_exit_code() 
{
  EXIT_CODE=$1
  if [[ $EXIT_CODE -gt 0 ]]; then
    echo "ERROR: $2 RC: $EXIT_CODE"
    exit $EXIT_CODE
  fi
}

command -v ruby > /dev/null
handle_exit_code $? "Ruby is not installed. Exiting."

echo 'Installing required gems...'
gem install bundler
handle_exit_code $? "Failed to install ruby gems."

bundle install
handle_exit_code $? "Bundler failed to install ruby gems."

echo 'Executing Test Kitchen (Shell)...'

# Test kitchen will look for a kitchen.yml file by default
# This isn't required if you just have one kitchen config file
export KITCHEN_YAML="kitchen.shell.yml"
kitchen test