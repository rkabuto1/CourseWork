Absolutely — here's your **CS 350 Operating Systems, Spring 2025 - Programming Project 3 (PROJ3)** content, neatly organized with bolded headers and clear formatting, while keeping the **original wording unchanged**.

---

# **CS 350 Operating Systems, Spring 2025**

## **Programming Project 3 (PROJ3)**

**Out**: 3/31/2025, MON
**Due**: 04/20/2025, SUN 23:59:59

---

### **Overview**

In this project, you will implement your own **shell terminal** based on a command-line parser program in xv6.
The goal is to practice **multi-process programming** and understand the **OS process API**.

This is a **group project**. You can divide work or collaborate together, but **each member must submit their own code** on Brightspace.

This project contributes **6.25%** toward your final grade.

---

## **1. Baseline Source Code**

Use the baseline xv6 code provided on Brightspace — **do not reuse project or lab code**.
This code builds on your previous experience using `fork()`, `exec()`, `wait()`, and `pipe()`.

---

## **2. The Baseline Code – A Command-Line Parser**

The parser (`sh`) supports:

* **Basic command parsing**
* **Multiple commands per line**
* **Pipelines**
* **I/O redirection**
* **Background execution**

---

### **2.1 Basic Command Parsing**

A command is a sequence of words separated by spaces and terminated by a control operator.

**Example**:

```bash
echo hello operating systems
```

* `echo` is the command
* `"hello"`, `"operating"`, and `"systems"` are arguments

**Control Operators:**

| Operator    | Meaning              |      |
| ----------- | -------------------- | ---- |
| `<newline>` | Command delimiter    |      |
| `;`         | Command delimiter    |      |
| \`          | \`                   | Pipe |
| `&`         | Background execution |      |

---

### **2.2 Multiple Commands in Same Line**

Use `;` to separate commands on the same line — they execute **sequentially**.

---

### **2.3 Command Pipeline**

`|` connects commands into a pipeline:

```bash
cat os.txt | head -7 | tail -5
```

---

### **2.4 I/O Redirection**

* `>` redirects **stdout** to file
* `<` redirects **stdin** from file
  Example:

```bash
ls -l > result.txt
```

---

### **2.5 Background Execution**

Commands ending with `&` run **asynchronously** in the background.

---

### **2.6 Built-in `exit` Command**

Typing `exit` terminates the shell.

---

## **3. Implementing Your Own Shell Terminal**

Enhance the baseline shell by adding the following features:

---

### **3.1 Multiple Commands in Same Line (10 points)**

Support `;` separated command execution.

---

### **3.2 Command Pipeline (25 points)**

Use:

* `pipe()` to connect output to input
* `dup()` and `close()` to redirect stdin/stdout

---

### **3.3 Input and Output Redirection (20 points)**

Support:

* `>` for output redirection
* `<` for input redirection

Use:

* `open()`, `close()`, `dup()`/`dup2()`

---

### **3.4 Background Execution (15 points)**

Commands ending with `&` should run in the background.
Reap background children using `waitpid()` **after** the next foreground command finishes.

---

### **3.5 Command History (30 points)**

Implement `hist` as a built-in command:

* `hist print` → prints last **10 commands**
* `hist N` → re-executes the **N-th** command from the list

**Note**: `hist` commands are **not** added to history unless part of a compound command.

---

### **3.6 Implementation Suggestion**

Study the parser first. Understand how it handles:

* Command tokenization
* Multi-command pipelines

---

## **3.7 Test Cases**

### **Test 1** – Multi-command + user program

```bash
ls; ./sleep_and_echo "operating systems"
ps
```

### **Test 2** – 2-command pipeline

```bash
cat README | wc
ps
```

### **Test 3** – 3-command pipeline

```bash
ls . | grep s | wc
ps
```

### **Test 4** – Output redirection

```bash
echo "Operating System" > aaa
cat aaa
ps
```

### **Test 5** – Input redirection

```bash
wc < README
ps
```

### **Test 6** – Input and output redirection

```bash
wc < README > testfile
cat testfile
ps
```

### **Test 7** – Background execution

```bash
./sleep_and_echo "Hello World!" &
ls
# wait for message
ls
ps
```

### **Test 8** – History print

```bash
hist print
ps
```

### **Test 9** – Over 10 history entries

```bash
# Enter >10 commands
hist print
```

### **Test 10** – History re-execution

```bash
hist print
hist 1
hist print
```

> Shell should run all test cases **repeatedly in one session** without restart.

---

## **4. Submit Your Work**

Submit a `.zip` of your shell code via Brightspace. Also include `PROJ3.txt`:

Describe:

* Work completed by each member
* Implementation status
* Code functionality (if unclear)
* Test case logs (working or not)
* Anything else relevant to grading

**Tip**: Test thoroughly on CS machines before submitting.

---

## **5. Grading**

1. **Submission time** is based on Brightspace timestamp.

2. **Patch/Build Issues**:

   * TA attempts fix (3 min max)
   * If fixed: **1%-10% off**
   * If not: TA contacts you

     * Fixed in demo: **11%-20% off**
     * Not resolved: **0 points**

3. **Incorrect behavior**: Partial points based on issue severity.

4. **Collaboration Policy**:

   * OK to discuss
   * **No code sharing** outside your group
   * Violation = **0 points + report**

---

Let me know if you'd like this exported as a PDF, Markdown, or a formatted README.
