import cors from 'cors';
import Express from 'express';
import bodyparser from 'body-parser';
import assert from 'assert';
import STATUS from 'http-status';

import { z } from 'zod';

import { DbGrades, makeDbGrades, Grades, Types as T, Errors as E,
         ZodSchemas as Z, validate, }
  from 'prj2-sol';


import { selfHref, selfResult, mapResultErrors, } from './ws-utils.js';

//Based on 
//<https://plainenglish.io/blog/typed-express-request-and-response-with-typescript>
//Instead of depending on express.js types, specify query-string types
type RequestWithQuery = Express.Request
  & { query: { [_: string]: string|string[]|number } };

export type App = Express.Application;

type ServeRet = {
  app: App,
  close: () => void,
};

type SERVER_OPTIONS = {
  base?: string,
};
    
export function serve(model: DbGrades, options: SERVER_OPTIONS={})
  : ServeRet
{
  const app = Express();
  app.locals.model = model;
  const { base = '/api',  } = options;
  app.locals.base = base;
  setupRoutes(app);
  return { app, close: model.close, };
}


function setupRoutes(app: Express.Application) {
  const base = app.locals.base;

  //allow cross-origin resource sharing
  app.use(cors(CORS_OPTIONS));

  //assume that all request bodies are parsed as JSON
  //making strict false assumes that JSON primitives are also parsed
  app.use(Express.json({strict: false}));

  //if uncommented, all requests are traced on the console
  //app.use(doTrace(app));
  
  app.put(`${base}/students`, doAddStudent(app));
  app.get(`${base}/students/:studentId`, doGetStudent(app));
  app.put(`${base}/sections/info`, doAddSectionInfo(app));
  app.get(`${base}/sections/:sectionId/info`, doGetSectionInfo(app));
  app.put(`${base}/sections/:sectionId/students`, doEnrollStudent(app));
  app.patch(`${base}/sections/:sectionId/data/:studentId/:assignId`,
	    doAddScore(app));
  app.patch(`${base}/sections/:sectionId/data/:studentId`,
	    doAddScores(app));
  app.get(`${base}/sections/:sectionId/data/:rowId/:colId`, doGetScore(app));
  app.get(`${base}/sections/:sectionId/data`, doGetSectionData(app));

  /*
  //following methods not required from student submissions
  app.get(`${base}/section/:sectionId/students`, doGetEnrolledStudentIds(app));
  app.delete(`${base}/section/:sectionId`, doRmSection(app));
  app.put(`${base}/section/:sectionId`, doLoadSection(app));
  app.delete(`${base}`, doClear(app));
  */
  
  //must be last
  app.use(do404(app));  //custom handler for page not found
  app.use(doErrors(app)); //custom handler for internal errors
}

function doTrace(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response, 
			 next: Express.NextFunction) {
    console.log(req.method, req.originalUrl);
    console.log("query", JSON.stringify(req.query));
    console.log("body", JSON.stringify(req.body));
    next();
  });
}

