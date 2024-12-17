#!/bin/bash

echo testing $1
javac $1_p2.java

#Setup test input files
INPUT=test_input_files/
TXT_IN=${INPUT}/txt
BIN_IN=${INPUT}/bin

#Setup the student output files
OUTPUT=student_output_files/
TXT_OUT=${OUTPUT}/b2t
BIN_OUT=${OUTPUT}/t2b

mkdir -p $TXT_OUT
mkdir -p $BIN_OUT

#Test text to binary (t2b)
java -Xmx2G $1_p2 	t 	${TXT_IN}/01.txt 	${BIN_OUT}/$1_01.bin
java -Xmx2G $1_p2 	t 	${TXT_IN}/02.txt 	${BIN_OUT}/$1_02.bin
java -Xmx2G $1_p2 	t 	${TXT_IN}/03.txt 	${BIN_OUT}/$1_03.bin
java -Xmx2G $1_p2 	t 	${TXT_IN}/04.txt 	${BIN_OUT}/$1_04.bin
java -Xmx2G $1_p2 	t 	${TXT_IN}/05.txt 	${BIN_OUT}/$1_05.bin
java -Xmx2G $1_p2 	t 	${TXT_IN}/06.txt 	${BIN_OUT}/$1_06.bin
java -Xmx2G $1_p2 	t 	${TXT_IN}/07.txt 	${BIN_OUT}/$1_07.bin
java -Xmx2G $1_p2 	t 	${TXT_IN}/08.txt 	${BIN_OUT}/$1_08.bin
java -Xmx2G $1_p2 	t 	${TXT_IN}/09.txt 	${BIN_OUT}/$1_09.bin

#Test binary to text (b2t)
java -Xmx2G $1_p2 	b 	${BIN_IN}/01.bin 	${TXT_OUT}/$1_01.txt
java -Xmx2G $1_p2 	b 	${BIN_IN}/02.bin 	${TXT_OUT}/$1_02.txt
java -Xmx2G $1_p2 	b 	${BIN_IN}/03.bin 	${TXT_OUT}/$1_03.txt
java -Xmx2G $1_p2 	b 	${BIN_IN}/04.bin 	${TXT_OUT}/$1_04.txt
java -Xmx2G $1_p2 	b 	${BIN_IN}/05.bin 	${TXT_OUT}/$1_05.txt
java -Xmx2G $1_p2 	b 	${BIN_IN}/06.bin 	${TXT_OUT}/$1_06.txt
java -Xmx2G $1_p2 	b 	${BIN_IN}/07.bin 	${TXT_OUT}/$1_07.txt
java -Xmx2G $1_p2 	b 	${BIN_IN}/08.bin 	${TXT_OUT}/$1_08.txt
java -Xmx2G $1_p2 	b 	${BIN_IN}/09.bin 	${TXT_OUT}/$1_09.txt

#Check the results
javac checkresults.java
java -Xmx2G checkresults $1

