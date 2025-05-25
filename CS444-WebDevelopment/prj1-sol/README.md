# Project 1 – Course Grade Manager (TypeScript)
**Due:** February 20, before midnight  
**Course:** CS 544 – Web Development  
**Academic Honesty Notice:** Any form of cheating results in a minimum penalty of a full letter grade reduction.

## Overview
This project implements the core logic of a course grade management system in **TypeScript**. It simulates a 2D grade table, where:
- **Rows** represent students or row aggregates (e.g., averages).
- **Columns** represent assignments or column aggregates.

Students will build and test a `Grades` class that supports:
- Adding students and sections
- Enrolling students
- Recording scores (with validation)
- Computing aggregates
- Extracting section data

## Goals
- Ensure GUI access to your VM via x2go
- Gain hands-on experience in **TypeScript**
- Practice **defensive coding**, **type safety**, and **test-driven development (TDD)**
- Prepare for future projects involving databases, web services, and browser UIs

## Project Structure
The `prj1-sol` directory must contain:
- Source code: `src/lib/grades.ts`, `types.ts`, `grade-utils.ts`, etc.
- Sample data: `src/data/*.ts`, `.json`, `.csv`
- Tests: `src/test/grades.ts`, `errors.ts`
- Config: `package.json`, `tsconfig.json`, `.gitignore`, `.zipignore`, `README`, `vm.png`

## Testing
- Tests written using **Mocha** and **Chai**
- Run tests with `npm test`
- Use `.only` / `.skip` to focus on specific tests
- All public methods must return results wrapped in `Result<Ok, Err>`

## Setup Instructions
1. Install dev dependencies:
2. npm install -D typescript mocha chai shx @types/node @types/mocha @types/chai
3. Use the provided `package.json` scripts for build/test/debug.
4. Capture a `vm.png` screenshot showing x2go terminal with output of:
     hostname; hostname -I
     ls ~/cs544
     ls ~/i?44
     crontab -l | tail -3


## Key Concepts
- TypeScript `Record` types used to map data
- Aggregate functions are passed into the `Grades` constructor
- Methods must **validate IDs and inputs**
- Use **shallow/deep copies** to avoid state leaks
- **Avoid `any`**, leverage utility types and type narrowing
- Aggregate rows/columns must be computed or cached properly

## Development Strategy
- Follow TDD: write code to make existing tests pass
- Start by implementing:
1. `Grades` constructor
2. `addStudent()`
3. `addSectionInfo()` (validates and enriches section metadata)
4. `enrollStudent()`
5. `addScore()` (with score type/range validation)
6. `getEntry()` and `getSectionData()`

## Submission
Submit a `.zip` file to Gradescope that unpacks to `prj1-sol/`, containing:
- All required source files (no `node_modules` or `dist`)
- `README`, `vm.png`, configs, and working code that passes all provided tests.

---

**Tip:** Use `npm run build` to compile and inspect `dist/` for debugging. Set breakpoints via `debugger` or Chrome dev tools with `--inspect-brk`.


