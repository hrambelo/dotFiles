#!/bin/bash
# Indique au système que l'argument qui suit est le programme utilisé pour exécuter ce fichier
# En règle générale, les "#" servent à mettre en commentaire le texte qui suit comme ici

GIT_REPOS_REGEX=$1
GIT_COMMAND=$2

echo $GIT_REPOS_REGEX
echo $GIT_COMMAND

[ "$GIT_REPOS_REGEX" = "" ] && echo "No repos to incept" && exit 1
[ "$GIT_COMMAND" = "" ] && echo "No inception command" && exit 1


rootdir=`pwd`
  for d in `find -maxdepth 1 -type d -name "*$GIT_REPOS_REGEX*"`; do
        echo -e "processing \e[34m$rootdir/$d\e[39m";
    cd $rootdir/$d
    git $GIT_COMMAND;
 done
 cd $rootdir

