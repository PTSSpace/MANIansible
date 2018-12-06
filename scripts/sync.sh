#!/bin/bash
function transfer {
  rsync -r --delete $1 $2
}

function fsw {
  transfer "$@"

  fswatch --event Updated --event Removed --event Created --event MovedFrom --event MovedTo  -x -0 $1 | while read -d "" event ; do
    transfer "$@"
  done
}

function inotify {
  transfer "$@"

  while inotifywait -q -e modify -e move -e create -e delete "$1" ; do
    transfer "$@"
  done
}

if [[ "$#" -ne 2 ]]; then 
  echo "This script watches for changes and automatically rsyncs them to a remote server."
  echo ""
  echo "Usage: $0 <dir> <remoteDir>"
  echo "Example: $0 src ubuntu@10.0.0.1:catkin_ws"

  exit 1
fi

if ! hash rsync 2> /dev/null ; then
  echo "rsync is required for this script to work"
  exit 1
fi

if hash inotifywait 2> /dev/null ; then
  inotify "$@"
  exit 0
fi

if hash fswatch 2> /dev/null  ; then
  fsw "$@"
  exit 0
fi

echo "fswatch or inotifywait are required for this script to work"
exit 1

