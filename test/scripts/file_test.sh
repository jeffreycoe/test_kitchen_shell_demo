#!/bin/bash

TEST_DIR=/tmp/test_deploy
TEST_FILE=$TEST_DIR/test_config.yml

function handle_exit_code() 
{
  EXIT_CODE=$1
  if [[ $EXIT_CODE -gt 0 ]]; then
    echo "ERROR: $2 RC: $EXIT_CODE"
    exit $EXIT_CODE
  fi
}

if [[ -d $TEST_DIR ]]; then
  echo 'Directory exists!'
else
  handle_exit_code $? 'Directory does not exist!'
fi

if [[ -f $TEST_FILE ]]; then
  echo 'File exists!'
else
  handle_exit_code $? 'File did not exist!'
fi
