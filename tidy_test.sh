#!bin/sh
testdata_dir_name='tidy_testdata'
now_dir=`pwd`
file_basename=('test' 'te st')
IFS=$','
file_extname=('.png' '.txt' '' '.log' '.jpeg' '.abc' '.jp g' '.jpg')


main() {
  echo '---- Execute Test ----'
  precheck
  echo '---- Generate Test Data ----'
  generate_testdata
  echo '---- Execute Command ----'
  cd $testdata_dir_name
  sh ${now_dir}/tidy.sh
  echo '---- Check TestData ----'
  check_valid_data
}

precheck() {
  printf "\tPreCheck..."
  if [ -f 'tidy.sh' ]; then
    echo "\tOK!"
  else
    echo 'Fail.'
    echo "Error: Don't find tidy.sh."
    exit
  fi

}

generate_testdata(){

  if [ -d $testdata_dir_name ]; then
    \rm -r $testdata_dir_name
  fi
  mkdir $testdata_dir_name

  for e in ${file_basename[@]}; do
    for e2 in ${file_extname[@]}; do
      filename="${file_basename[$i]}${file_extname[$j]}"
      touch "${testdata_dir_name}/${filename}"
      echo "\tCreate file: ${filename}"
      let j++
    done
    j=0
    let i++
  done
}

check_valid_data(){
  if [ ! -d 'Extend' ]; then echo "\tFail! Don't find Extend Directory."; exit; fi
  cd Extend
  
  for e in ${file_extname[@]}; do
    filename="${file_basename}${file_extname[$i]}"
    dir_name=`echo $file_extname | tr -d '.'`
    if [ ! -d $dir_name ]; then echo "\tFail! Don't find ${dir_name} Directory."; exit; fi
    let i++
  done
  echo "\tSuccess!"
}

main