function doAddStudent(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const chkResult = validate<T.Student>(Z.Student, req.body);
      if (!chkResult.isOk) throw chkResult;
      const student = chkResult.val;
      const result = await app.locals.model.addStudent(student);
      if (!result.isOk) throw result;
      const studentId = student.id;
      res.location(selfHref(req, studentId));
      const response =
	selfResult<void>(req, undefined, STATUS.CREATED);
      res.status(STATUS.CREATED).json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

function doGetStudent(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const studentId0 = req.params.studentId;
      const chkResult =	validate<T.StudentId>(Z.StudentId, studentId0);
      if (!chkResult.isOk) throw chkResult;
      const studentId = chkResult.val;
      const result = await app.locals.model.getStudent(studentId);
      if (!result.isOk) throw result;
      const student = result.val;
      const response = selfResult<T.Student>(req, student);
      res.json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

function doAddSectionInfo(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const chkResult =
	validate<T.SectionInfoSpec>(Z.SectionInfoSpec, req.body);
      if (!chkResult.isOk) throw chkResult;
      const sectionInfoSpec = chkResult.val;
      const sectionInfo = T.specToSectionInfo(sectionInfoSpec);
      const result = await app.locals.model.addSectionInfo(sectionInfo);
      if (!result.isOk) throw result;
      res.location(`${app.locals.base}/sections/${sectionInfo.id}/info`);
      const response = selfResult<void>(req, undefined);
      res.json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

function doGetSectionInfo(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const sectionId = req.params.sectionId;
      const result = await app.locals.model.getSectionInfo(sectionId);
      if (!result.isOk) throw result;
      const response = selfResult<T.SectionInfo>(req, result.val);
      res.json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

function doEnrollStudent(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const { sectionId } = req.params;
      const chkResult = validate<T.StudentId>(Z.StudentId, req.body);
      if (!chkResult.isOk) throw chkResult;
      const studentId=  chkResult.val;
      const result =
	await app.locals.model.enrollStudent(sectionId, studentId);
      if (!result.isOk) throw result;
      const response = selfResult<void>(req, result.val);
      res.json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

function doAddScore(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const { sectionId, studentId: studentId0, assignId } = req.params;
      const chkResult1 = validate<T.StudentId>(Z.StudentId, studentId0);
      if (!chkResult1.isOk) throw chkResult1;
      const studentId = chkResult1.val;
      const chkResult2 = validate<T.Score>(Z.Score, req.body);
      if (!chkResult2.isOk) throw chkResult2;
      const score = chkResult2.val;
      const result =
	await app.locals.model.addScore(sectionId, studentId, assignId, score);
      if (!result.isOk) throw result;
      const response = selfResult<void>(req, result.val);
      res.json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

const AssignScores = z.record(z.string(), Z.Score);
type AssignScores = z.infer<typeof AssignScores>;

function doAddScores(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const { sectionId, studentId: studentId0 } = req.params;
      const chkResult1 = validate<T.StudentId>(Z.StudentId, studentId0);
      if (!chkResult1.isOk) throw chkResult1;
      const studentId = chkResult1.val;
      const chkResult2 = validate<AssignScores>(AssignScores, req.body);
      if (!chkResult2.isOk) throw chkResult1;
      const assignScores = chkResult2.val;
      for (const [assignId, score] of Object.entries(assignScores)) {
	const result =
	  await app.locals.model.addScore(sectionId, studentId,
					  assignId, score);
	if (!result.isOk) throw result;
      }
      const response = selfResult<void>(req, undefined);
      res.json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

function doGetScore(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const { sectionId, rowId, colId } = req.params;
      const result =
	await app.locals.model.getEntry(sectionId, rowId, colId);
      if (!result.isOk) throw result;
      const response = selfResult<void>(req, result.val);
      res.json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

const AllQuery = z.object({
  kind: z.literal('all'),
});

const RawQuery = z.object({
  kind: z.literal('raw'),
});

const StudentQuery = z.object({
  kind: z.literal('student'),
  studentId: Z.StudentId,
});

const AggrRowsQuery = z.object({
  kind: z.literal('aggrRows'),
});

			    
const SelectQuery = z.object({
  kind: z.literal('select'),
  colId:z.array(Z.ColId).optional(),
  rowId:z.array(Z.RowId).optional(),
});

const SectionDataQuery = z.union([
  AllQuery, RawQuery, StudentQuery, AggrRowsQuery, SelectQuery,
]);
			    

type SectionDataQuery = z.infer<typeof SectionDataQuery>;

function doGetSectionData(app: Express.Application) {
  return (async function(req: Express.Request, res: Express.Response) {
    try {
      const { sectionId } = req.params;
      const chkResult = validate<SectionDataQuery>(SectionDataQuery, req.query);
      if (!chkResult.isOk) throw chkResult;
      const dataReq = chkResult.val;
      let result;
      switch (dataReq.kind) {
	case 'all':
	  result = await app.locals.model.getSectionData(sectionId);
	  break;
	case 'raw':
	  result = await app.locals.model.getRawData(sectionId);
	  break;
	case 'student':
	  result =
	    await app.locals.model.getStudentData(sectionId, dataReq.studentId);
	  break;
	case 'aggrRows':
	  result = await app.locals.model.getAggrRows(sectionId);
	  break;
	case 'select':
	  result = await app.locals.model.getSectionData(sectionId,
							 dataReq.rowId ?? [],
							 dataReq.colId ?? []);
	  break;
	  
      }
      if (!result.isOk) throw result;
      const data = result.val;
      const response = selfResult<void>(req, data);
      res.json(response);
    }
    catch(err) {
      const mapped = mapResultErrors(err);
      res.status(mapped.status).json(mapped);
    }
  });
}

/** Default handler for when there is no route for a particular method
 *  and path.
 */
function do404(app: Express.Application) {
  return async function(req: Express.Request, res: Express.Response) {
    const message = `${req.method} not supported for ${req.originalUrl}`;
    const result = {
      status: STATUS.NOT_FOUND,
      errors: [	{ code: 'NOT_FOUND', options: {},  message, }, ],
    };
    res.status(404).json(result);
  };
}

/** Ensures a server error results in nice JSON sent back to client
 *  with details logged on console.
 */ 
function doErrors(app: Express.Application) {
  return async function(err: Error, req: Express.Request, res: Express.Response,
			next: Express.NextFunction) {
    const message = err.message ?? err.toString();
    const [status, code] = (err instanceof SyntaxError)
      ? [STATUS.BAD_REQUEST, 'SYNTAX' ]
      : [STATUS.INTERNAL_SERVER_ERROR, 'INTERNAL'];
    const result = {
      status: STATUS[status],
      errors: [ { options: { code }, message } ],
    };
    res.status(status).json(result);
    if (status === STATUS.INTERNAL_SERVER_ERROR) console.error(result.errors);
  };
}




/**************************** CORS Options *****************************/

/** options which affect whether cross-origin (different scheme, domain or port)
 *  requests are allowed
 */
const CORS_OPTIONS = {
  //if localhost origin, reflect back in Access-Control-Allow-Origin res hdr
  // origin: /localhost:\d{4}/,
  
  // simple reflect req origin hdr back to Access-Control-Allow-Origin res hdr
  origin: true,

  //methods allowed for cross-origin requests
  methods: [ 'GET', 'PUT', 'PATCH', ],

  //request headers allowed on cross-origin requests
  //used to allow JSON content
  allowedHeaders: [ 'Content-Type', ],

  //response headers exposed to cross-origin requests
  exposedHeaders: [  'Location', 'Content-Type', ],
};

