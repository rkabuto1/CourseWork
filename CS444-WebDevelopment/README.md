# CS 444 Projects 1–4 Summary

This series of four projects incrementally builds a complete course grade management system across the full web stack:

## Project 1: Core Grade Model (TypeScript)
- Implements a 2D gradebook model with row/column aggregates
- Defines types and validation rules
- Provides in-memory manipulation of course grades
- Foundation for all later projects

## Project 2: Persistent Backend (MongoDB)
- Wraps the Project 1 model with a persistence layer
- Stores students, sections, and scores in MongoDB
- Implements a DAO API to interact with the database
- Adds asynchronous programming using `async/await`

## Project 3: RESTful Web Services (Express.js)
- Exposes Project 2 functionality via HTTPS endpoints
- Implements REST API with Zod validation and consistent response envelopes
- Includes full integration testing with Supertest
- Enables external access to the grade system

## Project 4: Interactive Web App (DOM + Fetch)
- Implements a single-page application using the Fetch API
- Calls Project 3 web services to display and update data in real time
- Uses DOM manipulation to dynamically build an HTML grade table
- Demonstrates full-stack integration from browser to database

Each project builds upon the previous:
- Project 1 provides core logic
- Project 2 adds persistence
- Project 3 adds network access
- Project 4 adds a frontend UI

### Example Picture of the Complete & Finished Product
![Screenshot 2025-05-25 at 3 49 41 PM](https://github.com/user-attachments/assets/adb666ff-4930-412a-a6d7-91a5e4c689e7)

