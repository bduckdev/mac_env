#!/bin/sh

if [ ! $(pgrep "spotifyd") ]; then
	/home/bduck/GitHubApps/spotifyd/target/release/spotifyd
fi

echo "hi mom"

/home/bduck/.cargo/bin/spt
