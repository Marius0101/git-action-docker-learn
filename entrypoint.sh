#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

repo-token= $2


if [ "$GITHUB_EVENT_NAME" != "milestone" ]; then
    echo "::debug::The even name was '$GITHUB_EVENT_NAME'"
    exit 0 
fi

even_type = $(jq --raw-output .action $GITHUB_EVENT_PATH)
if [ $even_type != "closed"]; then
    echo "::debug::The event type was '$even_type'"
    exit 0 
fi
milestone_name = $(jq --raw-output .milestion.title $GITHUB_EVENT_PATH)

IFS='/' read owner repository <<< "$GITHUB_REPOSITORY"

release_url=$(dotnet gitreleasemanager create \
--milestone $milestone_name \
--targetcommitsh $GITHUB_SHA \
--token $repo_token \
--owner $owner \
--repository $repository)

if [$? -ne 0];then
    echo "::error::Failde to create the release draft"
    exit 1
fi

echo "::set-output name = release-url::$release_url"
exit 0

