#! /usr/bin/python3

import sys
import re
print("#include \"rps.h\" // for register_player");
args = sys.argv
args.pop(0)
for arg in args: 
	qname=re.match("player_(.*).c",arg)
	if not qname :
		print(" // invalid player name: ",arg)
		continue
	# Get here if its a valid player name
	# rps player_rock(int round,rps *myhist,rps *opphist)
	print("rps player_"+qname[1],"(int round,rps *myhist,rps *opphist);")
	
print("void registerPlayers(void) {")	
for arg in args : 
	# print("arg=",arg)
	qname=re.match("player_(.*).c",arg)
	if not qname :
		print(" // invalid player name: ",arg)
		continue
	# Get here if its a valid player name
	print("   register_player(","player_"+qname[1],",","\""+qname[1]+"\"",");")
print("}")
