#!/bin/sh -l

sh -c "echo $GITHUB_EVENT_NAME"
sh -c "cat $GITHUB_EVENT_PATH"
sh -c "cat /github/workflow/event.json"
sh -c "echo $*"