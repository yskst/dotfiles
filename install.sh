#!/bin/bash

cpflags='-f -v -r'

scpdir=`dirname $0`
dotfs=`find $scpdir | egrep -v '\.$|\.git/|\.git$|\.gitignore$|~$'`
cp $cpflags $dotfs ~/

echo "Set up neobundle"
curl -s https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh 2>&1 >/dev/null
