# Automata Theory Project Set

This repository contains seven projects focused on simulating and constructing automata and Turing machines. Below are the descriptions for each project:

---

## Project 1 - Partial NFA Simulation

**Task**: Write a program (in Java, C, or C++) to simulate the execution of a **partial non-deterministic finite automaton** (NFA without ε-transitions) based on an input file and input string.  
Output `accept` or `reject` followed by the reachable states.

---

## Project 2 - Marble Game Simulation

**Task**: Write a **program** (Java, C, or C++) that simulates the marble game by tracking gate toggling and marble exits based on input strings.

---

## Project 3 - PDA for x#y#z#w with Inequality Conditions

**Task**: Construct a **PDA in JFLAP** that accepts strings of the form `x#y#z#w` where `x, y, z, w ∈ {0,1}⁺` satisfying at least one of:
- |x| ≠ |w| and |y| ≠ |z|
- |x| ≠ |w| and y ≠ z
- x ≠ w and |y| ≠ |z|
- x ≠ w and y ≠ z

---

## Project 4 - PDA for a#b with Matching and Non-Matching Indices

**Task**: Construct a **PDA in JFLAP** that accepts strings `a#b` where:
- `a ≠ b`
- There exists an index `i` such that `a[i] = b[i]`  
(Handle both |a| = |b| and |a| ≠ |b| cases.)

---

## Project 5 - Turing Machine for (01)^n 0^m 2^p with Constraints

**Task**: Construct a **deterministic, one-way infinite single-tape Turing machine** that accepts:
```
{ (01)^n 0^m 2^p | n, m, p ≥ 0, m < n, p ≤ n }
```
Constraints:
- No stay moves.
- No left-of-input assumptions.
- Only left or right moves allowed.

---

## Project 6 - Turing Machine for Counting and Divisibility Conditions

**Task**: Construct a **deterministic, one-way infinite single-tape Turing machine** that accepts:
```
{ w ∈ {a, b, c}* | (#a ≥ #c) ∧ (#b divides #c) ∧ (#c divides #a) }
```
Constraints:
- No stay moves.
- No left-of-input assumptions.
- Only left or right moves allowed.

---

## Project 7 - Binary Real Number Addition via Turing Machine

Construct a deterministic, one-way infinite single-tape Turing machine in JFLAP that adds two binary real numbers of the form X#Y, where X and Y contain fractional parts (e.g., 101.101#11.01). The machine must handle alignment of decimal points, perform carry-aware binary addition, and format the result to remove invalid leading/trailing zeros.
