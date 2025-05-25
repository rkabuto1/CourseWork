# Project 5 - Automatic Zoom (Deterministic Turing Machine)

## Overview
For this project, you are required to **construct a deterministic, one-way infinite, single-tape Turing machine** that accepts the language:

```
{ (01)^n 0^m 2^p | n, m, p ≥ 0, m < n, p ≤ n }
```

Supported platforms: Must be created and tested in **JFLAP 7.1**.

---

## Language Requirements

- Input strings must consist of:
  - `n` repetitions of `01`
  - Followed by `m` copies of `0`
  - Followed by `p` copies of `2`
- Constraints:
  - `m < n`
  - `p ≤ n`

---

## Turing Machine Construction Notes

- **Deterministic**: No nondeterminism allowed.
- **One-way infinite tape**: Cannot use blank spaces left of input.
- **Transitions**:
  - Each transition must **move either left or right**.
  - Each transition must **read a single symbol** and **write a single symbol**.
  - **No stay transitions** allowed.
  - **No block transitions** allowed.

Rejecting inputs:
- In JFLAP 7.1:
  - You can either create a "trap" state with no outgoing transitions.
  - Or simply omit invalid transitions (causing the machine to reject automatically).

State size guidance:
- Example machine (for a similar problem) had about **28 states** (inefficient but functional).

---

## Submission Requirements

- Upload your **JFLAP file (.jff)** on **Brightspace**.
- **Filename format**: `<lastname>_p5.jff`
  - Example: `garrison_p5.jff`
- Submission Deadline: **4/7 at 11:59:59 PM**

---

## Grading

- Based on correct acceptance/rejection behavior for test cases.
- Following all constraints regarding deterministic behavior, tape usage, and transition format is critical.

---
## Picture of My Implementation
<img width="1146" alt="Screenshot 2025-05-25 at 2 07 21 PM" src="https://github.com/user-attachments/assets/0cb92553-f125-4d76-aee0-25b201f2bc8e" />
