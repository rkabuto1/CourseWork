# Project 2 - Automatic Zoom (Marble Game Simulation)

## Overview
For this project, you have two options:
1. **Construct a DFA** using JFLAP that simulates the marble game.
2. **Write an application** in **C, C++, or Java** that simulates the marble game operation.

Supported platforms: Must be compilable and executable on Linux/Mac systems such as **remote.cs.binghamton.edu** or machines in **EB-G7**.

---

## Marble Game Description

- **Input alphabet**: {0, 1}
- A marble is dropped down chute **A**.
- If the last marble exits chute **B** or **D**, you **win**.
- If the last marble exits chute **C** or **E**, you **lose**.

**Gate Behavior**:
- **Gates**: X1, X2, X3, X4
- Initially, all gates are set to **left**.
- Every time a marble touches a gate, the gate **toggles** its direction.
- **Gate X1** (special rules):
  - On input `0`: Toggles **Left → Right → Center → Left → ...**
  - On input `1`: Toggles **Left → Center → Right → Left → ...**
- **Gates X2, X3, X4**:
  - Toggle between **Left ↔ Right**.

The marble goes in the direction the gate **was set to prior** to being toggled.

---

## Programming Option (C, C++, Java)

- Program input:
  1. **Gate directions** (initial configuration, usually "LLLL")
  2. **Input string** (sequence of '0' and '1')
- Program output:
  - The sequence of **gate configurations** after each marble.
  - The final **chute** that the marble exits (B, C, D, or E).

Example traces:

| Initial Gates | Input String | Trace | Final Exit |
|:--------------|:-------------|:------|:-----------|
| LLLL          | 0000          | LLLL → RRLL → CRLR → LRRR → RLRR | C |
| LLLL          | 1111          | LLLL → CRLL → RRR L→ LRRR → CLRR | C |
| LLLL          | 01010101      | LLLL → RRLL → LRLR → RLLR → LLLL → ... | E |
| LLLL          | 10101010      | LLLL → CRLL → LRRL → CLRL → LLLL → ... | D |

---

## DFA Option (JFLAP)

- Construct a DFA that **accepts** strings leading to **winning** outcomes (B or D) and **rejects** strings leading to **losing** outcomes (C or E).
- Max DFA size:
  - 48 states total (24 accept, 24 reject).
  - Only 36 states are reachable (18 accept, 18 reject).

---

## Submission Requirements

- Upload source file(s) (no tar, zip, rar, or jar files).
- **Filename format**:
  - Java: `<lastname>_p2.java`
  - C/C++ executable: `<lastname>_p2`
  - JFLAP file: `<lastname>_p2.jff`
- Include a `Makefile` if needed (for C or C++).
- Submit on **Brightspace** by **2/21 at 11:59:59 PM**.

---

## Grading

- Based on the **percentage of correct results** for a set of test strings.
- Correct output and following the filename/instruction conventions are critical.

---
