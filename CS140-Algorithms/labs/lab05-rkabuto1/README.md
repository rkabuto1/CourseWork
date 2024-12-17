--------
Lab05
--------

## Description

For lab5 we will be doing the following:

- Create a simple program using eclipse (lab05a)
	- Create a project
	- Create a class within the project
	- Execute the main method within the class
- Create a second simple program using eclipse (lab05b)
	- Create a project
	- Create a class within the project
	- Execute the main method within the class with commandline arguments
	- Execute the main method within the class with commandline arguments causing it to crash
	- Add a breakpoint to the main method and debug the program, stopping at the breakpoint and examining a couple of variables

## Screenshot Requirements

Everyone needs to create their own version of the projects
You can provide as much assistance to other students as you want - this is not considered cheating for this lab

- Once everything is working, capture screenshots and put them in the **screenshots** directory of this repository demonstrate:
1. your two programs
2. that you can use the debugger, and 
3. that you did the linux commands outlined below

See the `required.txt` file found in the screenshots directory.

Additionally, there are details of what to demonstrate below.

**NOTE:** Your grade will be dependent on these screenshots, so be sure to submit them.

## Developing in Eclipse - an IDE (integrated development environment)

- You can opt to use x2go and log into remote140
- Start x2go, log into remote140, open a terminal, execute `eclipse`
- **Note:** To log into remote140 you need to use the pulse secure VPN

