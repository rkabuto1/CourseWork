-------------------------------
Lab 09 - Due Nov 1 by 11:59 pm
-------------------------------

## Description 

- For lab 9 we are going to make a version of the `BankAccount` class, `MiniBankAccount`, from program 3. 
- This version is going to ***share data*** between ***multiple threads*** operating on a single copy of the `MiniBankAccount` class (and the three derivatives of it: `MiniBankAccountSync`, `MiniBankAccountSemaphore`, and `MiniBankAccountLock`). 
- This is very similar to what we have discussed last week related to `Threads` and using `synchronized` methods, a `Semaphore`, and a `ReentrantLock` to ***limit access to shared data*** across multiple `Threads` and classes. 
- **Tip:** Reviewing the sample code posted in the ***lecture notes*** and ***supplementary examples*** may help with today's lab.

**For your reference:**

- [Lecture Notes on Threading](https://github.com/Binghamton-University-CS140-Spring-2023/lecture_notes/blob/main/24_multi_threaded_applications.md)
- [Threaded Print Example](https://github.com/Binghamton-University-CS140-Spring-2023/lecture_notes/tree/main/supplementary/examples/threading/threaded_print)
- [Example of Threading with shared data](https://github.com/Binghamton-University-CS140-Spring-2023/lecture_notes/tree/main/supplementary/examples/threading/threads_sharing_data)

## Summary of Changes

- The posted code will compile and execute, but you will need to update `MiniBankAccountSync.java`, `MiniBankAccountSemaphore.java`, `MiniBankAccountLock.java`, and `MiniBankAccountProcessor.java` to get correct results. 
- You need to add the `Semaphore` field to `MiniBankAccountSemaphore.java` and the `ReentrantLock` field to `MiniBankAccountLock.java`. 
- At this point compile the code, `javac makeMiniBankAccount.java`, and execute `java makeMiniBankAccount t t t t`
	- You should note that none of the `Transactions` in `MiniBankAccountProcessor.java` are processed until you add the appropriate method calls for `miniBankAccount` to the `cases` in the `switch` statement. 
- Read the rest of the lab description prior to making changes to `MiniBankAccountSync.java`, `MiniBankAccountSemaphore.java`, `MiniBankAccountLock.java`, and `MiniBankAccountProcessor.java`.

## Start Code

I have provided the following files:

1. `Transaction.java` 
	- same as the one we used from program 3. No changes need to be made to this file.
2. `MiniBankAccountFunctions.java`
	- interface that all of our versions of the `MiniBankAccount` class will implement. No changes need to be made to this file.
3. `MiniBankAccount.java` 
	- this is the basic version of the class, that ***does nothing to ensure*** that only one thread is accessing the shared data at a time. 
	- **Note:** The shared data is the two fields `private double checkingBalance` and `private double savingsBalance`. 
	- No changes need to be made to this file. 
	- This class implements all of the required functions that the three derivative classes, `MiniBankAccountSync`, `MiniBankAccountSemaphore`, and `MiniBankAccountLock` need to implement. 
	- The three derivative classes will implement the exact same functions, except they will use either `synchronized` methods, a `Semaphore`, or a `ReentrantLock` to ensure that only a single thread/class accesses the two shared fields at a time. You simply need to make the appropriate changes described below in the **TODOs** section.
4. `MiniBankAccountProcessor.java` 
	- this is a class that extends `Thread` that will process the `Transactions` for each of the four account types. You will need to make minor modifications to this file. All changes will be in the `switch` statement.
5. `makeMiniBankAccount.java` 
	- this is the program that creates all the objects and `Threads` and starts everything running. 
	- Once everything is done executing, it outputs the account information for each account type that ran. 
	- No changes need to be made to this file. 
	- This program creates three threads for each of the `MiniBankAccount` type and processes the `Transactions`. 

## TODOs

Here is what you are going to do during the lab.

### Updates for `MiniBankAccountSync.java` 

- Make updates to it such that the methods that access the `checkingBalance` and `savingsBalance` fields are `synchronized`. This one should be pretty easy.

### Updates for `MiniBankAccountSemaphore.java.`

- Add a `private final java.util.concurrent.Semaphore;` field
- Update the constructor to assign the `java.util.concurrent.Semaphore` parameter to the newly added `Semaphore` field.
- Update the methods that access `checkingBalance` and `savingsBalance` such that:
	- they `acquire()` a “permit” from the `Semaphore` ***prior to*** accessing `checkingBalance` and `savingsBalance`, 
	- make the required updates to `checkingBalance` and `savingsBalance`, 
	- and then `release()` the “permit”. 
- **Note:** The `acquire()` call needs to be inside a try/catch block. 
- Generally speacking, the `acquire()` call should be the ***first thing*** that happens in the applicable methods and the `release()` call should be the ***last thing*** that happens in the applicable methods.

**Avoid Waiting Forever**
- Except in the `toString()` method, in which case `release()` must happen ***prior to*** the `return` statement, otherwise the program will ***wait forever*** for the “permit” to be released.
- The compiler would flag this if the `release()` is after the `return` statement, since the method call would be ***unreachable***.
- These updates will take a little longer than the updates for `MiniBankAccountSync.java`.

### Updates for `MiniBankAccountLock.java`.

- Add a `private final java.util.concurrent.locks.ReentrantLock;` field
- Update the constructor to assign the `java.util.concurrent.locks.ReentrantLock` parameter to the newly added `ReentrantLock`field.
- Update the methods that access `checkingBalance` and `savingsBalance` such that:
	- they `lock()` the `ReentrantLock` ***prior to*** accessing `checkingBalance` and `savingsBalance`, 
	- make the required updates to `checkingBalance` and `savingsBalance`, 
	- and then `unlock()` the `ReentrantLock`. 
- **Note:** The `lock()` call should be the ***first thing*** that happens in the applicable methods and the `unlock()` call should be the ***last thing*** that happens in the applicable methods.

**Avoid Waiting Forever**
- Except in the `toString()` method, in which case `unlock()` must happen ***prior*** to the `return` statement, otherwise the program will ***wait forever*** for the “permit” to be released. 
- The compiler would flag this if the `unlock()` is after the `return` statement, since the method call would be ***unreachable***.
- According to the java documentation, the statements after the `lock()` method should be contained in a `try/finally` pair, with the `unlock()` method call part of the `finally` statement. **Implement your code this way.**
- **Note:** These changes are ***similar*** to `MiniBankAccountSemaphore.java` changes.

### Notes on derivative classes

- The only changes you need to make to `MiniBankAccountSync.java`, `MiniBankAccountSemaphore.java`, and `MiniBankAccountLock.java` are adding the ***shared data protection*** and adding the `Semaphore` and `ReentrantLock` to the applicable classes.
- I provided copies of `MiniBankAccountSync.java`, `MiniBankAccountSemaphore.java`, and `MiniBankAccountLock.java` with the correct class names and all the methods copied from `MiniBankAccont.java`. 
	- This was simply so that the code would compile when you download it.

###  Updates for `MiniBankAccountProcessor.java`

- Update the `switch / case` statement in `MiniBankAccountProcessor.java` to call the appropriate methods of `miniBankAccount`. 
- It should be obvious what needs to be done.

## Running `makeMiniBankAccount`

- The `makeMiniBankAccount.java` program takes ***four*** command line arguments. 
	- A combination of `"t/f"` (for `true`/`false`) telling the program which of the four classes should be executed for the current run. 
	- The four paramters equate to the classes {`MiniBankAccount`, `MiniBankAccountSync`, `MiniBankAccountSemaphore`, `MiniBankAccountLock`}, in the order shown here.

- **Goal:** Once we complete the lab we should all have a basic understanding of `Threads` in Java and how to use `synchronized` methods, `Semophores`, and `ReentrantLocks`.

### Example runs

Once you have made the above changes, executing `java makeMiniBankAccount  t t t t` should generate a lot of output, with the last 16 lines being:

```
mba.toString()
Smith, Jane
12.0
8.0
mbaSync.toString()
Smith, Jane Sync
36.0
24.0
mbaSemaphore.toString()
Smith, Jane Semaphore
36.0
24.0
mbaLock.toString()
Smith, Jane Lock
36.0
24.0
```

The correct result is `36.0` and `24.0`. 

- **Note:** What this is telling us is the the base class, `MiniBankAccount`, ***did not*** get the correct result, since the shared data was not protected from multiple threads accessing the shared data, `checkingBalance` and `savingsBalance`, at the same time. 
- On the other hand, the `synchronized` methods version, `Semaphore` version, and `ReentrantLock` version of the class, `MiniBankAccountSync`, `MiniBankAccountSemaphore`, and `MiniBankAccountLock` did not allow multiple threads to access the shared data at the same time. This means their results ***are correct***. 
- Again, for the sake of clarity, the correct blances are `36` and `24`, not `12` and `8`.

## Getting Credit

To get credit, demonstrate your code to a TA/CA, and answer the ***two questions*** below (tell the TA/CA the answers).

## Questions with Required Explanations

- The demonstration consists of four runs and answering two questions:

### Question 1

What happens if you ***do not*** `release` the permit at the end of `MiniBankAccountSemaphore.depositToChecking(int amount)`? 
- To see what happens, you can make the code change and then execute `java makeMiniBankAccount  f f t f`.

### Question 2

**Why does the above happen?**

## Submission

Once you have successfully shown the four runs, as described below, and answered the two questions above to the TA/CA you are good to submit your work.
As usual, submit your code to github and post the latest commit hash on BrightSpace:

```
git add -A
git commit -m "finished lab09"
git push origin
git rev-parse HEAD
```

## Example output for each Run

- Below, we also supply example outputs for each run, ***that is expected when you demo to the TA/CA***.
	- We isolate running each class in an isolated fashion, by only specifying `true` for one of the four command line arguments.
- **Note:** What you should notice is that in the output for the `MiniBankAccount`, the `Transactions` are ***interleaved*** (start and end pairs for each `Transaction` are not always next to each other), while in the output for the  `MiniBankAccountSync`,  `MiniBankAccountSemaphore`, and `MiniBankAccountLock` each `Transaction` completes ***prior to the next one starting*** (start and end pairs for each transaction are right next to each other).

### 1. `MiniBankAccount` run

```
Run 1: java makeMiniBankAccount  t f f f

The output should resemble: (note multiple starts prior to matching end)
start depositChecking 20.0	Jane
start depositChecking 20.0	Jane
start depositChecking 20.0	Jane
end depositChecking 20.0	Jane
end depositChecking 20.0	Jane
end depositChecking 20.0	Jane
start depositSavings 30.0	Jane
start depositSavings 30.0	Jane
start depositSavings 30.0	Jane
end depositSavings 30.0	Jane
end depositSavings 30.0	Jane
end depositSavings 30.0	Jane
start withdrawChecking 10.0	Jane
start withdrawChecking 10.0	Jane
start withdrawChecking 10.0	Jane
end withdrawChecking 10.0	Jane
end withdrawChecking 10.0	Jane
end withdrawChecking 10.0	Jane
start withdrawSavings 20.0	Jane
start withdrawSavings 20.0	Jane
start withdrawSavings 20.0	Jane
end withdrawSavings 20.0	Jane
end withdrawSavings 20.0	Jane
end withdrawSavings 20.0	Jane
start transferToSavings 5.0	Jane
start transferToSavings 5.0	Jane
start transferToSavings 5.0	Jane
end transferToSavings 5.0	Jane
end transferToSavings 5.0	Jane
end transferToSavings 5.0	Jane
start transferToChecking 7.0	Jane
start transferToChecking 7.0	Jane
start transferToChecking 7.0	Jane
end transferToChecking 7.0	Jane
end transferToChecking 7.0	Jane
end transferToChecking 7.0	Jane
mba.toString()
Smith, Jane
12.0
8.0
```

### 2. `MiniBankAccountSync` run

```
Run 2: java makeMiniBankAccount  f t f f
The output should resemble: (note all starts have matching end prior to additional start)
start depositChecking 20.0	Jane Sync
end depositChecking 20.0	Jane Sync
start depositSavings 30.0	Jane Sync
end depositSavings 30.0	Jane Sync
start withdrawChecking 10.0	Jane Sync
end withdrawChecking 10.0	Jane Sync
start withdrawSavings 20.0	Jane Sync
end withdrawSavings 20.0	Jane Sync
start transferToSavings 5.0	Jane Sync
end transferToSavings 5.0	Jane Sync
start transferToChecking 7.0	Jane Sync
end transferToChecking 7.0	Jane Sync
start depositChecking 20.0	Jane Sync
end depositChecking 20.0	Jane Sync
start depositSavings 30.0	Jane Sync
end depositSavings 30.0	Jane Sync
start withdrawChecking 10.0	Jane Sync
end withdrawChecking 10.0	Jane Sync
start withdrawSavings 20.0	Jane Sync
end withdrawSavings 20.0	Jane Sync
start transferToSavings 5.0	Jane Sync
end transferToSavings 5.0	Jane Sync
start transferToChecking 7.0	Jane Sync
end transferToChecking 7.0	Jane Sync
start depositChecking 20.0	Jane Sync
end depositChecking 20.0	Jane Sync
start depositSavings 30.0	Jane Sync
end depositSavings 30.0	Jane Sync
start withdrawChecking 10.0	Jane Sync
end withdrawChecking 10.0	Jane Sync
start withdrawSavings 20.0	Jane Sync
end withdrawSavings 20.0	Jane Sync
start transferToSavings 5.0	Jane Sync
end transferToSavings 5.0	Jane Sync
start transferToChecking 7.0	Jane Sync
end transferToChecking 7.0	Jane Sync
mbaSync.toString()
Smith, Jane Sync
36.0
24.0
```

### 3. `MiniBankAccountSemaphore` run

```
Run 3: java makeMiniBankAccount  f f t f
The output should resemble: (note all starts have matching end prior to additional start)
start depositChecking 20.0	Jane Semaphore
end depositChecking 20.0	Jane Semaphore
start depositChecking 20.0	Jane Semaphore
end depositChecking 20.0	Jane Semaphore
start depositChecking 20.0	Jane Semaphore
end depositChecking 20.0	Jane Semaphore
start depositSavings 30.0	Jane Semaphore
end depositSavings 30.0	Jane Semaphore
start depositSavings 30.0	Jane Semaphore
end depositSavings 30.0	Jane Semaphore
start depositSavings 30.0	Jane Semaphore
end depositSavings 30.0	Jane Semaphore
start withdrawChecking 10.0	Jane Semaphore
end withdrawChecking 10.0	Jane Semaphore
start withdrawChecking 10.0	Jane Semaphore
end withdrawChecking 10.0	Jane Semaphore
start withdrawChecking 10.0	Jane Semaphore
end withdrawChecking 10.0	Jane Semaphore
start withdrawSavings 20.0	Jane Semaphore
end withdrawSavings 20.0	Jane Semaphore
start withdrawSavings 20.0	Jane Semaphore
end withdrawSavings 20.0	Jane Semaphore
start withdrawSavings 20.0	Jane Semaphore
end withdrawSavings 20.0	Jane Semaphore
start transferToSavings 5.0	Jane Semaphore
end transferToSavings 5.0	Jane Semaphore
start transferToSavings 5.0	Jane Semaphore
end transferToSavings 5.0	Jane Semaphore
start transferToSavings 5.0	Jane Semaphore
end transferToSavings 5.0	Jane Semaphore
start transferToChecking 7.0	Jane Semaphore
end transferToChecking 7.0	Jane Semaphore
start transferToChecking 7.0	Jane Semaphore
end transferToChecking 7.0	Jane Semaphore
start transferToChecking 7.0	Jane Semaphore
end transferToChecking 7.0	Jane Semaphore
mbaSemaphore.toString()
Smith, Jane Semaphore
36.0
24.0
```

### 4. `MiniBankAccountLock` run

```
Run 4: java makeMiniBankAccount  f f f t
The output should resemble: (note all starts have matching end prior to additional start)
start depositChecking 20.0	Jane Lock
end depositChecking 20.0	Jane Lock
start depositChecking 20.0	Jane Lock
end depositChecking 20.0	Jane Lock
start depositChecking 20.0	Jane Lock
end depositChecking 20.0	Jane Lock
start depositSavings 30.0	Jane Lock
end depositSavings 30.0	Jane Lock
start depositSavings 30.0	Jane Lock
end depositSavings 30.0	Jane Lock
start depositSavings 30.0	Jane Lock
end depositSavings 30.0	Jane Lock
start withdrawChecking 10.0	Jane Lock
end withdrawChecking 10.0	Jane Lock
start withdrawChecking 10.0	Jane Lock
end withdrawChecking 10.0	Jane Lock
start withdrawChecking 10.0	Jane Lock
end withdrawChecking 10.0	Jane Lock
start withdrawSavings 20.0	Jane Lock
end withdrawSavings 20.0	Jane Lock
start withdrawSavings 20.0	Jane Lock
end withdrawSavings 20.0	Jane Lock
start withdrawSavings 20.0	Jane Lock
end withdrawSavings 20.0	Jane Lock
start transferToSavings 5.0	Jane Lock
end transferToSavings 5.0	Jane Lock
start transferToSavings 5.0	Jane Lock
end transferToSavings 5.0	Jane Lock
start transferToSavings 5.0	Jane Lock
end transferToSavings 5.0	Jane Lock
start transferToChecking 7.0	Jane Lock
end transferToChecking 7.0	Jane Lock
start transferToChecking 7.0	Jane Lock
end transferToChecking 7.0	Jane Lock
start transferToChecking 7.0	Jane Lock
end transferToChecking 7.0	Jane Lock
mbaLock.toString()
Smith, Jane Lock
36.0
24.0
```