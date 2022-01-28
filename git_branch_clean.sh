#bin/bash
args=$1
# TODO: Enable only if .git file exists.
if [ -z "$STRING" ]; then
  echo 'Delete under branchs.'
  delete_branchs=`git branch --merged | grep -wvE 'master|develop|release' | grep -v '*'`
  echo "${delete_branchs}" | xargs -I % git branch -d %
  exit
fi

if test $args == '-h' -o $args == '--help'; then
  echo 'OVERVIEW: Delete merged branchs in git. (Default UnDeleted branch [master|develop|release])\n'
  #  TODO: Pass args to git branch names. These are do not delete.
  echo 'USAGE: ./git_branch_clean\n'
#   echo 'OPTIONS:'
#   echo '\t-b <branch names>\t Pass <branch names> to git branch names. Separator is space.'
fi