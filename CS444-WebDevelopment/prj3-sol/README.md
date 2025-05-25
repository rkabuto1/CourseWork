# Project 3 – REST API for Course Grades (Express + TypeScript)

**Due:** April 6, before midnight  
**Course:** CS 544 – Web Development  
**Note:** No late submissions. Academic honesty violations result in a minimum one letter grade penalty.

## Overview

This project builds a RESTful API for managing course grades using **Express.js** and **TypeScript**. It connects HTTP requests to your existing `DbGrades` backend (from Project 2), validates input using **Zod**, and returns standardized JSON **response envelopes**.

## Objectives

- Learn Express.js for building REST APIs
- Validate inputs using Zod schemas
- Connect to existing business logic from Project 2
- Return consistent success/error JSON envelopes
- Test web services using Supertest

## Required Endpoints

All endpoints are rooted at `/api` by default. All responses must be JSON and wrapped in standardized envelopes. All inputs must be validated using Zod schemas.

### Students
- `PUT /api/students` — Add/replace student (body: Student), returns 201 with `Location`
- `GET /api/students/:studentId` — Retrieve a student

### Sections
- `PUT /api/sections/info` — Add/replace section info (body: SectionInfoSpec), returns 201 with `Location`
- `GET /api/sections/:sectionId/info` — Retrieve section info

### Enrollments
- `PUT /api/sections/:sectionId/students` — Enroll student (body: StudentId)

### Scores
- `PATCH /api/sections/:sectionId/data/:studentId/:assignId` — Add/replace a score (body: Score)
- `PATCH /api/sections/:sectionId/data/:studentId` — Add/replace multiple scores (body: map from ColId to Score)
- `GET /api/sections/:sectionId/data/:rowId/:colId` — Retrieve a single entry

### Section Data
- `GET /api/sections/:sectionId/data` — Retrieve section data with query parameter `kind`:
  - `all`, `raw`, `student`, `aggrRows`, `select`
  - Optional `colId` and `rowId` for `select`
  - Response type: SectionData

## Development and Testing

- You must modify `grades-ws.ts` to define all Express routes.
- All input validation must use schemas from `prj1-sol` or custom Zod schemas.
- All response bodies must use envelope format from `response-envelopes.ts`.
- Testing is done using **Mocha + Supertest** in `test/grades-ws.ts`.
- Activate tests by removing `.skip`; use `.only` to isolate tests.
- Implement the three TODO tests for edge cases in student retrieval.

## Provided Setup

- `grades-ws.ts`: Main Express app (edit this)
- `response-envelopes.ts`: JSON envelope structure
- `ws-utils.ts`: Helper functions (e.g., mapResultErrors, selfHref)
- `test/grades-ws.ts`: Supertest-based test suite
- `config.mjs`: HTTPS server config
- `index.ts`, `main.ts`: CLI entry point to start HTTPS server

## Build and Run

To build and start the server:

```bash
npm ci
npm run build
./dist/index.js config.mjs
```

To run with auto-reload:

```bash
node --watch ./dist/index.js config.mjs
```

To load test data and start:

```bash
./dist/index.js --load config.mjs
```

Access example:
```bash
curl -s -k https://localhost:2345/api/sections/cs201/info | jq .
```

## Dependencies

Install these:

```bash
npm install express body-parser cors http-status zod
npm install -D typescript mocha chai supertest mongodb-memory-server   @types/express @types/mocha @types/chai @types/node @types/cors @types/supertest   shx
npm install https://sunybing:sunybing@zdu.binghamton.edu/cs544/lib/prj2-sol-0.0.1.tgz
```

## Certificate Setup

Generate self-signed certs:

```bash
~/cs544/bin/gen-localhost-cert.sh
```

Certs will be in `~/tmp/localhost-certs`.

## Grading and Submission

- All tests must pass: run `npm test`
- API must conform to the spec and return correctly structured responses
- Submit only the `prj3-sol/` directory (no `node_modules`, no `dist`)
- Your `README` must be completed with your name, B-number, and contact info

## Summary

This project requires you to:
- Build RESTful APIs in Express
- Validate using Zod
- Forward all logic to `DbGrades`
- Return standardized envelopes
- Write and pass HTTP tests using Supertest

Ensure correctness, pass all tests, and follow architectural best practices.
