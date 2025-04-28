# Project 6 - Automatic Zoom (Deterministic Turing Machine for Counting Conditions)

## Overview
For this project, you are required to **construct a deterministic, one-way infinite, single-tape Turing machine** that accepts the language:

```
{ w ∈ {a, b, c}* | (#a ≥ #c) ∧ (#b divides #c) ∧ (#c divides #a) }
```

Supported platforms: Must be created and tested in **JFLAP 7.1**.

---

## Language Requirements

- The string must satisfy **all three conditions**:
  1. The number of `a`s is **greater than or equal to** the number of `c`s.
  2. The number of `b`s **divides** the number of `c`s.
  3. The number of `c`s **divides** the number of `a`s.

---

## Turing Machine Construction Notes

- **Deterministic**: No nondeterminism allowed.
- **One-way infinite tape**: Cannot use blank spaces left of input.
- **Transitions**:
  - Each transition must **move either left or right**.
  - **No stay transitions**.
  - **No block transitions**.

Rejecting inputs:
- In JFLAP 7.1:
  - Either use a "trap" state with no outgoing transitions, or
  - Leave invalid transitions undefined.

Instructor's implementation:
- ~30 states total (including 3 reject states, one for each condition).
- Could reduce state count by removing explicit reject states.

---

## Suggested Implementation Steps

1. **Insert a `$` marker** at the start of the input (5 states).
   - If no `a`s are found, **reject**.
2. **Verify** `#a ≥ #c` (6 states).
   - If not, **reject**.
3. **Rewind** and **unmark**, checking for presence of `b`s (2 states).
   - If no `b`s are found, **reject**.
4. **Verify** `#b divides #c` (7 states).
   - If not, **reject**.
5. **Rewind** and **unmark**, checking for presence of `c`s (2 states).
   - If no `c`s are found, **reject**.
6. **Verify** `#c divides #a` (7 states).
   - If not, **reject**.
7. **Accept** (1 state).

---

## Submission Requirements

- Upload your **JFLAP file (.jff)** on **Brightspace**.
- **Filename format**: `<lastname>_p6.jff`
  - Example: `garrison_p6.jff`
- Submission Deadline: **4/14 at 11:59:59 PM**

---

## Grading

- Based on correct acceptance/rejection behavior for test cases.
- Following all tape, movement, and transition format constraints is critical.

---