- Alternatively, you could download eclipse on your personal machine (I'm fine with whichever you prefer)
- If you are utilizing another IDE, you'll have to make sure you can get JUnit5 working in it so you can do testing for the remainder of the semester.
- I am willing to attempt to help you out if you run into issues during office hours.

- As we go, there are some screenshots that will ideally help

## Creating a workspace

When eclipse starts, it will ask where you want to put your workspace. The default location should be fine.

![00](pngs/00_eclipse_workspace)

- Once you've selected a location, click launch. It might take you to a welcome screen if you are running eclipse for the first time. Feel free to close the welcome screen, or explore the information there at your leisure.

- Once you close the welcome screen, it should bring you to a view of the package explorer.

![01](pngs/01_package_explorer)


## Importing your git repository into eclipse

- Go ahead and clone lab05 from github as you usually do, **but within the create eclipse workspace**. 
	- You can accomplish this by doing a cd command into the eclipse workspace, and cloning the repository in there.
- We are going to **import** it into eclipse, so you can develop in the IDE, but have git track your changes as usual.

1. Once you are done cloning the repo in your workspace, back in eclipse, select "file" then "import".

![02](pngs/02_eclipse_import)

2. On the import page, choose the "Git" -> "Projects from Git" in the import wizard and hit next.

![03](pngs/03_git_wizard)

3. It will ask you to select the repository source. Click "Existing local repository", if you already cloned it.
	- You could also utilize "Clone URI" if you haven't cloned it yet, but that won't be covered here.
	- Let's assume we already cloned it as we've been doing all semester.
	- Hit "Next"

![04](pngs/04_repo_wizard)

4. Click "Add..." which will bring you to an area to search for the clone repository

![05](pngs/05_select_repo)

5. Click "Browse..." and find the repo you cloned. Select it via the "Select Folder" button.

![06](pngs/06_browse_repo)
![06b](pngs/06b_file_explorer)


6. You should see that it has found the hidden .git directory (which is present in all git repos).
	- Ensure the check box corresponding to this hidden git folder is checked on.
	- Hit the Add button near the bottom.

![07](pngs/07_choose_hidden_git_check)

7. In the next screen, should see that "lab05-YOUR_GIT_USN [main]" is shown. Select "Next".

![08](pngs/08_resolved_git)

8. In the next window, select the radio button that says "Import Using the New Project wizard". Select "Finish".

![09](pngs/09_import_as_new_wizard)

9. In the New Project window, select the "Java" -> "Java Project". Hit "Next".

![10](pngs/10_java_project_wizard)

10. Important: In the next window:
	- uncheck the default location, then "Browse" for where you cloned your repository on the system.
	- The JRE should point to some version of Java, ideally 16 or higher (mine is Java 17)
	- Unselect the checkbox "Create module-info.java file". Hit "Next".

![11](pngs/11_create_java_project)

13. It will bring you to Java settings. Leave these settings alone, and hit "Finish".

![12](pngs/12_finished_import)

If you did the steps properly, you should see the following in your package explorer:

![13](pngs/13_successful_import)


Note that lab05a and lab05b are just a copy of what we did in lab0, back in the beginning of the semester. 

## Running the Programs

### To execute the lab05a program:

1. Right click on the project lab05a directory in Package Explorer
2. Select “Run as Java Application”

![14](pngs/14_run_lab05a)

3. You should see “yo, I am here” in the console window at the bottom of the eclipse window.

![15](pngs/15_console_lab05a)

### Execute the lab05b program:

- lab05b is another folder in the repo
- You can execute it the same as lab05a

- To run with commandline arguments:

1. Select the project
2. Select “Run as”
3. Select “Run Configurations”

![16](pngs/16_run_configs_lab05b)

4. Select “(x)= Arguments” and type “0 1 2 3 4 5” in the the “Program arguments” box, without the double quotes
5. Click the “Run” button at the bottom of the “Run Configurations” window

![17](pngs/17_arguments_lab05b)

You should see the below in the “Console” window

![18](pngs/18_console_lab05b)


## Raising an exception in lab05b

- Run it again, but this time give it command line arguments of “0 1 2 a 4 5”
- This time we get an error, due to attempting to convert “a” into an integer
- Below is what you should get (or something similar)

![19](pngs/19_exception_lab05b)


## Debugging the program

- We now want to debug the program
- Select “Debug As”
- Select “Java Application”

![20](pngs/20_debug_lab05b)

- If prompted, select to use the Debug perspective
- Select your class if you were put into the Integer class
- You can close “Integer.class” if it was opened

![21](pngs/21_integer_class_throw)


- In your main method, double click on the line number section of the line with “int intValue = Integer...” or select “Toggle Breakpoint”. 

![22](pngs/22_toggle_breakpoint)

You should see a blue circle to indicate a break point is set there.

![23](pngs/23_breakpoint_shown)

- Select the red square button at the top of the eclipse window to terminate the debug session.

![24](pngs/24_terminate_debug_session)

- Restart debugging the program (select “relaunch”)

![25](pngs/25_relaunch_debug_session)

- At this point, the program should be stopped with the line highlighted that we added the breakpoint at

![26](pngs/26_hitting_breakpoint)

- Hover your mouse over “args.length”, and a window should popup signifying the value is 6

![27](pngs/27_args_length_hover)

- Hover your mouse over “args” of “args[i]” and you should get a list of the commandline arguments

![28](pngs/28_args_array_hover)

- Hover over “i” of “args[i]” and you should get a value of 0

![29](pngs/29_index_hover)

- Clicking “Step Over” will continue eventually get you back into “Integer.class” were the error is happening and the debug session should end

![30](pngs/30_step_over)

- If you step a few times, you can also see the values of the variable changing in the debugger, on the right hand side:

![31](pngs/31_variable_view)

## Unix / linux / macos Commands

- If you are not familiar with unix/linux, you need to become at least a little familiar with it for future classes
- Open a terminal
- Note: Don't close the terminal until you get the final screenshot, show casing you did the commands mentioned below.

### The pwd command

- Execute “pwd”
- It should Print the current Working Directory

### The ls command

- Execute “ls -d eclipse-*”
- It should print out a list of your eclipse directories
- Mine returns eclipse-workspace
“ls” is the command to list directory contents
- The “-d” parameter tells the command to list directories instead of their content

- Execute “ls -l eclipse-*”
- “ls -l” is the “long” version of the “ls” command
- It returns the listing, with additional information, such as the file permissions (the “drwxr-x---”), the file owner, the file size, and the last modification date and time

### Utilizing the manual command

- Execute “man ls” and you will see the manual content for the “ls” command
- If you enter the “f” key if will move forward one page, and if you enter “b” it will move backwards one page
- Entering “q” will exit from the manual page

### Listing recursively

- Executing “ls -lar” will do a recursive directory listing of the current directory, including files that start with “.”
- Files that start with “.” are not included in “ls” without the “-a” option

### The cd command

- Execute “cd eclipse-workspace”
- You can type “cd ecli” and then hit the tab key and the
command shell will attempt to complete the filename for you
- Where “eclipse-workspace” is the eclipse workspace directory name
- “cd” is the Change Directory command
- “/” is the directory seperator in unix/linux/macos

### Viewing the contents in your repository

- Within your clone git repository, execute “ls -la lab05"
- You should see 7 (or more) files
- . (this is the directory itself)
- .. (this is the parent directory of lab0b)
- .classpath
- .git
- .gitignore
- .project
- README.md
- bin (this is where your compiled .class files reside)
- lab05a
- lab05b
- pngs
- screenshots (this is the directory for you to place your screenshots)

### The cp command

- Execute “cp -r lab05a copy_of_lab05a”
- This will recursively copy the directory lab05a to copy_of_lab05a

### The rm command

- Execute “rm copy_of_lab05a”
- This will attempt to delete (remove) copy_of_lab05a, but will fail, since copy_of_lab05a is a directory
- Execute “rm -r copy_of_lab05a”
- This will recursively delete copy_of_lab05a and all of it's content

### Run the code via the command line

- Execute “cd lab05b”
- Compile lab05b.java from the the commandline
- We already know how to do this
- Execute lab05b with commandline parameters “0 a”
- We already know how to do this
- We see it crash when attempting to convert “a” to an int

### The find command

- Execute “cd ..”
- This will return us to lab05b's parent directory
- Execute “find ./ -name '*.[a-z][al]*' -print
- This will return a list of files in the current directory and subdirectories that include a “.” followed by a letter in the range “a” - “z” followed by one of the letters “a” or “l” 
- This should print the two java files and the two corresponding class files, along with any other files that match the above
- Executing “man find” will give you more information about the find command

### For loop via the terminal

Similar to how we do in java, there is a means to perform a for loop in the terminal:

- Execute “for i in `find ./ -name 'l*.[cj][al]*' -print`; do ls -l $i; done”
- This will find the two java files and classes, and then do an “ls -l” on each of the found files
- This is just to show that shell programming has some impressive functionality

### Files and Diretories named with spaces cause issues

- **NOTE:** Filenames with a blank space in them will cause the “ls -l $i” some unhappiness

## Credit for Lab05 

Once you have everything working (lab05a, lab05b), to get credit for lab05:

Capture screenshots to show case the following:

1. Execution of lab05a
2. Execution lab05b with commandline arguments “0 1 2 3 4 5”

Debug lab05b with a breakpoint at the line with “int intValue = Integer...” with commandline arguments “0 1 2 a 4 5” show the values with the debugger for

3. Screenshot showing “args.length”is 6
4. Screenshot showing “args” of “args[i]” is [0, 1, 2, a, 4, 5]
5. Screenshot showing “i” of “args[i]” has a value of 0

In the terminal you did the linux command in, run the command "history" without the quotes. This will show all the commands you have recently run.

6. Take a screenshot show casing you worked through them.

**Note:** Place All the screenshots in the provided `screenshots` directory, residing in this repository.

## Submission 

Be sure to push up all your screenshots to github, and submit the latest commit hash on brightspace:

```
git add -A
git commit -m "completed lab05"
git push
git rev-parse HEAD
```
