# Project 1 – TypeScript Grades Table

## Aims

The aims of this project are as follows:

- To verify that you have GUI access to your VM.
- To expose you to programming in TypeScript.
- To encourage you to use advanced features of JavaScript and TypeScript in your code.
- To familiarize you with the development environment on your VM.

---

## Concepts

It is useful to nail down some abstractions related to this project.

We think of course grades as a 2-dimensional table corresponding to how they may be displayed in a UI.

- The **rows** of the table will correspond to the grades for a single student or aggregates for all students in the course.
- The **columns** of the table will contain the grades for a single assignment, aggregates for a single student, or aggregates for the row aggregates.

### Example Grade Table:
id hw1 hw2 prj1 prj2 hAvg pAvg
jfillho 80 85 88 92 82.5 90
strudy 90 96 92 98 93 95
$avg 85 90.5 90 95 87.8 92.5
$max 90 96 92 98 93 95


- The first row is a header identifying columns.
- The `id` column contains unique IDs for students or aggregate rows.
- `hw1` through `prj2` are raw data columns.
- `hAvg` and `pAvg` are calculated row aggregates.
- `$avg` and `$max` rows are column aggregates.

---

## 🔮 Future Projects

This project will be extended in future projects:

- **Project 2**: Storing grades in a database.
- **Project 3**: Exposing the grades via web services.
- **Project 4**: Adding a browser-based UI using those web services.

---

## 📁 Provided Files

The `prj1-sol` directory contains:

### `src/lib`

- **grades.ts** – Main logic to be implemented by you.
- **types.ts** – Type definitions and utilities. Critical for understanding the data structures.
- **errors.ts** – Error handling utilities (do not modify).
- **grade-utils.ts** – Helpers for loading and formatting grades.

### `src/data`

- **cs201-info.ts**, **en101-info.ts** – Describe how course sections are structured.
- **aggr-fns.ts** – Functions used to compute aggregates.
- **data.json** – Raw data file for the courses.
- **data.ts** – Typed view into `data.json`.
- **students.ts** – Student data shared across courses.
- **full-data.ts** – Adds student and aggregate data on top of `data.ts`.
- **cs201.csv**, **en101.csv** – CSV representations of course data.
- **out-data.ts** – CLI for outputting grade data as CSV/table.
- **gen.ts** – CLI used to generate random sample data.

### `src/test`

- **test/grades.ts** – Test cases for your Grades implementation.
- **test/errors.ts** – Tests for the error module.

### Project Root

- **tsconfig.json** – TypeScript config file.
- **.gitignore**, **.zipignore** – Prevent clutter in Git and zip submissions.
- **README** – This file. You must fill in the header and can include notes to the grader.

---

## Before You Begin

### TypeScript

- Use TypeScript to document and validate logic.
- Avoid using `any`; use type-safe operations.
- TS types exist at compile-time only.
- Use `typeof`, `keyof`, and utility types.
- Use `!` non-null assertions and type assertions like `k as ColId` where necessary.
- Use `structuredClone()` and `{ ...obj }` to avoid shared references.

### Testing

- Tests use **Mocha** and **Chai**.
- Use `npm test` to run all tests.
- Use `.only()` or `.skip()` to isolate tests during development.

### Error Reporting

- All methods return a `Result<T, Err>` object.
- Use `okResult(...)` and `errResult(...)` factories.
- Use `import * as E from './errors.js'`.

---

## Design Ideas

Your `Grades` class should store:

- Aggregate functions
- Student records
- Section info and grades

You may organize each section's data as a `Section` object containing enhanced headers, enrolled students, and grade data.

- Use `Record<SectionId, Section>` to manage multiple sections.
- Compute aggregates on-the-fly or cache them as needed.

---

## Suggested Steps

Follow the in-depth suggestions (provided in the full project PDF or description) to implement the following:

1. Set up your VM environment.
2. Understand `types.ts` and `grades.ts`.
3. Start with constructor and `addStudent()`.
4. Implement `addSectionInfo()` with header validation.
5. Add `enrollStudent()`, `addScore()`, `getEntry()`, and `getSectionData()`.
6. Reuse a `chkIds(...)` utility for validation.
7. Ensure error handling is consistent using `Result`.
8. Use tests as TDD checkpoints. All provided tests must pass.
9. Clean up all debugging logs before submission.
10. Complete the README header before submission.

---

## NPM Scripts (package.json)

