# Project 2 – Grades Database with MongoDB (TypeScript)

**Due:** March 19, before midnight  
**No late submissions allowed**  
**Course:** CS 544 – Web Development

## Overview

This project extends Project 1 by adding persistent storage using **MongoDB**. You will implement a new `DbGrades` class that wraps around your `Grades` logic from Project 1 and a custom **Data Access Object (DAO)** that handles all MongoDB interactions. The design enforces **separation of concerns** between validation (in-memory cache) and persistence (database).

## Objectives

- Practice asynchronous programming in TypeScript
- Work with MongoDB and its native Node.js driver
- Design a custom DAO API for persistent data storage
- Integrate caching with a functional core (`Grades`) and an imperative shell (`DbGrades`)

## Project Structure

Your final zip archive must unpack to a directory `prj2-sol/` with:

- `db-grades.ts`: Core wrapper around Project 1 logic, manages the cache and DB sync
- `grades-dao.ts`: MongoDB access layer (strongly recommended to use this file)
- `index.ts`, `main.ts`: Provided CLI entry points (do not modify)
- `test/`: Contains test suites (`mem-db-server.ts`, `db-grades.ts`)
- `extras/LOG`: Shows expected command-line behavior
- `tsconfig.json`, `package.json`, `package-lock.json`, `.gitignore`, `.zipignore`, `README`

## Build and Run

To build and run:

```bash
npm ci
npm run build
./dist/index.js
```

You should see a usage message. All MongoDB functionality will be triggered through CLI commands.

## Development Strategy

1. Implement a **GradesDAO** class in `grades-dao.ts` with MongoDB methods (connect, insert, find, update, delete).
2. Implement `makeDbGrades()` in `db-grades.ts` using an async factory pattern.
3. Maintain a `Grades` cache inside `DbGrades`, synchronizing it with the database.
4. Use a validate → update-db → update-cache flow for mutations.
5. All read operations should serve from the cache.

## MongoDB Notes

- Use `_id` as the primary key for documents (e.g., student ID, section ID).
- Only store **raw scores** in the database; compute aggregates on-demand in memory.
- Use `updateOne` with `upsert` to insert/update efficiently.
- Create indexes where helpful, but avoid over-indexing.
- Remember to **close** MongoDB connections after use to avoid hanging processes.

## Testing

- Use `mongodb-memory-server` for in-memory database testing.
- All tests use Mocha and async/await.
- Activate test suites incrementally by removing `.skip` and using `.only` to isolate failing tests.
- Use `beforeEach` and `afterEach` to ensure test isolation.

## Command-Line Tool

Example commands after building:

```bash
./dist/index.js --out=json mongodb://localhost:27017 mydb aggrGrades CS101
./dist/index.js --out=text mongodb://localhost:27017 mydb studentGrades CS101 alice
```

## Tips

- Use `await` for all asynchronous MongoDB calls.
- Use TypeScript’s generic types to specify document structure: `db.collection<Student>('students')`
- Follow functional core + imperative shell architecture: keep side effects isolated.
- Store data in a way that allows MongoDB queries to do the filtering and aggregation.

## Submission Checklist

- All required files present in `prj2-sol/`
- All tests pass via `npm test`
- Command-line tool behaves as expected
- MongoDB connections are properly opened and closed
- README contains your name, B-number, and email

## Reminder

All code must follow the Academic Honesty Policy. Cheating will result in a minimum penalty of one full letter grade reduction.
