#! /bin/bash

SCRIPT_PATH=`dirname $0`
ABSOLUTE_PATH=`readlink -m ${SCRIPT_PATH}`

(
    cd $ABSOLUTE_PATH/../ &&
    ctags \
        --langdef=groovy \
        --langmap=groovy:.groovy \
        --regex-groovy='/^[ \t]*[(private|public|protected) ( \t)]*def[ \t]+([A-Za-z0-9_]+)[ \t]*\(/\1/f,function,functions/' \
        --regex-groovy='/^[ \t]*private def[ \t]+([A-Za-z0-9_]+)[ \t]*/\1/v,private,private variables/' \
        --regex-groovy='/^[ \t]*public def[ \t]+([A-Za-z0-9_]+)[ \t]*/\1/u,public,public variables/' \
        --regex-groovy='/^[ \t]*[abstract ( \t)]*[(private|public) ( \t)]*class[ \t]+([A-Za-z0-9_]+)[ \t]*/\1/c,class,classes/' \
        --regex-groovy='/^[ \t]*[abstract ( \t)]*[(private|public) ( \t)]*enum[ \t]+([A-Za-z0-9_]+)[ \t]*/\1/c,class,classes/' \
        -R ./
)
