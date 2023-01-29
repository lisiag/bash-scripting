#! /usr/bin/bash

# echo "hello bash script" > file.txt

# cat > file.txt

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

echo $1 $2 # print param 1 and 2
echo $0 # print the script name'

args=($@) # collect args passed in script call into an array'
# args=($2) # collect the 2nd arg passed in script call into an array

# echo ${args[0]} ${args[1]}
echo $@ # print array of args passed
