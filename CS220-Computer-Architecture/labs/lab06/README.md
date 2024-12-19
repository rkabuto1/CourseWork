# Lab06 - Rock/Paper/Scissors Tournament

## Lab Goals

This lab will look backwards at an area of C which we didn't go into much detail in the last section - enumerated types in C.

Almost all of the code is provided for you, so you don't really need to learn a lot about enumerations. If you want to read up on enumerations, see the [Wikipedia Enumerated Type](https://en.wikipedia.org/wiki/Enumerated_type#C) article, or here is a tutorial on C enumerations: [Simplilearn.com enum in C](https://www.simplilearn.com/tutorials/c-tutorial/enum-in-c).

But most of all, this lab is intended to be fun and show how we can take a simple child's game and do some pretty sophisticated programming.

## BackGround - The Ancient Game

![rockPaper](https://github.com/Binghamton-CS140-B1-Fall-2018/images/blob/master/rockpaper.jpg)

Many of us have played the child's game of "Rock/Paper/Scissors". For complete details and a history of the game, see [Wikipedia Rock-paper-scissors](https://en.wikipedia.org/wiki/Rock%E2%80%93paper%E2%80%93scissors).

The basics are as follows... for each round, each player chooses either rock, paper, or scissors. If both players choose the same object, the round is a tie - nobody wins. If one player chooses rock, and the other scissors, the rock breaks the scissors, and the rock player wins. Scissors cuts paper, and paper wraps up rock, so scissors beats paper, and paper beats rock.

A game consists of multiple rounds - in our case, a game will consist of 50 rounds. The reason to play multiple rounds is to try to determine your opponent's strategy, and come up with a strategy that will consistently beat your opponent.

## Background - The CS-220 Rock/Paper/Scissors Infrastructure

We will be using an infrastructure to play the Rock Paper Scissors game on the computer that has been used for many semesters with different groups of CS-220 students.

You need to write the code for a Rock Paper Scissors player, a function that will be called for each round of a match against an opponent. Your code can see all choices from previous rounds for both you and your opponent. Your code needs to choose either rock, paper, or scissors for the next round. You will be playing against an opponent player who also chooses either rock, paper, or scissors for that round. We keep track of who wins each round, and the player who wins the most rounds wins the match.

Then, we take each student's player function, and run a double-elimination tournament to find out who is the best Rock Paper Scissors player in this class.

I've kept previous student's player functions as well so we can also run a "best of all time" tournament to find out who has the best RPS player function of all time!

### A Rock/Paper/Scissor Player Function

For this lab, you will need to write a C function that plays the Rock Paper Scissors game. Just like a real player, your function needs to decide, for each round, whether to choose Rock, Paper, or Scissors. Your function will have access to all the choices you made and the choices your opponent made in the previous rounds.

We model this with a "player" function that has the following declaration:

```c
rps player_XXX(int round, rps * myhist, rps * opphist);
```

Your function will get called by the infrastructure 50 times. Your function will play against an opponent's player function who is also choosing Rock, Paper, or Scissors.

### Player Function Parameters and Return Value

The return type from a player function is a type named `rps` which can have one of four values... `Rock`, `Paper`, `Scissors`, or `Unknown`.  A variable of type `rps` must have one of those four values. For instance, you can declare a variable like `rps guess;`, and then assign a value like `guess=Paper;`, or check the value of guess as in `if (guess==Scissors)...` The rps type is an enumeration defined in file rps.h.

The parameters to the player function are used to convey information about which round of the match you are currently working on, and, for all but the very first round of the match, what happened in previous matches.

- The `round` parameter indicates the current round number in the match. For the first round, the round number is 0, the second round is round 1, and so on, up to the last round which is round 49.

- The `myhist` parameter is a pointer to an array of the values you chose in previous rounds. You can think of this as a one dimensional array, where `myhist[i]` contains the choice you made for round `i`. Obviously, the `myhist` parameter only contains information for previous rounds, which means that `i` is valid only when `0<=i<round`.

- The `opphist` parameter is a pointer to an array of the values your opponent chose in previous rounds. You can think of this as a one dimensional array, where `opphist[i]` contains the choice your opponent made for round `i`. Obviously, the `opphist` parameter only contains information for previous rounds, which means that `i` is valid only when `0<=i<round`.

The player function can look at the previous rounds using the `myhist` and/or `opphist` variables plus whatever other information you want to keep track of as the game progresses, to choose the best (most likely to win) option for the current round.

### Match Scoring

For the first round of the match, the bet on that round will be one point. If one player wins, that player gets the bet and the other player gets zero. If both players guess the same thing (for example, both choose Rock), then the bet doubles, and the next round is played. After a win, the bet reverts to a single point.

If the last round is a tie, then the infrastructure randomly chooses a winner between the two players so that a match is very unlikely to end in a tie.

The player with the most points at the end of a match wins the match.

### Naming and Packaging your Player Function

To keep things unique, please name your player function starting with your bmail userid. We need to keep all player functions using unique names to run our tournament, and the convention of using your bmail userid keeps your player function distinct from all other student's player functions. You may add a suffix onto your bmail userid if you want to (for example) make multiple player functions.

Your player function must be enclosed in a C file with the same name as the player function.  You may include other functions in that file, global variables, and include library functions in your file. (You will definitely need to include rpsh.h.) But the most important thing in the file is the player function itself.

For example, if your bmail userid was `tbarten1` then you might write a player function called `player_tbarten1_dontlose`, and put it into file `player_tbarten1_dontlose.c`.

### Utility Functions Provided For You

I have provided a couple of functions that you may want to use in your player functions. Whether you use these or not is up to you. These functions are declared in `rps.h`.

- `winner eval_round(rps p1, rps p2)`: This is a function, which takes two rps values as the first two arguments, and determines which is the winner based on the values. The `winner` enumerated type can have values `Player1`, `Player2`, or `Tie`.

- `winner print_round(rps p1, rps p2, char * p1_name,int p1_score, char * p2_name,int p2_score)`: This function is very similar to `eval_round` in that it determines the winner of the round, but it also prints much more information about the round. If you specify scores of `-1` then score values will not be printed. Use this to debug your code, but please do not use it when you submit your code. We don't have room in a tournament to see lots of extra messages, so these will have to be removed and cost points!

- `char * fmt_rps(rps c)` : This is a function which returns the string that describes the rps value: "Rock", "Paper", "Scissors" or "Unknown". Again, use this for debug, but don't print these values out in your submitted code.

### A Rock/Paper/Scissors Computer Tournament

A tournament consists of playing multiple matches, matching players against each other trying to find the best player.

The infrastructure provided runs a "dual elimination" tournament. In a dual elimination tournament, there are two "brackets"; a "winners bracket" that consists of players who have one every match they have been in, and a "losers bracket" that consists of players who have won all but one of the matches they have been in.

In the beginning of the tournament, all players start in the winners bracket.

In each round of the tournament, players in the winners bracket are randomly matched against other players in the winners bracket. If there are an odd number of players in the winners bracket, the last player gets a "bye" (a free win). All the winners of their match in this round stay in the winners bracket, but the losers move to the loser's bracket. Thus, in each round, the number of players in the winners bracket is divided in half.

In each round, all players in the losers bracket are also matched against each other. Again, if there are an odd number of players, one player gets a bye. In these losers bracket matches, if you win, you stay in the losers bracket. If you lose, you are eliminated from the tournament. Thus, in each round, the number of players in the losers bracket is divided in half, but the losers from the winners bracket are added in, so the losers bracket is usually larger than the winners bracket.

At the end of the tournament, the last two players in the tournament will play against each other to determine the overall match winner. (The last two players might both be in the winners bracket, the losers bracket, or one in the winners bracket and one in the losers bracket.)

### Tournament Registration

In this lab, I have provided code for you that contains the "main" function to run either a match, or an entire tournament of Rock Paper Scissors play.

However, in order for these functions to work, the infrastructure needs to have a function pointer to each player's player function, as well as the name of that player. The infrastructure collects this information using a python script called `makeRegisterPlayers.py`. The Makefile gets a list of all player_*name*.c files in the current directory, and passes that to the `makeRegisterPlayers.py` script, which uses that information to write a file called `registerPlayers.c`. The `registerPlayers.c` file contains a function called `registerPlayers` that registers all the player functions.

### Player Functions Provided to You

I have provided a few very simple player functions to get things started, as follows:

- **player_paper.c** - A player function and registration for a player that chooses paper for every round in a match.
- **player_rock.c** - A player function and registration for a player that chooses rock for every round in a match.
- **player_scissors.c** - A player function and registration for a player that chooses scissors for every round in a match.
- **player_random.c** - A player function and registration for a player which chooses rock, paper or scissors completely at random, with no regard to previous choices.

### Running Rock/Paper/Scissors Games

The infrastructure builds an executable called `rps` that can be used to either run a match between any two valid players, or to run an entire tournament. 

To run a match between two valid players, run:

`./rps <player1> <player2>` 

This runs a 50 round match between the player name specified in player1 and the player name specified in player2, and report on the final score of the match. For example, you can run

`./rps paper scissors`

and discover that scissors beats paper fifty times in a row.

The capability to run a match allows you to debug your player function.

If you run the rps executable with no parameters, such as:

`./rps`

...then you will play a Rock/Paper/Scissors tournament using all registered players (in other words, every player function in a file `player_XXX.c` in the current directory.)

While you are working on the lab, this gives you a chance to see how you run against the standard players I have provided (player_rock, player_paper, player_scissors, and player_random), which can help you debug, but it's not much fun.

The fun part comes after the lab, when I collect player functions from all the students and make a tournament from those results!

## Provided Code

Your lab06 repository will contain several files, as follows:

- **rps.h** and **rps.c** - A header file and C file that contains the rock/paper/scissors infrastructure. You may not change these files.

- **pool.h** and **pool.c** - A header and C file that contain functions to deal with pools of players (to support a tournament). You should not need to use any of these functions.

- **Makefile** - A make file to build and run the rock/paper/scissors executable. This file defines some global variables as well as several targets, as follows:

  - `test` - Runs a tournament and saves the results in a file called **tourney.txt** as well as printing them to the screen.
  
  - `testMatch` - Runs `./rps paper random` to run a round between the paper player and the random player.

  - `rps` - Creates the `rps` executable file.

  - `registerPlayers.c` - Makes the registerPlayers.c file using the `makeRegisterPlayers.py` script. If you get an error saying `./makeRegisterPlayers.py not found`, you may need to run the command `chmod +x makeRegisterPlayers.py`. We also assume that you have python3 installed on your system in /usr/bin/python3.
  
  - `clean` - Removed all the files created by this Makefile.

## Doing the Lab

Run `make testMatch` to build the simplest code. You should see the invocation of the ./rps executable with parameters paper and random.

Look at, for example, player_rock.c to see how the player_rock function is implemented and registered.

Run `./rps scissors paper` to run a match between a player that always chooses scissors and a player that always chooses paper.

Run `./rps rock rock` to see what happens for a tie.

Run `./rps rock random` several times. Take a look at player_random.c to see how it works.

Next, design and code your own player_*userid* function by editing the player_*userid[_suffix]*.c file in your directory.

Here are the steps...

1. Edit your player_&lt;userid&gt;.c file.
2. Copy the lines from player_rock.c into your player_&lt;userid&gt;.c file
3. Change the name of the player function in the file from player_rock to player_&lt;userid&gt;, for instance, player_tbarten1.
4. Figure out a strategy for playing a rock-paper-scissors match, and replace the code "return Rock;" with a C implementation of that strategy. Your strategy can use myhist and opphist, but it should *not* return a random result. There must be some logic to determine what choice to make.

If you want to write multiple player functions to try different strategies, feel free to do so. Just make sure each one starts with your bmail ID, and has a unique suffix.

You may want to change the Makefile `testMatch` rules to play your code against player_random or player_rock to debug your player. To do this, edit the recipe from `./rps paper random` to something like `./rps rock tbarten1`.

## Tournament Rules

1. Your function is **not** allowed to change the random number seed.

2. Your function may not change any values in the myhist and opphist arrays.

3. You may not modify or override any functions used by the infrastructure. (Students in the past have tried to cheat by creating their own version of the eval_round function, or even coding their own rand function. This will be checked and disallowed.)

4. You may print debug information from your player function while you are writing and testing it, but when you are finished, *please remove all the printf statements or invocations of functions that cause the player function to print something out*. Since we are going to run you against hundreds of other students, extra debug info is a humongous waste of disk space, and may get you eliminated from the tournament.

## Hints on Writing your player function

- If you want to remember something between calls to your player function, you must declare a variable as static or use a global variable (which are static by default). For instance, if I want to keep track of the number of times I chose "Rock" without looking at myhist, I could define `n_rock` as a static variable and use it as follows:

```c
static int n_rock=0;
...
if (next_rps==Rock) n_rock++;
...
return next_rps;
```

- You may wish to determine, for previous rounds, which player function "won" the round in your player function. You may use the "eval_round" function declared in rps.h and defined in rps.c.

## Submitting your Player

When you are satisfied with your player function, you need to do a `git add player_XXX.c` (where XXX is your player function name that starts with your bmail ID). Then commit your changes, push the results, and paste the resulting hash code on Brightspace.

The professor will then create and run two tournaments during the next lecture. The first tournament will be a tournament between all players in this year's CS-220 class. The second tournament will be the grand tournament between all students from this semester **and** students from previous semesters.

By default, all valid submissions will be kept in the "alumni" library, and used in future semesters. If you would like to be excluded from the alumni library, please let the professor know.

## Grading your Results

This lab submission is worth 10 points, and in general, you get 10 points for submitting any viable player function. Deductions will occur for the following reasons:

- -2 for every 24 hours your are late. Furthermore, you will not be included in the tournaments.
- -3 for submissions that do not follow the required format, or violate the tournament rules (e.g. reseed the random number generator, or override existing infrastructure functions.)
- -6 if there are compiler errors when compiling round, match, or tourney.
- -3 if your code does not run to completion during an execution of rps for a match, or tournament.
- -2 if there are any compiler warning messages issued when compiling your code.
- -2 if your function prints out any extra messages during execution.
- -1 if your repository contains any executable code.

All deductions will be canceled if you reach the final round of either this year's tournament, or the grand tournament.
