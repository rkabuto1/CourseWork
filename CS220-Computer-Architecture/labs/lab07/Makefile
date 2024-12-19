CC = gcc
CFLAGS = -Wall -std=c18 -ggdb
KEYTEST1 = testKey
KEYTEST2 = AAAA
KEYTEST3 = whatsup

test: test1 test2 test3

test1: test1_decode.txt test1_decode_bad.txt
	@echo "Comparing test1_decode.txt to original"
	diff -i test1_decode.txt test1.txt
	@echo "Comparing test1_decode_bad.txt to original (expect miscompares)"
	-diff -i test1_decode_bad.txt test1.txt

test1_decode.txt: decode checkASCII test1_encode.txt
	@echo "Creating test1_decode.txt"
	./decode $(KEYTEST1) < test1_encode.txt > test1_decode.txt
	./checkASCII < test1_decode.txt

test1_decode_bad.txt: decode test1_encode.txt
	@echo "Creating test1_decode.txt"
	./decode $(KEYTEST2) < test1_encode.txt > test1_decode_bad.txt

test1_encode.txt: encode checkASCII test1.txt
	@echo "Creating test1_encode.txt"
	./encode $(KEYTEST1) < test1.txt > test1_encode.txt
	./checkASCII < test1_encode.txt

test2: test2_decode.txt test2_decode_bad.txt
	@echo "Comparing test2_decode.txt to original"
	diff -i test2_decode.txt test2.txt
	@echo "Comparing test2_decode_bad.txt to original (expect miscompares)"
	-diff -i test2_decode_bad.txt test2.txt

test2_decode.txt: decode checkASCII test2_encode.txt
	@echo "Creating test2_decode.txt"
	./decode $(KEYTEST1) < test2_encode.txt > test2_decode.txt
	./checkASCII < test2_decode.txt

test2_decode_bad.txt: decode test2_encode.txt
	@echo "Creating test2_decode.txt"
	./decode $(KEYTEST3) < test2_encode.txt > test2_decode_bad.txt

test2_encode.txt: encode checkASCII test2.txt
	@echo "Creating test2_encode.txt"
	./encode $(KEYTEST1) < test2.txt > test2_encode.txt
	./checkASCII < test2_encode.txt

test3: test3_decode.txt test3_decode_bad.txt
	@echo "Comparing test3_decode.txt to original"
	diff -i test3_decode.txt test3.txt
	@echo "Comparing test3_decode_bad.txt to original (expect miscompares)"
	-diff -i test3_decode_bad.txt test3.txt

test3_decode.txt: decode checkASCII test3_encode.txt
	@echo "Creating test3_decode.txt"
	./decode $(KEYTEST1) < test3_encode.txt > test3_decode.txt
	./checkASCII < test3_decode.txt

test3_decode_bad.txt: decode test3_encode.txt
	@echo "Creating test3_decode_bad.txt"
	./decode $(KEYTEST3) < test3_encode.txt > test3_decode_bad.txt  


test3_encode.txt: encode checkASCII test3.txt
	@echo "Creating test3_encode.txt"
	./encode $(KEYTEST1) < test3.txt > test3_encode.txt
	./checkASCII < test3_encode.txt

clean:
	-rm test1_encode.txt test1_decode.txt test1_decode_bad.txt
	-rm test2_encode.txt test2_decode.txt test2_decode_bad.txt
	-rm test3_encode.txt test3_decode.txt test3_decode_bad.txt
	-rm decode encode checkASCII

