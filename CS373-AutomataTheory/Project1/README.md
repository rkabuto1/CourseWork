# Project 1 - Automatic Zoom

## Overview
This project simulates the execution of a **partial non-deterministic finite automaton (NFA)** (partial meaning no ε-transitions).

The program:
- Reads the NFA definition from a **tab-delimited file** (first command-line argument).
- Simulates the NFA running on a given **input string** (second command-line argument).
- Outputs the result to **standard output**.

Supported languages: **Java**, **C**, or **C++**  
Platform: Must be compilable and executable on Linux/Mac systems such as **remote.cs.binghamton.edu** or machines in **EB-G7**.

---

## Input Format

- **State definitions** (tab-delimited):
  ```
  state x start
  state x accept
  state x acceptstart
  state x start accept
  ```
  where `x` is an integer between 0 and 1000.

- States that are neither start nor accept states will not have a state line.

- **Transition definitions** (tab-delimited):
  ```
  transition p x q
  ```
  where:
  - `p` and `q` are states [0, 1000]
  - `x` is a symbol (lowercase letter `a`–`z` or digit `0`–`9`)

- Up to 100,000 transitions are possible.

---

## Execution Instructions

The program should be compiled and run as follows:

- **Java**:
  ```
  javac <lastname>_p1.java
  java <lastname>_p1 <inputfile> <inputstring>
  ```
- **C/C++**:
  - Use a `Makefile` to generate an executable named `<lastname>_p1`.
  - Run:
  ```
  make <lastname>_p1
  ./<lastname>_p1 <inputfile> <inputstring>
  ```

---

## Output Format

- If the automaton can end in an accept state:
  ```
  accept <list of accept states>\n
  ```
- If it cannot:
  ```
  reject <list of reachable states>\n
  ```

- States should be space-separated and listed **only once** each (order does not matter).
- Output must end with a **newline character**.

---

## Notes

- Initial state is the specified start state, **not necessarily state 0**.
- No transitions available for a given state/input symbol cause the branch to terminate.
- Non-determinism means multiple possible next states are possible for a given input symbol.

---

## Submission Requirements

- Upload source file(s) **(no tar, zip, rar, or jar files)**.
- Main file must be named:
  - Java: `<lastname>_p1.java`
  - C/C++ executable: `<lastname>_p1`
- If using C/C++, include a `Makefile` if necessary.
- Submit on **Brightspace** by **2/9 at 11:59:59 PM**.

---

## Grading Breakdown

- **20%**: Following instructions (filename, compilation method, etc.)
- **80%**: Correct results on test automata and strings

---
