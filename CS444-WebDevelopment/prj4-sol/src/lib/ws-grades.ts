import { makeGradesWs, GradesWs } from './grades-ws.js';
import { Errors as E, Types as T, Grades, AggrFns, SECTION_IDS } from 'grades-client-lib';
//import { App } from './app.js'; 
//---------------------------------------------------------------------------------------------------------------
/** Factory function for App.  Does any asynchronous initialization
 * before calling constructor.
 */
//--------------------------------------------Start Of Implementation--------------------------------------------
export async function makeWsGrades(wsHostUrl: string): Promise<WsGrades> {
  return new WsGrades(wsHostUrl);
}
//---------------------------------------------------------------------------------------------------------------
/** Provide convenience API for the DOM layer.
 *  Uses an instance of Grades as a cache.  All aggregate computation
 *  is performed by the cache.  The web services are used to ensure
 *  that the cache is sync'd with the state of the server.
 */
//---------------------------------------------------------------------------------------------------------------
export class WsGrades {
  private readonly grades: Grades;  
  private readonly ws: GradesWs;
  private CACHE: Set<T.SectionId>;  

  constructor(wsHostUrl: string) {
    this.grades = new Grades(AggrFns.rowAggrFns, AggrFns.colAggrFns);
    this.ws = makeGradesWs(wsHostUrl);
    this.CACHE = new Set(); 
}
//---------------------------------------------------------------------------------------------------------------
/** Get section info, using cache if possible.
  *  Checks if the section info is already cached.
  *  If not, calls the web service and adds it to the Grades cache.
  *  All errors are returned as E.Result<T, E.Errs>.
  */
//---------------------------------------------------------------------------------------------------------------
async getSectionInfo(sectionId: T.SectionId): Promise<E.Result<T.SectionInfo, E.Errs>> {
  let output: E.Result<T.SectionInfo, E.Err>;
  let Error: E.Result<never, E.Err>;
  let res: E.Result<T.SectionInfo, E.Errs>;
  let SEC_INFO: T.SectionInfo;
  let displayoutput: E.Result<void, E.Err>;

  switch (true) {
    case this.CACHE.has(sectionId): {
      output = this.grades.getSectionInfo(sectionId);
      switch (true) {
        case output.isOk:
          return E.okResult(output.val);
        case !output.isOk: {
          Error = output as E.Result<never, E.Err>;
          return E.errResult(E.Errs.fromErr((Error as any).err));
        }
      }
    }
  }
  res = await this.ws.getSectionInfo(sectionId);
  switch (true) {
    case !res.isOk:
      return res;
  }
  SEC_INFO = res.val;
  displayoutput = this.grades.addSectionInfo(SEC_INFO);
  switch (true) {
    case !displayoutput.isOk: {
      Error = displayoutput as E.Result<never, E.Err>;
      return E.errResult(E.Errs.fromErr((Error as any).err));
    }
  }
  this.CACHE.add(sectionId);
  return E.okResult(SEC_INFO);
}
async FindData(sectionId: T.SectionId): Promise<E.Result<T.SectionData, E.Errs>> {
  let Result: E.Result<Record<string, Record<string, T.Entry>>, E.Errs>;
  let RAW_DATA: Record<string, Record<string, T.Entry>>;
  let ROW_KEY: string;
  let STUDENT_ID: T.StudentId;
  let lookupResult: E.Result<T.Student, E.Errs>;
  let ObjStudent: T.Student;
  let Row: Record<string, T.Entry>;
  let COL_ID: string;
  let index: T.Entry;
  let grade: T.Score;
  let Output: E.Result<T.SectionData, E.Err>;

  Result = await this.ws.getRawSectionData(sectionId);
  switch (true) {
    case !Result.isOk:
      return Result;
  }
  RAW_DATA = Result.val;
  for (ROW_KEY of Object.keys(RAW_DATA)) {
    switch (true) {
      case !T.isStudentId(ROW_KEY):
        continue;
    }
    STUDENT_ID = ROW_KEY as T.StudentId;
    lookupResult = await this.ws.getStudent(STUDENT_ID);
    switch (true) {
      case !lookupResult.isOk:
        return lookupResult;
    }
    ObjStudent = lookupResult.val;
    try {
      this.grades.addStudent(ObjStudent);
      this.grades.enrollStudent(sectionId, STUDENT_ID);
    } catch (e) {
      return E.errResult(E.Errs.fromErr(E.Err.err(e)));
    }
    Row = RAW_DATA[STUDENT_ID];
    for ([COL_ID, index] of Object.entries(Row)) {
      switch (true) {
        case typeof index === 'number':
        case typeof index === 'string':
        case index === null: {
          grade = index as T.Score;
          try {
            this.grades.addScore(sectionId, STUDENT_ID, COL_ID as T.ColId, grade);
          } catch (e) {
            return E.errResult(E.Errs.fromErr(E.Err.err(e)));
          }
          break;
        }
      }
    }
  }
  try {
    Output = this.grades.getSectionData(sectionId);
    return E.toErrs(Output);
  } catch (e) {
    return E.errResult(E.Errs.fromErr(E.Err.err(e)));
  }
}
async addScore(SEC_ID: T.SectionId, STUDENT_ID: T.StudentId, COL_ID: T.ColId, grade: T.Score): Promise<E.Result<void, E.Errs>> {
    try {
      const Output = this.grades.addScore(SEC_ID, STUDENT_ID, COL_ID, grade);
      switch (true) {
        case Output.isOk:
          const response = await this.ws.addScore(SEC_ID, STUDENT_ID, COL_ID, grade);
          return response;
        case !Output.isOk:
          const Error = (Output as E.Result<void, E.Err> & { isOk: false }).err;
          return E.errResult(E.Errs.fromErr(Error));
      }
    } catch (x) {
      return E.errResult(E.Errs.fromErr(E.Err.err(x)));
    }
  }
}
//--------------------------------------------End Of Implementation--------------------------------------------
