#! /bin/bash

SCRIPT_PATH=`dirname $0`
ABSOLUTE_PATH=`readlink -m ${SCRIPT_PATH}`

(
    cd $ABSOLUTE_PATH/../ &&
    ctags \
        --totals=yes \
        --tag-relative=yes \
        --regex-php='/^\s*trait\s+([a-z0_9_]+)/\1/t,traits/i' \
        --php-kinds=+cfit-v \
        --exclude=@./.ctags/.ctagsignore \
        -R \
        --languages=php ./[svt]*
)
