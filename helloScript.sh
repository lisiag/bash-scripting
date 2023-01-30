#! /usr/bin/bash

# echo "hello bash script" > file.txt

# cat > file.txt

# heredoc - how to pass a multiline block to a command
: 'cat <<EOF
This is my signature:
Nga mihi
Lisia
EOF

count=11

if [ $count -eq 22 ]
then
    echo "The condition is true"
else
    echo "The condition is false"
fi

if (( $count < 22 ))
then
    echo "The condition is true"
else
    echo "The condition is false"
fi

if [ "$count" -lt 22 ] && [ $count -gt 1 ]
then
    echo "using &&"
fi

echo "Which color do you like best?"
echo "1 - Blue"
echo "2 - Red"
echo "3 - Yellow"
echo "4 - Green"
echo "5 - Orange"
read color;
case $color in
  1) echo "Blue is a primary color.";;
  2) echo "Red is a primary color.";;
  3) echo "Yellow is a primary color.";;
  4) echo "Green is a secondary color.";;
  5) echo "Orange is a secondary color.";;
  *) echo "This color is not available. Please choose a different one.";;
esac


number=1
while [ $number -lt 10 ]
do
      echo $number
      number=$(( number+1 ))
done

number=1
until [ $number -gt 10 ]
do
      echo $number
      number=$(( number+1 ))
done


for i in 1 2 3 4 5
do
    echo $i
done

for i in {0..20} # inclusive
do
    echo $i
done

for i in {0..20..2} # with increment
do
    echo $i
done

for (( i = 0; i < 5; ++i ))
do
    if [ $i -eq 3 ]
    then
       break
    fi
    echo $i
done

for (( i = 0; i < 5; ++i ))
do
    if [ $i -eq 3 ]
    then
       continue
    fi
    echo $i
done

echo $1 $2 # print arg 1 and 2
echo $0 # print the script name


echo $@ # print array of args passed
echo $# # print number of args passed


args=($@) # collect args passed in script call into an array
# args=($2) # collect the 2nd arg passed in script call into an array

echo ${args[0]} ${args[1]}


while read line
do
    echo $line
done < ${1:-/dev/stdin} # echos each line of file passed as arg or if no arg takes stdin and echos each line


# 1 represents standard output, 2 represents standard error
# ls -al 1>file1.txt 2>file2.txt # no error
# ls +al 1>file1.txt 2>file2.txt # error
# ls -al >file1.txt # writes stdout to file1.txt, prints stderr in terminal as usual
# ls al >& file1.txt # writes both to file1.txt
ls -al >file1.txt 2>&1 # writes both to file1.txt

MESSAGE="Hello from helloScript"
export MESSAGE
./secondScript.sh


echo "Enter a string"
read str1

echo "Enter another string"
read str2

if [ $str1 == $str2 ]
then
    echo "Strings match"
elif [ $str1 \< $str2 ] # length is shorter
then
     echo "$str1 is shorter than $str2"
else
    echo "Strings do not match"
fi


str1="string1"
str2="string2"
joined=$str1$str2
echo $joined
echo ${str1^} # capitalise
echo ${str1^^} # uppercase

els="laaalaal"
echo ${els^a} # capitalise if the first letter is "a"

echo $(( 21 / 3 ))
echo $(expr 6 \* 4) # asterisk for multiplication must be escaped


echo "obase=10; ibase=16; FFFF" | bc # pipe to bc calculater that output should be base 10, input is base 16 (hex) and the number to convert


declare -r pwdfile=passwd # declare readonly var
echo $pwdfile


# arrays
cars=("Tesla" "Leaf" "Smartmotion")
echo $cars # Tesla
echo ${cars[@]} # whole array
echo "${cars[1]}" # Leaf
echo "${!cars[@]}" # indices

for car in ${cars[@]}; do
  echo $car
done

unset cars[1] # delete item from array
echo ${cars[@]}
echo ${#cars[@]}

cars[1]="Shoes"
echo ${cars[@]}'


function myFunc()
{
    echo "Double $1 is"
    echo $(($1 * 2))
}

myFunc 3
myFunc 7

# local vars are added globally when function is called
function myFunc2()
{
    myVar1="inside"
    myVar2="inside as well"
}

myVar2="outside"
echo $myVar2 # outside
myFunc2
echo $myVar1 # inside
echo $myVar2 # inside as well
