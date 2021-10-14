#!/bin/bash

set -e

echo -e "Publishing maven release...\n"

mvn versions:set -DnewVersion=${1:?release version}
GPG_TTY=$(tty) JAVA_HOME=$(/usr/libexec/java_home -v 11) \
  mvn clean verify gpg:sign install:install deploy:deploy

echo -e "Published maven snapshot"
