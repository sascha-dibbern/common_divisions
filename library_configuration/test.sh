quicksync-common_divisions.sh; cf-agent -d -v -K -D common_divisions:DEBUG -l ~/.cfagent/inputs/common_divisions/library_configuration/test-promises.cf | tee ../out.txt | grep 'R:' | more
