# Project 4 – Grades Single Page App (DOM + Fetch)

**Due:** April 24, before midnight  
**Course:** CS 544 – Web Development  
**Note:** No late submissions. Academic honesty violations will result in a letter grade penalty.

## Overview

In this project, you will build a **Single-Page Application (SPA)** using **TypeScript**, the **DOM API**, and the **Fetch API**. Your client-side app will interact with the grade management backend (Project 3) over HTTPS and allow users to view and update student grades in the browser.

## Objectives

- Use browser APIs (DOM and Fetch) to build an interactive web interface
- Dynamically render HTML tables from remote data
- Support inline editing of grade fields
- Display errors in the GUI
- Cache data in-browser using a wrapped `Grades` object

## Architecture

- **Backend**: Project 3 web service (`https://localhost:2345`)
- **Frontend**: Served by Parcel on `http://localhost:2346`
- **App behavior**:
  - Loads HTML/CSS/JS via Parcel
  - Fetches data via HTTP from backend
  - Dynamically constructs a table of student grades

## Functional Requirements

- Must be bundled with Parcel and run via `npm start`
- Editable fields must use `<input>` elements; others use `<span>`
- All data elements must include `data-sectionId`, `data-rowId`, and `data-colId` attributes
- DOM manipulation and table rendering done in `app.ts`
- Grade updates are sent to the backend via `PATCH` requests
- Errors must be shown on screen via provided `errors()` function

## File Structure

- `app.ts`: DOM handling, event registration, table rendering
- `ws-grades.ts`: Cache and validation layer wrapping `Grades`
- `grades-ws.ts`: Low-level fetch wrapper for Project 3 web services
- `index.ts`: Entry point that initializes the app
- `index.html`, `style.css`: Static layout and styles (do not edit)
- `package.json`, `tsconfig.json`: Configuration (already set up)
- `extras/*.html`: Reference output for editable and non-editable tables

## Setup and Usage

1. Install dependencies:
   ```bash
   npm ci
   ```

2. Start Project 3 server (must be running on https://localhost:2345)

3. Accept the self-signed certificate in your browser by visiting https://localhost:2345

4. Build and launch the frontend:
   ```bash
   tsc
   npm start
   ```

5. Navigate to:
   ```
   http://localhost:2346
   ```

## Development Tips

- Use `npm run watch` for auto-compilation
- Use Chrome DevTools for debugging (F12):
  - **Console**: Check for errors
  - **Network**: Inspect API calls
  - **Elements**: Inspect table structure
- Use `npm run clean` if Parcel caching misbehaves

## Submission

- Submit a zip file containing `prj4-sol/` (no node_modules, dist, or cache directories)
- Project must build with `tsc` and launch with `npm start`
- All functionality must work as described
- README must be completed with your name, B-number, and email

## Summary

You will create a working, interactive frontend that integrates your entire grades system:
- Calls web services via `fetch`
- Dynamically builds a gradebook table using DOM APIs
- Updates backend with edited scores
- Handles and displays errors
- Wraps Project 1 logic inside a client cache

This project demonstrates full-stack integration from backend API to interactive web GUI.
