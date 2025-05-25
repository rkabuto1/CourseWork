# Project 1 – TypeScript Course Grade Manager

## Overview

This project implements the core logic of a course grade management system using **TypeScript**. Students are tasked with developing a class that models course data as a 2D grade table, supports data validation, computes row/column aggregates, and passes a suite of automated tests. The project is designed to prepare students for larger, multi-phase development involving database storage, web services, and browser-based UIs.

## Aims

- Verify GUI (x2go) access to your VM.
- Gain experience with TypeScript and modern JavaScript.
- Learn to leverage type safety and utility features in TS.
- Prepare for future projects involving persistence and front-end UIs.

## Concepts

- Grades are modeled as a **2D table**.
- **Rows** represent students or row-based aggregates (e.g., average).
- **Columns** represent assignments or column aggregates (e.g., max).
- Data is stored in nested maps:
  ```ts
  type RowData = Record<ColId, Entry>;
  type SectionData = Record<RowId, RowData>;

## Example Grade Table
id hw1 hw2 prj1 prj2 hAvg pAvg
jfillho 80 85 88 92 82.5 90
strudy 90 96 92 98 93 95
$avg 85 90.5 90 95 87.8 92.5
$max 90 96 92 98 93 95


**Interpretation:**
- Rows 1–2: Raw student scores  
- Columns `hw1–prj2`: Raw assignment grades  
- `hAvg` / `pAvg`: Row aggregates  
- `$avg` / `$max`: Column aggregates  

---

## Requirements

- Submit a `.zip` that expands into `prj1-sol/`
- Must contain:
  - `README`
  - `package.json`
  - `package-lock.json`
  - `tsconfig.json`
  - `vm.png`
- **Must NOT contain**:
  - `node_modules/`
  - `dist/`

### To run tests:

<pre><code>npm ci
npm run test
</code></pre>

---

## VM Validation

The screenshot `vm.png` must show this terminal output inside an x2go window:

<pre><code>hostname; hostname -I
ls ~/cs544
ls ~/i?44
crontab -l | tail -3
</code></pre>

---

## Provided Files





