# Lab 00 - Due Jan 17th, By 11:59 pm

## General information on activity sections.

- Each lab will be run by the TAs/CAs.

### Attendance

Someone will be taking attendance.
- If you show up after attendance has been taken, make sure the TA/CA knows you are there.
- If you are unable to attend an activity section for a legitimate reason, send your instructor an email explaining why.
    * Sick, doctor's appointment, etc.

### Expectations

- Labs are to be done during the activity section, in person.
- Labs will be posted the morning of the class. In our case, Tuesday morning.
- Unless told otherwise, labs are to be done individually.
- Lab grading will be done by the TA/CA via a demo, once you have completed the lab.
- If you are unable to complete the lab during the activity section, email screen shots of the demo the instructor when you submit your code.
- Full credit will be given if you submit by midnight two days after the activity section.

### Linux - Get comfortable Coding at the command line

- We want you to become familar with unix/linux, including using the command line to write, compile, and run code. 
- Linux will be used in future classes, so it is a valuable skill to get comfortable with.


### Accessing the Lab Machines remotely

- Professor Garisson has provided instructions on how to utilize x2go to login into remote140.cs.binghamton.edu.
- [Please see the instructions here. Once you are good to go, you can start lab0.](access_remote_140.pdf)

### Lab0 - Summary

We will create three simple java programs.

1. A simple program which prints out a message, similar to a "Hello World" program.
   * Mine is named "bailey_lab0a.java"
   * Replace "bailey" with your last name.
2. A second program that adds the ability to:
   * Process commandline parameters
   * Convert the commandline parameters into ints and print them out to the terminal.
   * Mine is named "bailey_lab0b.java"
3. A third program that adds the ability to:
   * Catch any exceptions raised when trying to convert commandline parameters to an integer, when a supplied parameter is in fact NOT an integer to begin with.
   * Mine is named "bailey_lab0c.java"

- Everyone needs to create their own version of the three programs.
- You can provide as much assistance to other students as you want - this is not considered cheating for this lab.
- Once everything is working, demonstrate your three programs to a TA/CA and answer the some follow up questions, which will be described more below.

### Compiling / Executing a Java program from the commandline

- Open a command prompt or terminal emulator.
- Executing "java" or "javac" should result in a large amount of output describing all of the options that can be supplied to the "java" or "javac" commands.
   * If this is not the case, then these commands are not properly found in the path on your machine. Ask the TA/CA for assitance.
- Executing "java -version" or "javac -version" should tell you the version of the Java runtime environment or the Java compiler version.
- "javac" is used to compile a Java program and "java" is used to execute a Java application.

### The main method - point of entry when executing a java application.

- A java application consists of one or more files, each file containing a class, with the "main" class containing a method with a signature of `public static void main(String[] args)`
- You can omit the `String[] args`, but keeping it is usually the general practice. 
- `String[] args` is the way to get any commandline arguments provided to your program. (It will be an empty array if no arguments are supplied, which is also fine).

### Using github 

We will be using github classroom throughout the semester for code submissions. 

