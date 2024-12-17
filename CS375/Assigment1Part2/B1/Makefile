COMPILER := g++
FLAGS := -std=c++11 -Wall
EXE := submission
SRC := MainB1.cpp B1.cpp
OBJ := $(SRC:.cpp=.o)
INFILE := inputFile.txt
OUTFILE := outputFile.txt

.PHONY: default build run clean

default: build

build: $(EXE)

$(EXE): $(OBJ)
	$(COMPILER) $(FLAGS) -o $(EXE) $(OBJ)

%.o: %.cpp
	$(COMPILER) $(FLAGS) -c $<

run: build
	./$(EXE) $(INFILE) $(OUTFILE)

clean:
	rm -f $(OBJ) $(EXE) $(OUTFILE)


