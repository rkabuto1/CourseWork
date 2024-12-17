
# Project 1

The goal of this project is to measure the effectiveness of several branch direction predictors on a number of traces of conditional branch instructions. Each trace contains a large number of branch instructions. Each line in the trace contains the following information for each branch: the program counter (expressed as a word address), the actual outcome of the branch. Several trace files are provided for evaluating your predictor designs.

## Overview
The goal is to write a program in C++ that would use these traces to measure the accuracy of various dynamic branch predictors that you studied in class. The branch outcomes from the trace file should be used to train your predictors. You will need to present results for each trace separately, details of what exactly needs to be submitted are provided below. Note that we also have a secret trace that will be used to assess the correctness of your code.

## Predictors to Implement

- **Always Taken** [5%]
- **Always Non-Taken** [5%]
- **Bimodal Predictor with a single bit of history** [10%]  
  - Table sizes: 4, 8, 32, 64, 256, 1024, 4096 entries.  
  - Initial state of all prediction counters is "Non-Taken" (N).
  
- **Bimodal Predictor with 2-bit saturating counters** [20%]  
  - Same table sizes as above.
  - Initial state of all prediction counters is "Strongly Non-Taken" (NN).
    
 <img width="612" alt="Screenshot 2024-12-16 at 6 29 35 PM" src="https://github.com/user-attachments/assets/2e330477-0286-484b-8310-ade34e9bb86c" />

  

- **Bimodal Predictor with 3-bit counters** [20%]  
  - State machine with six states. Predictions in states 1, 2, and 3 are "Taken", and in states 4, 5, and 6 are "Not-Taken".  
  - Start in state 1 (the top left-most state).  
  - Same table sizes as above.

- **Gshare Predictor** [20%]  
  - The PC is XOR-ed with the global history bits to generate the index into the predictor table.  
  - Fixed table size: 4096 entries.  
  - Vary the history length from 2 bits to 12 bits in 1-bit increments.  
  - Assume that the initial state of all prediction counters is "Strongly Not Taken" (NN).

- **Tournament Predictor** [20%]  
  - Selects between Gshare and bimodal predictor for every branch.  
  - Configure Gshare with 4096-entry table and 12 bits of global history, and configure bimodal predictor with a 4096-entry table.  
  - Initialize the global history register with all zeroes.

## Materials on BrightSpace
There is a tar/gzipped archive of materials called `project1.tar.gz` on BrightSpace that contains the following:

- A sample output file called `sample_output.txt`, complete with comments.
- A directory called `examples`, containing code that shows how to read the input.
- A directory called `traces`, containing the following 6 trace files:
  - `long_trace1.txt` (15 million branch instructions)
  - `long_trace2.txt` (20 million branch instructions)
  - `long_trace3.txt` (25 million branch instructions)
  - `short_trace1.txt` (2 million branch instructions)
  - `short_trace2.txt` (3 million branch instructions)
  - `short_trace3.txt` (4 million branch instructions)
- A directory called `correct_outputs`, containing correct outputs for the given traces.

To access these materials, download a copy of `project1.tar.gz` from BrightSpace, `cd` into the directory where you placed the tar/gzipped archive and issue the command:
```bash
tar -xzvf project1.tar.gz
```
This will create a new directory (named `project1`) containing the files mentioned above.

## Submission Requirements
- Submit your source code so it can be compiled and tested for correctness.
- The code should compile into a single executable called `predictors` with a simple `make` command.  
  Projects that fail to compile will result in a zero grade.
  
- The executable should run all of the predictors on the given trace, specified via command line options:
```bash
./predictors input_trace.txt output.txt
```

The output file should have the following format:

```
#,@;
#,@;
#,@; #,@; #,@; #,@; #,@; #,@;
#,@; #,@; #,@; #,@; #,@; #,@; #,@;
#,@; #,@; #,@; #,@; #,@; #,@; #,@;
#,@; #,@; #,@; #,@; #,@; #,@; #,@; #,@; #,@; #,@; #,@;
#,@;
```

Where each:
- `#` corresponds to the number of correct predictions made by each of the predictors.
- `@` corresponds to the number of branches.

### Format
1. **First line**: Number of correct predictions for the always taken predictor.
2. **Second line**: Number of correct predictions for the always non-taken predictor.
3. **Third line**: Number of correct predictions for all seven variations of the bimodal predictor with a single bit of history.
4. **Fourth line**: Number of correct predictions for the two-bit saturating counter based bimodal predictor.
5. **Fifth line**: Number of correct predictions for the three-bit counter based bimodal predictor.
6. **Sixth line**: Number of correct predictions for the 11 variations of Gshare predictor.
7. **Seventh line**: Number of correct predictions for the tournament predictor.

The number of correct predictions and branches should be separated by a comma. Each configuration of predictor should be separated by a semicolon (`;`) and a space.


## Example) Correct Ouput Of My Program running it through short_trace1.txt

2107011,3771697;<br>
1664686,3771697;<br>
2495049,3771697; 2625117,3771697; 2619554,3771697; 2641583,3771697; 2712362,3771697; 2780277,3771697; 2810576,3771697;<br>
2441125,3771697; 2608962,3771697; 2689120,3771697; 2763581,3771697; 2957490,3771697; 3128006,3771697; 3184251,3771697;<br>
2507015,3771697; 2653971,3771697; 2706892,3771697; 2783313,3771697; 2947324,3771697; 3112245,3771697; 3167602,3771697;<br>
3318362,3771697; 3308166,3771697; 3327661,3771697; 3321176,3771697; 3269236,3771697; 3262228,3771697; 3241329,3771697; 3239522,3771697; 3209284,3771697; 3185915,3771697; 3159753,3771697;<br>
3324767,3771697;<br>