```json
"scripts": {
  "clean": "shx rm -rf dist",
  "build": "npx tsc",
  "postbuild": "shx test -e dist/index.js && shx chmod a+x dist/index.js || true",
  "watch": "tsc --watch",
  "pretest": "npm run build",
  "test": "mocha --reporter-options maxDiffSize=128000 dist/test",
  "predebug-test": "npm run build",
  "debug-test": "mocha --inspect-brk dist/test"
}
Add "type": "module" to your package.json. Install required dev dependencies:
npm install -D typescript mocha chai shx @types/node @types/mocha @types/chai
```
Since package.json uses strict JSON syntax, be careful to avoid trailing commas.

**clean**  
Removes the dist directory which is specified as the tsc output directory by the provided tsconfig.json.

**build**  
Run the tsc compiler using options specified by tsconfig.json.

**watch**  
Rerun the tsc compiler when any of the source files change.

**test**  
Run all generated tests in the dist/test directory. The maxDiffSize reporter option allows seeing large diffs produced for failing full table tests. The pretest script will automatically be run before test, ensuring that the build is always up-to-date before testing.

**debug-test**  
Like test, but pause until connected to by the chrome debugger.

You can run any of the above scripts using `npm run script`, where script is name of the script.

Add the declaration `"type": "module",` after the scripts section in package.json.

Use `npm install -D` to install the following packages as development dependencies:  
`@types/chai`, `@types/mocha`, `@types/node`, `chai`, `mocha`, `shx`, and `typescript`.

The `@types/*` packages provide the TypeScript compiler with information about the types exported by the respective JavaScript projects.  
`mocha` is the framework used for testing, with `chai` being used for providing assertions to mocha.  
`shx` allows portable execution of some selected user commands; note that this will allow the commands to also be used on Windows.  
Installing `typescript` ensures your project uses a project-specific TypeScript installation (rather than the one installed system wide on your VM).

Build your project using `npm run build`. It should build without errors if everything was set up correctly.

Spend a few minutes poking around in the generated `prj1-sol/dist` directory and notice that the generated JS files are very similar to the source TS files. Being familiar with this directory may prove useful to track down runtime errors which are reported using line numbers in the JS files.

Run the provided tests using `npm test`. Most of the tests will fail. Deactivate all the tests by changing the top-level `describe(` in both test files to `describe.skip(`. Rerun the tests and verify that no tests are being run.

Work on the `Grades` constructor. You will need to squirrel away the `rowAggrFns` and `colAggrFns` and initialize any properties on the instance (it is usually a good idea to make them private).

When implementing a public API as for `Grades` it is normally a bad idea to share reference objects with the outside world. For example, if you squirreled away the provided reference to `rowAggrFns`, you would be in trouble if subsequently your caller executed code equivalent to:

```ts
for (const k of Object.keys(rowAggrFns)) {
  rowAggrFns[k] = null;
}


You can protect yourself against such situations by making a shallow copy using { ...rowAggrFns } which uses the JS spread syntax to make a shallow copy.

You can make deep copies using the relatively new structuredClone() method (note that a shallow copy was suggested for the aggregate functions since structuredClone() cannot handle functions).

[Similar considerations apply when returning references in API calls. If you return a reference to your internal data structures, you run the risk that your caller could modify your internals by modifying objects accessed from the reference. Once again, you can protect yourself by building the returned object so that it does not share any references with your internal data structures.]

Implement the addStudent() method. This should be a simple matter again of squirreling away the provided student argument within an instance property.

Implement the first non-trivial method addSectionInfo(). The non-triviality is due to the fact that you need to validate all the names of the aggregate functions provided for the column and row aggregate functions. This can be done by looking up each function name against the aggregate functions you squirreled away in your constructor. You should take this opportunity to enhance the provided T.SectionInfo with one enhanced with a reference to the actual function, as per the local SectionInfo type defined at the end of the provided grades.ts file.

You will need to loop through all the headers in the values in the colHdrs map from the sectionInfo argument, collecting transformed versions of them in a new list. You will need to transform only headers hdr having hdr._tag equal to aggrCol. For each such header, add in the definition for the function referenced by its aggrFnName property. If you do not find such a definition, you can return an error using code like:

const msg = `unknown RowAggrFn "${hdr.aggrFnName}"`;
return E.errResult(E.Err.err(msg, 'BAD_CONTENT'));

Repeat the process for the rowHdrs. Finally, stitch together the transformed headers and the other information in the original sectionInfo into an object which meets the enhanced type specified by the local SectionInfo type. Squirrel away this enhanced object among your instance's properties.
```




