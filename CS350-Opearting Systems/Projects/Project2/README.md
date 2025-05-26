# **CS 350 Operating Systems, Spring 2024**

## **Programming Project 2 (PROJ2)**

**Out**: 03/05/2025, WED
**Due**: 03/30/2025, SUN 23:59:59

---

### **Overview**

There are two parts in this project: **coding** and **Q\&A**.

* In the **coding part**, you will:

  * Change the outcome of race conditions after `fork()` in xv6.
  * Implement a **stride scheduler** for xv6.

* In the **Q\&A part**, you will answer questions about **xv6 process scheduling**.

This is a **group project**. You may divide the tasks or collaborate fully, but **each member must submit their own code on Brightspace**.
This project is worth **5%** of the final grade.

---

## **1. Baseline Source Code**

Use the baseline code provided on Brightspace.
**Do not reuse your old xv6 code** from Project 1.
Extract and work with the new zip file provided for this project.

---

## **2. Process Scheduling in xv6 – Coding (70 points)**

### **2.1 Race Condition After `fork()` (20 points)**

#### **2.1.1 The Test Driver and Expected Output**

Use the test driver program `fork_rc_test.c`.

* The parent process repeatedly calls `fork()`.
* After each `fork()`:

  * Parent prints `"parent!"`
  * Child prints `"child!"` and exits

Usage:

```bash
$ fork_rc_test
Usage: fork_rc_test 0|1
```

* `0`: Parent is scheduled first (default behavior)
* `1`: Child is scheduled first (to be implemented)

**Expected Output for `fork_rc_test 0`**:

```
Setting parent as the fork winner ...
Trial 0: parent! child!
Trial 1: parent! child!
...
Trial 48: child! parent!
Trial 49: parent! child!
```

**Expected Output for `fork_rc_test 1`**:

```
Setting child as the fork winner ...
Trial 0: child! parent!
Trial 1: child! parent!
...
Trial 48: child! parent!
Trial 49: child! parent!
```

#### **2.1.2 What to Do**

1. Change the scheduler to favor the child after `fork()`.
2. Write a system call to control the scheduling policy.
3. Implement the wrapper in `user.h`:

```c
void fork_winner(int winner);
```

* `fork_winner(0)`: Parent-first (default)
* `fork_winner(1)`: Child-first (your implementation)

> **Note**: `fork_rc_test.c` includes a stub wrapper. **Comment it out** once your own is ready.

> **Tip**: The actual change to the race condition may require **< 3 lines of code**.

---

### **2.2 Stride Scheduling in xv6 (50 points)**

#### **2.3 Stride Scheduling Policy**

* Each process has:

  * **stride**
  * **pass**

* The system has `STRIDE_TOTAL_TICKETS = 100`.

**Ticket Distribution**:

```math
ticket_p = ⌊100 / N⌋
```

where `N` = # of RUNNING + RUNNABLE processes

* Reset `pass` values of all active processes after ticket reassignment.

**Stride Calculation**:

```math
stride_p = ⌊(100 * 10) / ticket_p⌋
```

**Scheduler Behavior**:

* Run the process with the lowest `pass`.
* After scheduling:

```math
pass_p = pass_p + stride_p
```

* If tie in `pass`, schedule process with the lowest PID.

**Key Note**: Higher tickets → smaller stride → more frequent scheduling, but **not starvation** (thanks to `pass` updates).

**Bonus**: A process can **transfer** its tickets to another process (like “niceness”).

---

#### **2.3.1 Test Driver and Cases**

Enable tracing with:

```c
void enable_sched_trace(int);
```

* `enable_sched_trace(1)` → trace on
* `enable_sched_trace(0)` → trace off

Use test program `schdtest.c`. There are **5 test cases**:

* **Test 1**: Round-robin with 3 children → 4 total processes scheduled evenly
* **Test 2**: Stride scheduler, 3 processes (33 tickets each) → round-robin behavior
* **Test 3**: Stride scheduler, test `transfer_tickets()` return values
* **Test 4**: Parent gives 75% tickets to child → child runs 3× more
* **Test 5**: Parent gives all but 1 ticket to child → child runs to completion before parent

---

### **2.4 What to Do**

#### (1) Allow setting the scheduling policy

* Write system call and wrapper:

```c
void set_sched(int);
```

* `0`: Default (RR), `1`: Stride

---

#### (2) Get number of tickets owned by a process

* Write system call and wrapper:

```c
int tickets_owned(int pid);
```

---

#### (3) Transfer tickets to another process

* Write system call and wrapper:

```c
int transfer_tickets(int pid, int tickets);
```

* Valid ranges:

  * `tickets >= 0`
  * `tickets <= ticket_p - 1`

* Return values:

  * Success → new number of tickets
  * `< 0` → error codes:

    * `-1`: Negative transfer
    * `-2`: Over-transfer
    * `-3`: Invalid PID

---

#### (4) Implement the stride scheduler

* Remove `STUB FUNCS` macro from `schdtest.c`
* Ensure **patch to avoid 100% CPU issue remains intact**

  > Otherwise, **-10 points**

---

## **3. Process Scheduling in xv6 – Q\&A (30 points)**

Answer the following in a PDF titled `xv6-sched-mechanisms.pdf` and submit to Brightspace:

* **Q1 (10 pts)**: Does xv6 use cooperative or non-cooperative scheduling? Show how it works in code.
* **Q2 (10 pts)**: Why does the parent usually run before the child after `fork()`? When does the child run first?
* **Q3 (10 pts)**: Show the code for context switching (saving/loading CPU registers), and explain how it’s reached.

---

## **4. Submit Your Work**

* Submit:

  * Zipped xv6 directory
  * `xv6-sched-mechanisms.pdf`
  * `PROJ2.txt`

In `PROJ2.txt`, include:

* Who did what
* Status of implementation
* Code explanations if unclear
* Test logs
* Any relevant notes for grading

**Tip**: Test thoroughly on **CS machines** before submitting.

---

## **5. Grading**

1. **Deadline**: Submission time in Brightspace determines late penalty
2. **Use proper xv6 code**:

   * Do **not** use unapproved source
   * Removing patch code = **100% CPU QEMU issue** → **-10 points**
3. **If code fails to compile/patch**:

   * TA tries fix (max 3 mins)
   * Fixable → **1%-10% off**
   * Otherwise → email or demo

     * Fixed → **11%-20% off**
     * No fix → **0 points**
4. **If behavior is incorrect**: Partial deduction based on issue severity
5. **Academic honesty**:

   * Code can be shared **only** within group
   * Violations = **0 points + report**