[Fill out the following form.](https://forms.gle/nmQLykMJvxpaqDix9) If you do not have a github account, ask the TA/CA for help setting one up.


From the command prompt, run the following commands to establish your user name and email, which will be used when you push to your git repository.

```
git config --global user.name "Firstname LastName"
git config --global user.email "email@binghamton.edu"
```

For example, I would do:

```
git config --global user.name "Shawn Bailey"
git config --global user.email "sbailey6@binghamton.edu"
```

#### SSH Key

In order to clone the repository, we will also need to establish an ssh key and add it to your github account.

In a command prompt, run the following:

```
ssh-keygen
```

It will say the following:

```
Generating public/private rsa key pair.
Enter file in which to save the key (/home/shawn-bailey/.ssh/id_rsa):
```

Just hit enter, and it will save the ssh key in the general location mentioned in parentheses. 
It will ask you to enter a passphrase twice. Go ahead and do so.

If you do that successfully you will get some output similar to the following:

```
Your identification has been saved in ...
Your public key has been saved in id_rsa.pub
The key fingerprint is:
SHA256:yL6iuun7jX0jbnMM8NT3yIp+yBa/GrYn5lqTF9U4eII shawn-bailey@bgmdevel
The key's randomart image is:
+---[RSA 3072]----+
|                 |
|      . .h       |
|     E.o =t .    |
|    osoa+..      |
|    + o.S o      |
|     =. .g .     |
|    .*OY.        |
| .  B@=@         |
|==+=OX@.o        |
+----[SHA256]-----+
```

Run the following command, and copy the output, which will give you the public ssh-rsa.
If you saved the ssh key in a different location, cat that out instead.

```
cat ~/.ssh/id_rsa.pub
```

Finally, back in github, go click on your picture in the top right corner and go to Settings.
In there, you will find SSH keys and GPG keys. Go in there, and hit add new SSH key. Paste in what you copied and give it some name. 

Once you have done this, you will have the ability to clone your repository via ssh, which will be needed.

Ask the TA/CA for help if you run into issues with establishing these git configurations or setting up your ssh key.

### Lab0a

- Open a command prompt.  
- Clone lab0 as a starting repository. To do this, go to the github classroom link, which was published this morning on brightspace. 
- Go through the process, and it will set up a private repository lab0-GITHUB_USN, where GITHUB_USN is your github username. 
- When you go to your private repository, you will see a clone button. Hit that and go the SSH tab.
- Copy that and you will need to run the following sort of command at the command line:

```
git clone git@github.com:Binghamton-University-CS140-Spring-2023/lab-0-sbailey6.git
```

It will ask you to enter your username and password. Upon doing so, it will clone the repository for you with starting lab0 files. cd into it and proceed.

NOTE: If you cannot successfully clone lab0, feel free to type the lab files needed for submission and submit the code to the instructor's email: sbailey6@binghamton.edu as a last resort for this introductory lab. You should also come to office hours to see if we can resolve this for you quickly.

- You will need to submit your repository with your changes once you are done with the lab.
- cd into the repository, and create a new file named "your_last_name_lab0a.java"
    * Mine has a name of "bailey_lab0a.java".

You can use whatever text editor you prefer. You can use gedit if you are logged into remote140 or notepad if you are using the Windows machines in LN G103 and couldn't succesfully use x2go to connect to remote140.

Add the following to your file. Replace the name of the class "bailey_lab0a" with "your_last_name_lab0a".

``` java

class bailey_lab0a
{
   public static void main (String[] args)
   {
      System.out.println("yo, I am here");
   }
}
```

Once you have saved the file, try executing "javac your_last_name_lab0a.java".
Ideally, you will get no output, signifiying that your program compiled successfully.
- If this is not the case, try to figure out the error, or the TA/CA can help you figure out what is wrong.

Run your program by executing "java your_last_name_lab0a"
- If you get an error like "Could not find or load main class your_last_name_lab0a", try executing
  * "java -classpath . your_last_name_lab0a"
  * The "-classpath ." tells the Java runtime environment to search for class files in the directory you are currently in.

If you are successful, you should see "yo, I am here" printed in the command window.

Congratulations! You've created your first class, "your_last_name_lab0a", which contains one method, namely the main method. You compiled the code into an executable, which you then executed via the java runtime environment.

For a java application to execute, we need a class, and within the class that you are going to run, we need to have some "main" method that we defined.

After compiling, you should notice the output of the Java compiler is a java ".class" file.
- After compiling "bailey_lab0a.java", the file "bailey_lab0a.class" is created by the compiler.
- When we execute "java bailey_lab0a", it is looking for the file "bailey_lab0a.class" to load and execute.

### A note on common Naming Conventions

A general rule of thumb: Your original Java file should have a class name that exactly matches the file name. 

If you do not follow this idiom, you run into a situation where the class file that the compiler creates will be named according to the class name within the original file, and won't correspond to to the original file name which is being compiled. This can lead to a whole lot of confusion and headaches, especially if you are writing some java application that involves multiple files / classes.

Example: Suppose I had a file named "foo.java", which defines a class of "class bar" within the file.

After compiling "foo.java", the class file created by the compiler would be named "bar.class", not "foo.class". To execute the compiled code, we would need to execute "java bar" not "java foo". Everything would be more consistent if we defined the class to be foo within the file "foo.java", or defined the class to be bar within the file "bar.java". 

Basically, make the filename consistent with the class name that is being defined within the file.

### The System class

In our first program, we used the `System` class to print output to the screen. 
If you look in the Java documentation or google "java system class" you will see that the System class can be used to print output to the standard output stream (stdout), the standard error stream (stderr), and read input from the standard input stream (stdin).
- If you are executing from the commandline, these are all associated with the command window your Java application is running in.

You will also notice there's other useful methods defined within the `System` class.
- Example 1: Getting the current time can be done via, `System.currentTimeMillis()`, which returns the current system time in milliseconds, as a long.
- Example 2: Running the garbage collector, which can be done via, `System.gc()`. (We will discuss the garbage collector in the near future).

### The String[] args parameter - an array of Strings.

Going back to the main method, we note it has a paramter of `String[] args`.
The commandline inputs are provided to the main method as an array of type `String`.
I'm sure we all have some general intuition for what a `String` is, but we will eventually discuss them formally.

In java, the square braces `[]` tells us that `args` is an array, and the type `String` tells us that the type of each element held within the `args` array is of type `String`.

Java arrays are indexed from 0 to n-1, where n is the size of the array. 

(An aside: Although most modern languages follow this idiom of indexing starting at 0, there are some rare exceptions where it could be 1-indexed, for instance in FORTRAN or ADA this is possible.)

And so, `arg` is an array containing the list of commandline arguments passed to our program as `String`s.

### Lab0b 

For the second program, let's create a new file and class, "your_last_name_lab0b.java" and "your_last_name_lab0b" that prints the commandline arguments to the screen.

To accomplish this, we will need to loop over all of the values that are contained in `args`.

#### The length field for java arrays

In java, arrays have a `length` field that tells us how large the array is, so `args.length` will tell us the size or dimension of `args`.
- If no commandline arguments are supplied, then `args.length` will be 0.
- If there are 10 commandline arguments supplised, `args.length` will be 10.

We can use `args.length` to check the number of commandline arguments, but for this simple program we don't need to do any checking that will be relevant.

#### The for loop

We can use a for loop to step through the elements of `args`. 

The format of a for loop is:

```java

for(statement 1; statement 2; statement 3)
{
   //code block to be executed.
}

```

- Statement 1 is executed (one time) before the execution of the code block.
- Statement 2 defines the terminating condition for executing the code block. 
  * The condition is checked at the beginning of each iteration of the loop. 
  * If the condition is satisfied, the code block is executed. 
  * If the condition is not satisfied, then the code block is not executed, and the for loop is left. 
  * Execution continues immediately after the for loop upon its exit.
- Statement 3 is executed (every time) after the code block has been executed.

To loop over each of the elements of "args" we can do:

``` java

for(int i = 0; i < args.length; i++)
{
   //do something here with args[i]
}

```

Above, we initialize an `int` `i` as 0, since we want to go over the values 0,1,2, ... , `args.length`-1.

We have a terminating condition, `i < args.length`. This causes the program to exit the for loop when the value of i is `>= args.length`.
- the valid indices for args are 0, 1, ..., `args.length`-1, so the above terminating condition is desirable here.

`i++` is semi equivalent to `i=i+1`. It increments the value of `i` *after* each time the block of code is executed.


Enter the following for the second program (replace the class name obviously as we did for the first program):

```java

class bailey_lab0b
{
   public static void main (String[] args)
   {
      System.out.println("yo, I am here, and below are the commandline arguments you gave me:");
      for(int i = 0; i < args.length; i++)
      {
         System.out.println("\t arg[" + i + "] = " + args[i]);
      }
      
      for(int i = 0; i < args.length; i++)
      {
         int intValue = Integer.parseInt(args[i]);
         System.out.println("\t arg[" + i + "] as an int = " + intValue);
      }
   }
}

```

We are actually doing two things here. In the first loop, we are printing out all of the commandline arguments. In the second loop, we are outputting them again, after converting each one to an `int`.
- The `"\t"` inserts a tab into the output. 
- The line `int intValue = Integer.parseInt(args[i])` uses the `Integer` class to convert the ith `String` `args[i]` to an `int` using the `parseInt` method.
- Eventually, we will discuss the `Integer` class, but it should be pretty obvious that it is a class related to integers.

Once you compile it, you can execute it as "java your_last_name_lab0b 0 1 2 3 4 5" and get the following output:

```
yo, I am here, and below are the command line arguments you gave me:
    arg[0] = 0
    arg[1] = 1
    arg[2] = 2
    arg[3] = 3
    arg[4] = 4
    arg[5] = 5
    arg[0] as an int = 0
    arg[1] as an int = 1
    arg[2] as an int = 2
    arg[3] as an int = 3
    arg[4] as an int = 4
    arg[5] as an int = 5
```

##### Raising a Runtime Exception

If you execute it again as "java your_last_name_lab0b 0 1 2 a 4 5", you will get the following output:
```
yo, I am here, and below are the commandline arguments you gave me:
	 arg[0] = 0
	 arg[1] = 1
	 arg[2] = 2
	 arg[3] = a
	 arg[4] = 4
	 arg[5] = 5
	 arg[0] as an int = 0
	 arg[1] as an int = 1
	 arg[2] as an int = 2
Exception in thread "main" java.lang.NumberFormatException: For input string: "a"
	at java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
	at java.base/java.lang.Integer.parseInt(Integer.java:652)
	at java.base/java.lang.Integer.parseInt(Integer.java:770)
	at bailey_lab0b.main(bailey_lab0b.java:14)
```

- We see that there is information about some Exception which occurred for the input `String` "a". 
- Notice that the 4 and 5 were not processed in the second loop.
- The program crashed at runtime, mid-execution.

This time, the program crashed at runtime due to the `Integer` class not knowing how to convert "a" to an integer.
Later on, we will discuss exceptions and exception handling, where we will capture such exceptions and handle them.

#### Some Exercises to Address

[Try the exercises mentioned in lab0b_exercises.txt and answer any questions within that file.](./lab0b_exercises.txt) 

Be sure to include this file, editted with your answers, as a part of your submission. You will also need to explain your answers to the TA as partial credit for this lab.


### Lab0c

For the third program, make a copy of "your_last_name_lab0b.java" with a name of "your_last_name_lab0c.java". 
Make the appopriate changes to the class name in "your_last_name_lab0c.java".

We are going to add a small amount of code to catch any exceptions that are raised when converting the commandline paramters to `int`s.

For the third program, wrap the lines involving Integer.parseInt in `try` / `catch` blocks, as shown below:

```java

class bailey_lab0c
{
   public static void main (String[] args)
   {
      System.out.println("yo, I am here, and below are the commandline arguments you gave me:");
      for(int i = 0; i < args.length; i++)
      {
         System.out.println("\t arg[" + i + "] = " + args[i]);
      }
      
      for(int i = 0; i < args.length; i++)
      {
         try
         {
            int intValue = Integer.parseInt(args[i]);
            System.out.println("\t arg[" + i + "] as an int = " + intValue);
         }
         catch(NumberFormatException e)
         {
            System.out.println("\t arg[" + i + "] as an int = " + args[i] + " is not a valid integer");
         }
      }
   }
}

```

Now, whenever the `Integer.parseInt(args[i]);` statement attempts to convert a non-integer to an `int`, a `NumberFormatException` will be raised and the added code will cause the statement within the `catch(NumberFormationException e)` block to execute instead of causing the program to crash.

If you execute "java your_last_name_lab0c 0 1 2 a 4 5", you should get the following output:

```
yo, I am here, and below are the command line arguments you gave me:
    arg[0] = 0
    arg[1] = 1
    arg[2] = 2
    arg[3] = a
    arg[4] = 4
    arg[5] = 5
    arg[0] as an int = 0
    arg[1] as an int = 1
    arg[2] as an int = 2
    arg[3] as an int = a is not a valid integer
    arg[4] as an int = 4
    arg[5] as an int = 5
```

This time the program does not crash, and continues processing the rest of the commandline arguments. 

#### Getting Credit for Lab0

In this repository is a grading rubric, which gives you insight into how your lab will be graded. 
There are also things to keep in mind in there related to the four exercises found within lab0b_exercises.txt.

Demonstrate to the TA.

1. Execute lab0a.
2. Execute lab0b with commandline arguments "0 1 2 3 4 5".
3. Execute lab0b with commandline arguments "0 1 2 a 4 5".
4. Explain your answers to the four exercises found within lab0b_exercises.txt.
5. Execute lab0c with commandline arguments "0 1 2 a 4 5".

From the command line, run the following git commands to add, commit, and push your code up.

```
git add -A
git commit -m "finished lab00"
git push
```

Run ```git status```. It should tell you everything is up to date. 
Go to github and confirm that your changes reside within the remote repository. 
Your submission should include: 
- your_last_name_lab0a.java
- your_last_name_lab0b.java
- lab0b_exercises.txt
- your_last_name_lab0c.java

The corresponding ".class" files are alright to submit, but ultimately not needed, since they can be generated by compiling your source code. 

In fact, the repository has a .gitignore file, which tells git not to track .class files. So, it is very likely your compiled .class file will NOT be part of the submission, which is desirable.

Ask the TA/CA if you have any doubts with this.

### Submit Commit Hash on Brightspace

For each submission throughout the semester, you will push your finished code into your repository, as we did above. Every time we commit to our repo, a unique commit hash is created. 

To see the latest one, run the following command:

```
git rev-parse HEAD
```

You will get a long string of the commit hash printed out to you.
Copy this and submit it under Assignments > Lab00. 
# CS140-Algorithms
