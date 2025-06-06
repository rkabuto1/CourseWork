
## CS 350 Operating Systems, Spring 2025

## Programming Project 1 (PROJ1)

**Out**: 02/12/2025, MON
**Due date**: 03/02/2025, SUN 23:59:59

### **Overview**

In this project, you will add new functionality to xv6, including the ability to shut the system down, print exit statuses, and output uptime. You will also answer questions related to system call implementation in xv6. The goal of this project is to learn how system calls are implemented in modern OSes and how system calls are invoked from a user program in xv6.

This is a group project, and is expected to be completed with your group members. Each group member is responsible for completing the shutdown system call. Furthermore, each group member should choose one of four unique system calls to implement themselves. Each group member is responsible for submitting their own code on Brightspace.

This project contributes **6.25%** toward the final grade.

---

## **1. Baseline source code**

For this and all the later projects, you will be working on the baseline code that needs to be downloaded from Brightspace. Please make sure you read this whole section, as well as the grading guidelines (Section 6), before downloading your code from Brightspace.

---

## **2. Build and run xv6**

### **2.1 Using a CS machine**

1. Log into a CS machine (i.e., a local machine or a remote cluster machine).
2. Download and SCP the baseline xv6 code.
3. Compile and run xv6:

```bash
$ make qemu-nox
```

After compiling the kernel source and generating the root file system, the Makefile will start a QEMU VM to run the xv6 kernel image just compiled (you can read the Makefile for more details). Then you will see the following output (disregard the warning message(s)), indicating you have successfully compiled and run the xv6 system:

```
xv6...
cpu0: starting 0  
sb: size 1000 nblocks 941 ninodes 200 nlog 30 logstart 2 inodestart 32 bmap start 58  
init: starting sh  
$
```

**Troubleshooting**: If you see the following error message:

```
make: execvp: ./sign.pl: Permission denied
```

Solve it by running:

```bash
chmod ugo+x ./sign.pl
make clean
make qemu-nox
```

---

### **2.2 Using your own computer**

You will need a Linux distribution that supports GNU C, which is targeted at the x86 architecture and using ELF binaries.

1. Install QEMU on your computer. For example, on Ubuntu:

```bash
$ sudo apt-get install qemu
```

2. Perform Section 2.1 step (2).
3. Open the Makefile in the xv6 source directory, and comment out the following line:

```make
QEMU = ˜boubinjg/fs/bin/qemu-system-i386
```

by putting a “#” at the beginning of the line.
4\. Perform Section 2.1 step (3).

---

## **3. Shutdown commands and system calls (60 points)**

### **3.1 shutdown command and the system call**

The first command you need to complete is named **“shutdown”**, which simply shuts down the machine. In the baseline code, the file `shutdown.c` provides the implementation of this command.
What you need to do is to complete the corresponding system call and its user space wrapper routine.

---

### **3.2 Additional system calls**

Operating systems developers regularly update their operating systems with new features, which may include new system calls. Your group will add **N additional system calls** to xv6 where `N == GroupSize`. Each group member is responsible for one system call, and can be helped by other group members. 5 example system calls are documented below. Select **N** of these 5, **without repetition**.

---

#### **3.2.1 shutdown2**

Prints a shutdown message provided by the user within the system call implementation before shutting down the machine.
Refer to `shutdown2.c` in the baseline code.

---

#### **3.2.2 exit2**

Behaves like the `exit()` system call and voluntarily exits a running process. Takes an integer exit status argument and prints that status before exiting.
Refer to `exit2.c` in the baseline code.

---

#### **3.2.3 mkdir2**

Creates **two** new directories in your file system using two directory name arguments.
Refer to `mkdir2.c` in the baseline code.

---

#### **3.2.4 uptime2**

Returns system uptime in various formats based on an integer argument:

* `uptime2(1)` returns uptime in ticks
* `uptime2(2)` returns uptime in seconds
* `uptime2(3)` returns uptime in minutes
  Refer to `uptime2.c` in the baseline code.

---

#### **3.2.5 Custom System Call (5 extra credit points)**

Optional. One group member may implement a custom system call.
Requirements:

* Must take at least one argument and use it.
* Must include user space wrapper and documentation in `PROJ1.txt`.

---

### **3.3 Requirements and hints**

* Do **not** change user space files like `shutdown.c` except to **remove** the `STUB FUNCS` macro.
* Use the following to shut down xv6:

```c
outw(0xB004, 0x0|0x2000);
outw(0x604, 0x0|0x2000);
```

* Study existing command implementations like `cat.c`, `sys_open()` in `sysfile.c`, etc.
* Pay attention to related files including assembly.

---

## **4. xv6 system call implementation Q\&A (40 points)**

Answer the following:

1. **(10 points)**

   * What is the name of the wrapper function for `shutdown2`? (2 pts)
   * Where is it invoked? (3 pts)
   * Where is it defined? (5 pts)

2. **(10 points)**

   * Explain (with code) how the wrapper function triggers the system call.

3. **(10 points)**

   * Explain (with code) how the OS kernel locates and calls the system call.

4. **(10 points)**

   * How are system call arguments passed from user space to kernel?

**Submit as**: `xv6-syscall-mechanisms.pdf` on Brightspace.

---

## **5. Submit your work**

* Submit entire project as a `.zip` file.
* Include `PROJ1.txt` describing:

  * Work done by each group member
  * Completion status
  * Code explanations (if needed)
  * Log of working/broken test cases
  * Any grading-relevant info

**Tip**: Test thoroughly on CS machines before submission.

---

## **6. Grading**

1. **Late Penalty**:

   * 30% off per day (max 2 days late)
   * After that: no grading

2. **Use Baseline Code**:

   * Don’t use non-Brightspace xv6
   * Don’t remove patch code
   * Misuse = **100% CPU warning** = -10 pts

3. **Patch/Build Failures**:

   * TA tries fix (3 min max)
   * If fixable: -1% to -10%
   * If not: TA may email

     * If fixed in demo: -11% to -20%
     * No response/demo: **0 pts**

4. **Incorrect Behavior**:

   * TA deducts based on issue severity

5. **Collaboration Policy**:

   * You may discuss
   * But **code must stay private**
   * Share only with group
   * Violation = **0 pts + report**
