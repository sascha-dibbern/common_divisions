#!/usr/bin/bash

quicksync-common_divisions.sh; cf-agent -d -v -K -D common_divisions:DEBUG -l ~/.cfagent/inputs/common_divisions/tools/appmap/test-promises.cf | tee out.txt | grep 'R:' | more
