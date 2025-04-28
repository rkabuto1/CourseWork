# Project 3 - Automatic Zoom (PDA for Unequal Strings)

## Overview
For this project, you are required to **construct a PDA** (Pushdown Automaton) that accepts the language:

```
{ x#y#z#w | x, y, z, w ∈ {0,1}⁺ with x ≠ w and y ≠ z }
```

Supported platforms: Must be usable in **JFLAP 7.1**.

---

## Language Requirements

- The input string is guaranteed to be **valid** (exactly three '#' symbols).
- Each section (`x`, `y`, `z`, and `w`) is a **non-empty string** over `{0,1}`.

Acceptance conditions (any of the following):
- |x| ≠ |w| **and** |y| ≠ |z|
- |x| ≠ |w| **and** y ≠ z
- x ≠ w **and** |y| ≠ |z|
- x ≠ w **and** y ≠ z

---

## PDA Construction Notes

- Your PDA **must be nondeterministic** to correctly accept the language.
- Based on the class discussion of **Problem 2.22** (PDA for {x#y | x ≠ y}).

Design considerations:
- Avoid excessive use of ε,ε → ε transitions to conserve memory.
- Must be able to handle input strings up to around **170 symbols** long with reasonable memory usage.
- Memory tips:
  - Default Java memory is 64MB.
  - If needed, you can launch JFLAP with more memory:
    ```
    java -Xmx2G -jar JFLAP7.1.jar
    ```

---

## PDA Specifications

- Example sizes:
  - Simple PDA: ~46 states (separate accept states per path).
  - More efficient PDA: ~20 states (more clever stack usage).

---

## Submission Requirements

- Upload your **JFLAP file (.jff)** on **Brightspace**.
- **Filename format**: `<lastname>_p3.jff`
  - Example: `garrison_p3.jff`
- Submission Deadline: **3/19 at 11:59:59 PM**

---

## Grading

- Based on correct acceptance/rejection of test strings.
- Efficiency and stack usage will be informally considered for complex cases.

---
