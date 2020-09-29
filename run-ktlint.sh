#!/usr/bin/env sh
mkdir -p .cache
cd .cache
if [ ! -f ktlint ]
then
    curl -sSLO https://github.com/shyiko/ktlint/releases/download/0.39.0/ktlint
    chmod 755 ktlint
fi
cd ..

changed_kotlin_files=$(git diff --cached --name-only origin/develop | grep ".*kt$" )
echo $changed_kotlin_files
.cache/ktlint -F $changed_kotlin_files
