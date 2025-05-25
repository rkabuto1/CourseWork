# CS 350 Operating Systems – Programming Project 1 (PROJ1)

**Out:** 02/12/2025, MON  
**Due:** 03/02/2025, SUN 23:59:59  

## Overview

In this project, you will add new functionality to xv6, including the ability to shut the system down, print exit statuses, and output uptime. You will also answer questions related to system call implementation in xv6. The goal is to learn how system calls are implemented in modern OSes and how system calls are invoked from a user program in xv6.

This is a group project. Each group member must:
- Implement the `shutdown` system call.
- Choose and implement one of four unique system calls.
- Submit their own code on Brightspace.

**Contribution:** 6.25% of final grade.

## 1. Baseline Source Code

Download the baseline code from Brightspace. Read all instructions and grading policies before modifying code.

## 2. Build and Run xv6

### 2.1 Using a CS Machine
1. Log into a CS machine.
2. Download and SCP the xv6 baseline code.
3. Compile and run:
   ```sh
   make qemu-nox
   ```

If you get a permission error:
```sh
chmod ugo+x ./sign.pl
make clean
make qemu-nox
```

### 2.2 Using Your Own Computer
1. Install QEMU:
   ```sh
   sudo apt-get install qemu
   ```
2. SCP code from CS machines.
3. Comment out this line in Makefile:
   ```
   # QEMU = ˜boubinjg/fs/bin/qemu-system-i386
   ```
4. Compile and run as before.

## 3. System Calls (60 points)

### 3.1 `shutdown`
Complete the system call and user-space wrapper for `shutdown`. See `shutdown.c`.

### 3.2 Additional System Calls
Each group member selects one of the following (no repetition):

- **shutdown2**: Shutdown with a custom message. See `shutdown2.c`.
- **exit2**: Custom exit with status printing. See `exit2.c`.
- **mkdir2**: Create two directories. See `mkdir2.c`.
- **uptime2**: Return uptime in different units. See `uptime2.c`.
- **Custom syscall (optional, +5 extra credit)**: Must accept an argument and be documented in `PROJ1.txt`.

### 3.3 Requirements and Hints

- Do not modify user wrapper code other than disabling `STUB FUNCS`.
- Use the following code to shut down:
  ```c
  outw(0xB004, 0x0|0x2000);
  outw(0x604, 0x0|0x2000);
  ```
- Refer to `cat.c`, `sysfile.c`, and syscall-related code for examples.

## 4. xv6 System Call Implementation Q&A (40 points)

Answer these in a PDF named `xv6-syscall-mechanisms.pdf`:

1. What is the name, invocation location, and definition location of the `shutdown2` syscall wrapper? (10 pts)
2. How does the wrapper trigger the syscall? (10 pts)
3. How does the kernel locate and call the syscall? (10 pts)
4. How are syscall arguments passed from user space to the kernel? (10 pts)

## 5. Submit Your Work

Submit a zip file to Brightspace containing:
- Code
- `PROJ1.txt`: Description of group work and implementation status.

You may include:
- Incomplete features
- Code explanations
- Test case logs

**Test thoroughly on a CS machine before submission.**

## 6. Grading Policy

- **Late penalty**: 30% off per day (up to 2 days)
- **System abuse (100% CPU)**: -10 pts
- **Build issues**:
  - Minor fix: -1% to -10%
  - Major fix (after demo): -11% to -20%
  - No fix or no response: **0 points**
- **Partial credit** for incomplete or buggy code
- **Cheating**: Zero and disciplinary action

