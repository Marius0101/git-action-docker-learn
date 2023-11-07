#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

if [ "$GITHUB_EVENT_NAME" != "milestone" ]; then
    echo "::debug::The even name was '$GITHUB_EVENT_NAME'"
    exit 0 
fi

even_type = $(jq --raw-output .action $GITHUB_EVENT_PATH)
if [ $even_type != "closed"]; then
    echo "::debug::The even type was '$even_type'"
    exit 0 
fi
milestone_name = $(jq --raw-output .milestion.title $GITHUB_EVENT_PATH)

