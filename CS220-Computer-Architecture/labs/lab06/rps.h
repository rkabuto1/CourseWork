#ifndef RPS_H
#define RPS_H

// Define rps as a type that can be Rock, Paper, Scissors, or Unknown
typedef enum {
	Rock,
	Paper,
	Scissors,
	Unknown
} rps;

// Define winner as a type that can be Player1, Player2, or Tie
typedef enum {
	Player1,
	Player2,
	Tie
} winner;

// Define player as a pointer to a player_ function
typedef rps (*player)(int round,rps * myhist,rps * opphist);

// Externally available functions
void register_player(player p,char *p_name);
winner eval_round(rps p1, rps p2);
winner print_round(rps p1,rps p2,char *p1_name,char *p2_name);
void print_winner(winner result,char *p1_name,int p1_score,char *p2_name,int p2_score);
char * fmt_rps(rps c);
void registerPlayers(void);

#endif
