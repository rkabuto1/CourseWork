Name:		Rick Kabuto
B-Number:	B00969023
Email:		rkabuto1@binghamton.edu
--------------------------------------------------------------------------------
OVERALL FINISHED PRODUCT. AFTER RUNNING "NPM TEST" I COMPLTED 31/34 TEST CASES.

The ones I failed are 
      1) must retrieve only aggregate rows
      2) must obtain all entries for aggregate rows
      3) must obtain all raw and aggregate entries
This is because I ran out of time with the due date to finish debugging and since
I have other projects to complete. I was okay with passing 31 out of the 34 test 
cases.
--------------------------------------------------------------------------------
How the output looks on my end

errors
    ✔ should return an ok result for a simple value
    ✔ should return an ok result for a complex value
    ✔ should return an err from string with a code
    ✔ should return an err from string with a code and widget
    ✔ should return an err from Error with a code and widget
    ✔ should return an err from Object with a code
    ✔ should return an err from a non-Err object

  Grades
    adding sectionInfo
      ✔ must add section-info's
      ✔ must fail to add section-info having a bad aggrCol fn name
      ✔ must fail to add section-info having a bad aggrRow fn name
    enrolling students
      ✔ must enroll valid student
      ✔ must fail to enroll invalid student
      ✔ must fail to enroll valid student in invalid section
    add score
      ✔ must add valid scores
      ✔ must fail to add score for an unknown section
      ✔ must fail to add score for an unknown student
      ✔ must fail to add score for an unknown student
      ✔ must fail to add score for an unenrolled student
      ✔ must fail to add out-of-range scores
      ✔ must fail to add scores with the incorrect type
    get Entry
      ✔ must add and retrieve valid scores
      ✔ must fail for unknown sectionIds, studentIds or assignIds
      ✔ must fail for unenrolled student
    get section data
      ✔ must retrieve all data and aggregates
      1) must retrieve only aggregate rows
      ✔ must retrieve only selected rows
      ✔ must fail to get selected rows for unknown rowId
      ✔ must error on selected rows for known but unenrolled student
      ✔ must retrieve only selected columns
      ✔ must fail to get selected cols for unknown colId
      ✔ must retrieve only selected rows and columns
    get Entry for all kinds of data
      ✔ must obtain all entries for aggregate columns
      2) must obtain all entries for aggregate rows
      3) must obtain all raw and aggregate entries
--------------------------------------------------------------------------------

Updates and Progress on my project

Update 1. 02/17/25) Finished setting up my virtual Machine and SSH Key, and tested
the git pull and git push command to test the waters. Finally Started on my project
7:32PM 02/17/25

Update 1. 02/17/25) Finished setting up my virtual Machine and SSH Key, and tested the git pull and git push command to test the waters. Finally Started on my project
7:32PM 02/17/25

Update 2. 02/17/25) Finished Implementing addStudent, addSectionInfo, and enrollStudent. All Test cases pass for that. Ran into a lot of error testing
but was able to figure it out. Tomorrow, I am going to work on addscore, and getEntry. By Wednsday, I will finish getSectionData, and getEntry for all kinds of data
11:30PM 02/17/25


Update 3. 02/18/25) Finished Implenenting AddScore. I was able to pass all the test cases. There was a lot of runtime error checking
Spent a lot of time trying to fix  the test case to add score for an unenrolled student. Figured out the problem was a logical error in my 
if statement. Other than that, the logical approach towards the other base cases was smooth sailing. Now I have
    1) getEntry
    2) getSectionData
    3) getEntry for all kinds of data

I plan to have getEntry and getSection data done by tomorrow night and finish getEntry for all kinds of data by Thursday
9:18PM 02/18/25

Update 4. 02/19/25) Finished Implementing getEntry. All test cases pass. Now I have to finish getSectionData, getEntry for all kinds of data tomorrow.
9:03Pm 02/19/25

Update 5. 02/20/25) Project is due and I finished getEntry for all kinds of data and getSectionData. This took a very long time to do. Almost the whole
day. But i was able to finish this project completing 31 out of the 34 test cases so I am okay passing with this. 


--------------------------------------------------------------------------------