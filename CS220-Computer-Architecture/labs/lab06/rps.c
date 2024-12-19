#include "rps.h"
#include "pool.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <assert.h>

/*-----------------------------------------------------------------------------
	Defines for rph
-----------------------------------------------------------------------------*/
#define GAMES 50
#define MAXPLAYERS 1000

/*-----------------------------------------------------------------------------
	local typedefs
-----------------------------------------------------------------------------*/
typedef struct {
	player p;
	char * p_name;
	int lost;
} register_entry;

/*-----------------------------------------------------------------------------
	Global Variables
-----------------------------------------------------------------------------*/
register_entry p_register[MAXPLAYERS];
int num_reg=0;
int last_winner=-1;

/*-----------------------------------------------------------------------------
	Internal Function Declarations
-----------------------------------------------------------------------------*/
void tournament(void);
int match(int p1,int p2,int verbose);
int pick_player(char * pname);
// player next_unbeaten(void);
// char * unbeaten_name(void);
void player_lost(char *pname);
int numPlayers();
player get_player(int pi);
char * get_player_name(int pi);

/*-----------------------------------------------------------------------------
	Main function
-----------------------------------------------------------------------------*/
int main(int argc,char **argv) {

	registerPlayers();
	time_t t;
	srand((unsigned) time(&t)); /* Intializes random number generator */
	if (argc==1) {
		tournament();
	} else if (argc == 3) {
		int p1,p2;

		p1=pick_player(argv[1]);
		p2=pick_player(argv[2]);
		match(p1,p2,1);
	} else {
		printf("Unexpected command line arguments\n");
		printf("Invoke as %s to run a tournament\n",argv[0]);
		printf("Or invoke as %s <player1> <player2> to run a match\n",argv[0]);
		return 1;
	}
	return 0;
}
/*-----------------------------------------------------------------------------
	Externally available functions defined in rps.h
-----------------------------------------------------------------------------*/
void register_player(player p,char *p_name) {
	assert(num_reg<MAXPLAYERS);
	p_register[num_reg].p=p;
	p_register[num_reg].p_name=p_name;
	p_register[num_reg].lost=0;
	num_reg++;
}

winner eval_round(rps p1, rps p2) {
	if ((p1==Unknown) && (p2 == Unknown)) return Tie;
	if (p1==Unknown) return Player2;
	if (p2==Unknown) return Player1;

	if (p1==p2) return Tie;
	if (p1==Rock && p2==Scissors) return Player1;
	if (p1==Scissors && p2==Paper) return Player1;
	if (p1==Paper && p2==Rock) return Player1;
	return Player2;
}

winner print_round(rps p1, rps p2, char * p1_name, char * p2_name) {
	if (p1_name !=NULL) {
		printf("Rock/Paper/Scissors... %s vs. %s ",fmt_rps(p1),fmt_rps(p2));
	}
	winner whoWon=eval_round(p1,p2);
	if (p1_name != NULL)  {
		print_winner(whoWon,p1_name,-1,p2_name,-1);
	}
	return whoWon;
}

void print_winner(winner result,char * p1_name,int p1_score,char *p2_name,int p2_score) {
	switch(result) {
		case Player1 : printf("%s won ",p1_name);
			break;
		case Player2 : printf("%s won ",p2_name);
			break;
		default : printf("%s and %s tied ",p1_name,p2_name);
	}
	if (p1_score>=0) printf("%s score: %3d %s score: %3d",p1_name,p1_score,p2_name,p2_score);
	printf("\n");
	return;
}

char * fmt_rps(rps c) {
	switch(c) {
		case Rock : return "Rock";
		case Paper : return "Paper";
		case Scissors : return "Scissors";
		default : return "Unknown";
	}
	return "Unknown";
}


