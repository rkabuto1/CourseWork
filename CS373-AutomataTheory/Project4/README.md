# Project 4 - Automatic Zoom (PDA for Partial String Equality)

## Overview
For this project, you are required to **construct a PDA** (Pushdown Automaton) that accepts the language:

```
{ a#b | a, b ∈ {x,y}* such that a ≠ b and ai = bi for some i, 1 ≤ i ≤ min(|a|, |b|) }
```

Supported platforms: Must be usable in **JFLAP 7.1**.

---

## Language Requirements

- Input is guaranteed to be **valid** (exactly one '#' symbol).
- Both `a` and `b` are strings over `{x, y}`.

Acceptance conditions:
- `a` and `b` are **not equal** overall.
- There exists some index `i` where `a[i] = b[i]`.

---

## PDA Construction Notes

- Your PDA **must be nondeterministic**.
- Two main cases:
  1. **|a| = |b|**:
     - Find an index `i` where `ai = bi` and an index `j` where `aj ≠ bj`.
     - Strategy: Store positions using the stack; encode the previous input symbols in the states.
  2. **|a| ≠ |b|**:
     - Only need to find an index `i` where `ai = bi` (length inequality already guarantees a ≠ b).

Design considerations:
- Example PDA (instructor's version):
  - ~31 states.
  - Split between handling |a| = |b| and |a| ≠ |b|.
- Input strings can be up to **80 symbols** long.

Memory tips:
- Default Java heap: 64MB (should be sufficient).
- If needed, launch JFLAP with more memory:
  ```
  java -Xmx500m -classpath JFLAP.jar JFLAP
  ```

---

## Submission Requirements

- Upload your **JFLAP file (.jff)** on **Brightspace**.
- **Filename format**: `<lastname>_p4.jff`
  - Example: `garrison_p4.jff`
- Submission Deadline: **3/26 at 11:59:59 PM**

---

## Grading

- Based on correct acceptance/rejection behavior across provided test strings.
- Efficiency (in number of states and memory usage) will be informally considered.

---
