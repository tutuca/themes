#!/bin/bash

DMENU='dmenu -i -b -fn Iconsolata-11 -nb #303030 -nf #909090 -sb #909090 -sf #303030'

# Global variables:
TERM="xterm"
CACHE="${XDG_CACHE_HOME:-"$HOME/.cache"}"
test -d "$CACHE/dmenu" || mkdir -p "$CACHE/dmenu"
CACHE+="/dmenu/dmenu-cache"


function dmenu-path {

    IFS=:

    uptodate() {
        test -f "$CACHE" &&
        for dir in $PATH
        do
            test ! $dir -nt "$CACHE" || return 1
        done
    }

    if ! uptodate
    then
    for dir in $PATH
    do
        cd "$dir" &&
        for file in *
        do
            test -x "$file" && echo "$file"
        done
    done | sort | uniq > "$CACHE".$$ &&
    mv "$CACHE".$$ "$CACHE"
    fi

    cat "$CACHE"
}

touch $CACHE
MOST_USED=$(sort $CACHE | uniq -c | sort -r | colrm 1 8)
RUN=$((echo "$MOST_USED"; dmenu-path | grep -vxF "$MOST_USED") | $DMENU) &&
(echo $RUN; head -n 99 $CACHE) > $CACHE.$$ &&
mv $CACHE.$$ $CACHE

case $RUN in
    *\;) exec $(echo $TERM ${RUN/;/});;
    *)   exec $RUN;;
esac
