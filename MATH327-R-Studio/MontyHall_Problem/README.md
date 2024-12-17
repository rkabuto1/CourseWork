# The Monty Hall Problem Simulation

### Question 3

The Monty Hall problem: if you are on a game show, and you are given a chance to pick one of three doors. Behind one of the doors is a car and the rest are empty. If you randomly pick one door, and the host, who knows where the car is located, will open an empty door out of the two doors not picked.

#### A) What is the probability that the door you pick will be a winning door before the host reveals a door?

#### B) If you are offered a chance to switch your selection after the host reveals a door, should you take it?

#### C) What is the probability of winning after switching?

---

### Instructions

To calculate the probabilities, you will perform a lot of experiments/simulations. Each experiment involves:
1. Assigning the car randomly to one of the doors.
2. Picking one door.
3. The host reveals one of the empty doors not picked.

You then calculate:
- The probability of the car being behind the initially picked door.
- The probability of winning if you **switch** your choice.
- The probability of winning if you **do not switch** your choice.

---

### Running the Code

Run the `monty_hall_simulation.r` file in any R environment to simulate and calculate the probabilities.

---

### Results

The script compares simulated results to the theoretical results:
- Probability of winning if you switch: **2/3** (theoretical).
- Probability of winning if you do not switch: **1/3** (theoretical).

The program outputs the simulated probabilities alongside the theoretical values.
