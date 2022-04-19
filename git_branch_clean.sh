#bin/bash
args=$1

function echo_help() {
  echo 'OVERVIEW: Delete merged branchs in git. (Default UnDeleted branch [master|main|develop|release])\n'
  
  echo 'USAGE: ./git_branch_clean --run\n'
  echo 'OPTIONS:'
  echo '\t--dry-run it does not delete brnaches when using this option'
  echo '\t-h, -help print help'
  #  TODO: Pass args to git branch names. These are do not delete.
  #   echo '\t-b <branch names>\t Pass <branch names> to git branch names. Separator is space.'
}

# TODO: Enable only if .git file exists.
if test "$args" == '--dry-run'; then
  delete_branchs=`git branch --merged | grep -wvE 'master|main|develop|release' | grep -v '*'`
  echo "Branches to be deleted: ${delete_branches}"
elif test "$args" == '-h' -o "$args" == '--help'; then
  echo_help
elif test "$args" == '--run'; then
  echo 'Delete under branchs.'
  delete_branchs=`git branch --merged | grep -wvE 'master|main|develop|release' | grep -v '*'`
  echo "${delete_branchs}" | xargs -I % git branch -d %
  exit
else
  echo 'Invalid option.'
  echo_help
fi