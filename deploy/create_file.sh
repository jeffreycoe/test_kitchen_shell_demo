#!/bin/bash

function handle_exit_code() 
{
  EXIT_CODE=$1
  if [[ $EXIT_CODE -gt 0 ]]; then
    echo "ERROR: $2 RC: $EXIT_CODE"
    exit $EXIT_CODE
  fi
}

TEST_DIR=/tmp/test_deploy
TEST_FILE=$TEST_DIR/test_config.yml

echo "Creating test directory $TEST_DIR..."
mkdir -p $TEST_DIR 
handle_exit_code $? 'Error creating directory.'

echo "Creating test file $TEST_FILE..."
touch $TEST_FILE
handle_exit_code $? 'Error creating test config file.'
