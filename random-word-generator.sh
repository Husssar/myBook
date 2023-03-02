#!/bin/bash

# Random Word Generator 
# linuxconfig.org 
 
#if [ $# -ne 1 ] 
#then 
#echo "Please specify how many random words would you like to generate !" 1>&2 
#echo "example: ./random-word-generator 3" 1>&2 
#echo "This will generate 3 random words" 1>&2 
#exit 0
#fi 
 
# Constants 
X=0
ALL_NON_RANDOM_WORDS=/usr/share/dict/words
 
# total number of non-random words available 
non_random_words=`cat $ALL_NON_RANDOM_WORDS | wc -l` 
 
# while loop to generate random words  
# number of random generated words depends on supplied argument 
random_word=""
while [ "$X" -lt "3" ] 
do 
random_number=`od -N3 -An -i /dev/urandom | 
awk -v f=0 -v r="$non_random_words" '{printf "%i\n", f + r * $1 / 16777216}'` 
sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS 
if [ -z $random_word ]; then
	random_word=$(sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS)
elif [ ${#random_word} -ge 7 ]; then
	n=${#random_word}
	random_word=$random_word"-"$n"-"$(sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS)
elif [ ${#random_word} -gt 20 ]; then
	random_word=$random_word"-"$s"-"$(sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS)
else
	random_word=$random_word"-"$(sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS)
fi
  let "X = X + 1" 
done

	if [ ${#random_word} -gt 30 ]; then
		s="#!"
	else
		s="%&!"
	fi
random_word=$s+$random_word
echo $random_word
echo $random_word | shasum
