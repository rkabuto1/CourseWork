# **CS 350 Operating Systems – Consolidated Project Summary (Spring 2025)**

## **Overview**

Throughout the semester, students completed **three progressive system-level programming projects** on the xv6 operating system. The projects emphasized practical OS internals including system calls, scheduling policies, race conditions, and user-level shell functionality.

These group-based assignments were designed to:

* Deepen understanding of **process control**, **scheduling**, and **system call mechanisms**
* Strengthen skills in **multi-process programming**, **file I/O**, and **shell design**
* Explore **synchronization**, **resource management**, and **custom kernel extensions**

Each student was responsible for implementing system-level functionality, writing wrapper functions, debugging user/kernel transitions, and submitting individual code to Brightspace.

---

## **Project 1 – Custom System Calls & Shutdown Support (6.25%)**

**Goal**: Learn how **system calls are implemented** and invoked in xv6.

### **Main Tasks**:

* Implement a new **`shutdown`** system call to power off the xv6 system.
* Implement **1 of 4 optional system calls** (per group member):

  * `shutdown2`, `exit2`, `mkdir2`, `uptime2`
* Optionally implement a **custom system call** for extra credit (+5 pts)
* Understand system call interfaces and internal kernel mechanisms

### **Technical Concepts**:

* System call registration
* User-space wrappers
* Inline assembly shutdown
* Process arguments and return values

### **Points Breakdown**:

* `shutdown` system call: 20 pts
* Additional system call: 40 pts
* Q\&A on syscall implementation: 40 pts
  **Total**: 100 points

---

## **Project 2 – Stride Scheduler & Fork Race Control (5%)**

**Goal**: Implement a **custom process scheduler (stride scheduling)** and control **race behavior after `fork()`**.

### **Main Tasks**:

* Implement a system call that controls fork race winner (`parent` or `child`)
* Develop a **stride scheduler** with:

  * Ticket allocation
  * Stride and pass calculation
  * Fair process selection
* Add system calls to:

  * Set scheduler type (`RR` or `stride`)
  * Transfer tickets
  * Query ticket ownership

### **Test Cases**:

* Parent-first vs. Child-first race (via `fork_rc_test`)
* Scheduling fairness with different ticket weights
* Handling edge cases like ticket overflows or invalid PIDs

### **Technical Concepts**:

* Proportional share scheduling
* System-wide fairness guarantees
* Context switching and reallocation
* Scheduler tracing via system calls

### **Points Breakdown**:

* Fork race control system call: 20 pts
* Stride scheduler and ticket system: 50 pts
* Q\&A on context switching & scheduler logic: 30 pts
  **Total**: 100 points

---

## **Project 3 – Full Shell Implementation (6.25%)**

**Goal**: Build a user-level **UNIX-style shell** using xv6 process APIs and parser code.

### **Main Tasks**:

Implement a shell (`sh.c`) with support for:

1. **Multiple commands per line** (`;`) – 10 pts
2. **Command pipelines** (`|`) – 25 pts
3. **I/O redirection** (`>`, `<`) – 20 pts
4. **Background execution** (`&`) – 15 pts
5. **Command history** (with `hist print` and `hist N`) – 30 pts

> Shell must also manage **zombie processes**, reaping background processes after the next foreground job.

### **Test Coverage**:

* Pipeline chaining (2-3 commands)
* File I/O redirection
* Background jobs
* History re-execution
* Output consistency with `ps`

### **Technical Concepts**:

* `fork()`, `exec()`, `waitpid()`
* File descriptors and `dup2()`
* Parser interaction and token stream control
* History tracking with internal state management

### **Points Breakdown**:

* Command parsing features: 70 pts
* Command history implementation: 30 pts
  **Total**: 100 points

---

## **Cumulative Learning Outcomes**

By the end of these projects, students demonstrated proficiency in:

* Extending xv6 kernel with custom **system calls**
* Writing **multi-process applications** and schedulers
* Understanding **kernel-user transitions**, syscall ABI, and IPC
* Implementing **UNIX shell features** such as pipelines, redirection, and job control

---

## **Submission & Grading Notes**

* Each project required a zipped submission and documentation file (`PROJX.txt`)
* Grading considered correctness, design, collaboration, and test coverage
* Late submissions incurred penalties; patch or compile failures were partially penalized if recoverable
* Academic integrity was strictly enforced: only group-sharing allowed