/*-----------------------------------------------------------------------------
	Internal Function Definitions
-----------------------------------------------------------------------------*/
void tournament(void) {

	pool wp=allEntries(num_reg);
	pool nwp=newPool();
	pool lp=newPool();
	pool nlp=newPool();
	int tier=1;

	while(numPool(wp)+numPool(lp)>1) { // Enough players to do another tier

		if (numPool(wp)==1 && numPool(lp)==1) {
			printf("\n========== Championship Match! ==============\n");
			int p1=getPool(wp);
			int p2=getPool(lp);
			int winner=match(p1,p2,0);
			if (winner==p1) { addPool(nwp,p1); }
			else if (winner==p2) {
				addPool(nlp,p2);
				addPool(nlp,p1);
			}
		} else {
			printf("\n============= Starting tier %d =============\n",tier);
			if (numPool(wp)>0) {
				printf("-------------------- Winners Bracket ----------------------\n");
				while(numPool(wp)>1) { // Enough players to do another match
					int p1=getPool(wp);
					int p2=getPool(wp);
					int winner=match(p1,p2,0);
					if (winner == -1) {
						printf("Arbitrarilly putting %s into losers bracket\n",get_player_name(p2));
						addPool(nwp,p1);
						addPool(nlp,p2);
					} else {
						addPool(nwp,winner);
						if (winner==p1) addPool(nlp,p2);
						else addPool(nlp,p1);
					}
				}
				if (spPool(wp)) {
					int bye=getPool(wp);
					printf("  Player %s got a bye into the next tier\n",get_player_name(bye));
					addPool(nwp,bye);
				}
			}
			if (numPool(lp)>0) {
				printf("--------------------- Losers Bracket ------------------------------\n");
				while(numPool(lp)>1) { // Enough players to do another match
					int p1=getPool(lp);
					int p2=getPool(lp);
					int winner=match(p1,p2,0);
					if (winner == -1) {
						printf("Arbitrarilly eliminating %s to avoid endless loops\n",get_player_name(p2));
						addPool(nlp,p1);
					} else {
						addPool(nlp,winner);
						if (winner==p1) printf("Eliminating %s after two losses\n",get_player_name(p2));
						else printf("Eliminating %s after two losses\n",get_player_name(p1));
					}
				}
				if (spPool(lp)) {
					int bye=getPool(lp);
					printf("  Player %s got a bye into the next tier\n",get_player_name(bye));
					addPool(nlp,bye);
				}
			}

			printf("============= Finished tier %d =============\n",tier);
			tier++;
		}
		freePool(wp);
		freePool(lp);
		wp=nwp;
		nwp=newPool();
		lp=nlp;
		nlp=newPool();
	}

	if (spPool(wp)) {
		int twinner=getPool(wp);
		printf("\nWinner and unbeaten champion: %s!!!\n",get_player_name(twinner));
	} else if (spPool(lp)) {
		int twinner=getPool(lp);
		printf("\nWinner after a long hard fight: %s\n",get_player_name(twinner));
	} else {
		printf("No winner?????\n");
	}

	freePool(wp);
	freePool(nwp);
	freePool(lp);
	freePool(nlp);
}

int match(int p1,int p2,int verbose) {

	player p1_guess=get_player(p1);
	char *p1_name=get_player_name(p1);
	player p2_guess=get_player(p2);
	char *p2_name=get_player_name(p2);

	rps myhist[GAMES];
	rps opphist[GAMES];
	int myscore=0;
	int oppscore=0;
	int game=0;
	int bet=1;

	printf("Playing %s against %s ...\n",p1_name,p2_name);

	for(game=0;game<GAMES;game++) {
		myhist[game]=Unknown;
		opphist[game]=Unknown;
	}
	myscore=0;
	oppscore=0;

	for(game=0;game<GAMES;game++) {
		rps p1g=p1_guess(game,myhist,opphist);
		rps p2g=p2_guess(game,opphist,myhist);
		myhist[game]=p1g;
		opphist[game]=p2g;
		winner result;
		if (verbose) printf("Round %2d bet=%d : ",game,bet);
		// if (verbose)  result=eval_round(p1g,p2g,p1_name,p2_name);
		if (verbose) result=print_round(p1g,p2g,p1_name,p2_name);
		else result=eval_round(p1g,p2g);
		if (result==Player1) {
			myscore+=bet;
			bet=1;
		} else if (result==Player2) {
			oppscore+=bet;
			bet=1;
		} else bet = bet * 2;
		if (verbose) print_winner(result,p1_name,myscore,p2_name,oppscore);
	}

	printf("  %s score is %d, %s score is %d ...",p1_name,myscore,p2_name,oppscore);

	if (myscore==oppscore) {
		printf("It's a tie!\n");
		return -1;
	}
	else if (myscore > oppscore) {
		printf("%s Won!!!!\n",p1_name);
		player_lost(p2_name);
		return p1;
	} else {
		printf("%s Won!!!\n",p2_name);
		return p2;
		player_lost(p1_name);
	}
	return -1;
}



int pick_player(char * pname) {
	int i;
	for (i=0; i<num_reg; i++) {
		if (0==strcmp(pname,p_register[i].p_name)) return i;
	}
	printf("Unrecognized player... %s\n",pname);
	exit(0);
}

/* player next_unbeaten(void) {
	last_winner++;
	while (last_winner<num_reg) {
		if (p_register[last_winner].lost==0) return p_register[last_winner].p;
		last_winner++;
	}
	last_winner=-1;
	return NULL; // Indicate end of round, and reset for next round
} */

/* char * unbeaten_name(void) {
	if (last_winner==-1) return "";
	return p_register[last_winner].p_name;
} */


void player_lost(char *pname) {
	int i;
	for (i=0; i<num_reg; i++) {
		if (0==strcmp(pname,p_register[i].p_name)) {
			p_register[i].lost++;
			return;
		}
	}
	printf("Unrecognized player... %s\n",pname);
	exit(0);
}

int numPlayers() { return num_reg; }

player get_player(int pi) { return p_register[pi].p; }
char * get_player_name(int pi) { return p_register[pi].p_name; }
