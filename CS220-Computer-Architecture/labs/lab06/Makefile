CC = gcc
CFLAGS = -Wall -std=c18 -ggdb
PLAYERS=$(wildcard  player_*.c) 

test: rps
	./rps | tee tourney_results.txt

testMatch : rps 
	./rps paper random
	
rps : rps.c rps.h $(PLAYERS) pool.c pool.h  registerPlayers.c
	${CC}  ${CFLAGS} -o rps rps.c registerPlayers.c pool.c $(PLAYERS)
	
registerPlayers.c : makeRegisterPlayers.py $(PLAYERS)
	python3 ./makeRegisterPlayers.py $(PLAYERS) >registerPlayers.c
	
clean:
	rm rps tourney_results.txt registerPlayers.c
