# CS 350 Operating Systems, Spring 2025
## Programming Project 1 (PROJ1)

**Out:** 02/12/2025 (Monday)  
**Due Date:** 03/02/2025 (Sunday) 23:59:59  
**Project Contribution:** 6.25% of the final grade  

## Project Overview
In this project, you will add new functionalities to xv6, including:
- Implementing a system shutdown command.
- Printing exit statuses.
- Outputting system uptime.
- Answering questions related to system call implementation.

The objective is to understand system call implementation in modern operating systems and how they are invoked from user programs in xv6.

This is a **group project**. Each group member is responsible for:
1. Completing the `shutdown` system call.
2. Implementing one additional system call from the provided list.
3. Submitting their own code to **Brightspace**.

---
## 1. Baseline Source Code
You will work on the **baseline xv6 code** provided on **Brightspace**. Make sure to read the full project details and grading guidelines before downloading your code.

---
## 2. Building and Running xv6

### 2.1 Using a CS Machine
1. Log into a CS machine (local or remote cluster).
2. Download and SCP the baseline xv6 code.
3. Compile and run xv6 using:
   ```sh
   make qemu-nox
   ```
4. Upon successful compilation, you should see an output similar to:
   ```sh
   xv6...
   cpu0: starting 0
   sb: size 1000 nblocks 941 ninodes 200 nlog 30 logstart 2 inodestart 32 bmap start 58
   init: starting sh
   $
   ```
#### Troubleshooting:
If you encounter the error:
```sh
make: execvp: ./sign.pl: Permission denied
```
Solve it by running:
```sh
chmod ugo+x ./sign.pl
make clean
make qemu-nox
```

### 2.2 Using Your Own Computer
1. Install QEMU (for Ubuntu users, run: `sudo apt-get install qemu`).
2. Download the baseline xv6 code.
3. Open the `Makefile` in the xv6 source directory and comment out the line:
   ```sh
   # QEMU = ˜boubinjg/fs/bin/qemu-system-i386
   ```
4. Compile and run xv6 following Section 2.1 Step (3).

---
## 3. System Calls Implementation (60 Points)
### 3.1 Shutdown Command
Implement a `shutdown` command that shuts down the machine. The file `shutdown.c` contains the user command, and you need to complete the corresponding system call and wrapper.

### 3.2 Additional System Calls
Each group member must implement one of the following system calls:
- **shutdown2**: Prints a user-defined shutdown message before shutting down.
- **exit2**: Exits a running process and prints an exit status.
- **mkdir2**: Creates two directories simultaneously.
- **uptime2**: Returns system uptime in ticks, seconds, or minutes based on an argument.

#### Custom System Call (Extra Credit, 5 Points)
One group member can implement a custom system call with at least one argument. Document its purpose, functionality, and usage in **PROJ1.txt**.

### 3.3 Requirements & Hints
- Do **not** modify `shutdown.c` or other user space wrapper functions.
- Use the following lines in your system call to shut down xv6:
  ```c
  outw(0xB004, 0x0|0x2000);
  outw(0x604, 0x0|0x2000);
  ```
- Refer to `cat.c` for an example of a system call (`open()`) implementation.

---
## 4. System Call Q&A (40 Points)
Answer the following questions in a **PDF document** named `xv6-syscall-mechanisms.pdf` and submit it on **Brightspace**:
1. Identify the user space wrapper function for `shutdown2` and its invocation location.
2. Explain how the wrapper function triggers the system call (include actual code).
3. Describe how the OS kernel locates and calls a system call.
4. Explain how system call arguments are passed from user space to the OS kernel.

---
## 5. Submission Guidelines
Submit a **zip file** containing your complete implementation on **Brightspace**. Include a `PROJ1.txt` file with:
- Implementation status (especially if incomplete).
- A brief description of how your code works.
- Test case results (what works, what doesn’t).
- Contributions of each group member.

### Testing Recommendation
Ensure your code runs correctly on a **CS machine** before submission.

---
## 6. Grading Guidelines
- **Late Submissions:**
  - 1-2 days late: **30% penalty per day**.
  - After 2 days: **Not accepted**.
- **System Performance Issues:**
  - Running xv6 incorrectly (e.g., high CPU utilization on QEMU) results in a **10-point penalty**.
- **Code Compilation Issues:**
  - If your code doesn’t patch correctly or compile, the TA will attempt to fix it for **3 minutes**:
    - If fixed: **1%-10% deduction** (based on complexity).
    - If unresolved, you may be contacted for a **demo**:
      - If fixed during the demo: **11%-20% deduction**.
      - If unresolved: **zero points**.
- **Functionality Issues:**
  - Points deducted based on the impact of the issue.
- **Collaboration Policy:**
  - Group members can share code internally.
  - **No sharing code with other students**.
  - Any **cheating results in a zero** for the project and further reporting.

---
### **Good luck!** 🚀

