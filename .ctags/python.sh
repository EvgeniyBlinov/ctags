#! /bin/bash

SCRIPT_PATH=`dirname $0`
ABSOLUTE_PATH=`readlink -m ${SCRIPT_PATH}`

(
    cd $ABSOLUTE_PATH/../ &&
    ctags \
        --fields=+l \
        --languages=python \
        --python-kinds=-iv \
        -f ./.tags \
        -R \
        ./.python/lib/
)
