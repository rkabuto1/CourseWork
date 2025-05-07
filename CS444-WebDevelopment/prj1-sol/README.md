Due: Feb 20, before midnight.

Important Reminder: As per the course Academic Honesty Statement, cheating of any kind will minimally result in your letter grade for the entire course being reduced by one level.

This document first provides the aims of this project, followed by a discussion of its background including relevance to future projects. It then lists the requirements as explicitly as possible. It then hints at how these requirements can be met.

Aims
The aims of this project are as follows:

To verify that you have GUI access to your VM.

To expose you to programming in TypeScript.

To encourage you to use advanced features of JavaScript and TypeScript in your code.

To familiarize you with the development environment on your VM.

Background
Computing overall class grades for CS 544 is quite straight-forward when using a spreadsheet, but seemingly beyond the capability of brightspace (according to previous TAs). In this project, we will build an application capable of maintaining course grades for courses similar to this one.

Concepts
It is useful to nail down some abstractions related to this project.

We think of course grades as a 2-dimensional table corresponding to how they may be displayed in a UI.

The rows of the table will correspond to the grades for a single student or aggregates for all students in the course.

The columns of the table will contain the grades for a single assignment or aggregates for a single student or aggregates for the row aggregates.

Here is an example of a grade table:

  id         hw1  hw2  prj1 prj2  hAvg  pAvg
  jfillho     80   85    88   92  82.5    90
  strudy      90   96    92   98    93    95
  $avg        85 90.5    90   95  87.8  92.5
  $max	      90   96    92   98    93    95
The first row above is simply a header containing column ids identifying the columns. There are two rows for two students plus two rows for derived course-wide average and max aggregates.

... (content truncated for brevity in this preview)

Complete and submit your project as per the generic working directions.
