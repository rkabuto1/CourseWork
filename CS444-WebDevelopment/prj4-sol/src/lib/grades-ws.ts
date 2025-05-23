import { Errors as E, Types as T } from 'grades-client-lib';

export function makeGradesWs(url: string) { return new GradesWs(url); }
//---------------------------------------------------------------------------------------------------------------
/** Single point of access for Project 3 web services.  Hides
 *  details of HTTP communication behind a domain-level API.
 */
//---------------------------------------------------------------------------------------------------------------
export class GradesWs {
  constructor(private readonly hostUrl: string) { }
  async addStudent(student: T.Student) : Promise<E.Result<void, E.Errs>> {
    const url = this.wsUrl('students');
    return await doFetchJson<void>('put', url);
  }
  async getStudent(studentId: T.StudentId): Promise<E.Result<T.Student, E.Errs>>
  {
    const url = this.wsUrl(`students/${studentId}`);
    return await doFetchJson<T.Student>('get', url);
  }
  async addSectionInfo(sectionInfo: T.SectionInfo): Promise<E.Result<void, E.Errs>> 
  {
    const url = this.wsUrl('sections/info');
    return await doFetchJson<void>('put', url);
  }
  async getSectionInfo(sectionId: T.SectionId): Promise<E.Result<T.SectionInfo, E.Errs>>
  {
    const url = this.wsUrl(`sections/${sectionId}/info`);
    return await doFetchJson<T.SectionInfo>('get', url);
  }
  async enrollStudent(sectionId: T.SectionId, studentId: T.StudentId): Promise<E.Result<void, E.Errs>>
  {
    const url = this.wsUrl(`sections/${sectionId}/students`);
    return await doFetchJson<void>('put', url, studentId);
  }
  async addScore(sectionId: T.SectionId, studentId: T.StudentId, assignId: T.ColId, score: T.Score): Promise<E.Result<void, E.Errs>>
  {
    const url =
      this.wsUrl(`sections/${sectionId}/data/${studentId}/${assignId}`);
    return await doFetchJson<void>('patch', url, score);
  }
  async addScores(sectionId: T.SectionId, studentId: T.StudentId, scores: Record<T.ColId, T.Score>): Promise<E.Result<void, E.Errs>>
  {
    const url = this.wsUrl(`sections/${sectionId}/data/${studentId}`);
    return await doFetchJson<void>('patch', url, scores);
  }
  async getEntry(sectionId: T.SectionId, studentId: T.StudentId, colId: T.ColId): Promise<E.Result<T.Entry, E.Errs>>
  {
    const url = this.wsUrl(`sections/${sectionId}/data/${studentId}/${colId}`);
    return await doFetchJson<T.Entry>('get', url);
  }
  async getSectionData(sectionId: T.SectionId, query: Record<string, string>): Promise<E.Result<T.SectionData, E.Errs>>
  {
    const url = this.wsUrl(`sections/${sectionId}/data`, query);
    return await doFetchJson<T.SectionData>('get', url);
  }
  async getAllSectionData(sectionId: T.SectionId): Promise<E.Result<T.SectionData, E.Errs>>
  {
    return await this.getSectionData(sectionId, { kind: 'all' });
  }
  async getRawSectionData(sectionId: T.SectionId): Promise<E.Result<T.SectionData, E.Errs>>
  {
    return await this.getSectionData(sectionId, { kind: 'raw' });
  }
  async getStudentSectionData(sectionId: T.SectionId, studentId: T.StudentId)
    : Promise<E.Result<T.SectionData, E.Errs>>
  {
    return await this.getSectionData(sectionId, { kind: 'student', studentId });
  }
  async getAggrRowsSectionData(sectionId: T.SectionId): Promise<E.Result<T.SectionData, E.Errs>>
  {
    return await this.getSectionData(sectionId, { kind: 'aggrRows' });
  }
  async getSelectSectionData(sectionId: T.SectionId, rowIds: T.RowId[] = [], colIds: T.ColId[] = []): Promise<E.Result<T.SectionData, E.Errs>>
  {
    const query: Record<string, any> =
      { kind: 'select', rowId: rowIds, colId: colIds };
    return await this.getSectionData(sectionId, query);
  }
//--------------------------------------------Start Of Implementation--------------------------------------------  
/** return a complete URL for relApiApth and query. */
//---------------------------------------------------------------------------------------------------------------
private wsUrl(relApiPath: string, query?: Record<string, string | string[]>): string {
    const FURL = new URL(this.hostUrl);
    FURL.pathname = FURL.pathname.replace(/\/+$/, '') + '/api/' + relApiPath;
    if (query) {
      const entries = Object.entries(query);
      let i = 0;
      while (i < entries.length) {
        const [key, value] = entries[i];
        if (Array.isArray(value)) {
          let j = 0;
          while (j < value.length) {
            FURL.searchParams.append(key, value[j]);
            j++;
          }
        } else {
          FURL.searchParams.append(key, value);
        }
        i++;
      }
    }
    return FURL.href;
  }
}
//---------------------------------------------------------------------------------------------------------------
/** Return a Result for dispatching HTTP method to url.  If jsonBody
 *  is not `undefined`, then it should be sent as JSON (note that
 *  `null` is valid JSON).
 *
 *  The response should return an error Result if there is a network
 *  error, no response body, JSON parse error on the body or if the
 *  response envelope contains errors.  Otherwise it should return
 *  an ok Result containing the `result` from the response envelope.
 *
 */
//---------------------------------------------------------------------------------------------------------------
async function doFetchJson<T>(method: string, url: string, jsonBody?: any): Promise<E.Result<T, E.Errs>> {
  try {
    const headers: Record<string, string> = { 'Accept': 'application/json' };
    const options: RequestInit = {
      method: method.toUpperCase(),
      headers: headers,
    };
    if (jsonBody !== undefined) {
      headers['Content-Type'] = 'application/json';
      options.body = JSON.stringify(jsonBody);
    }
    const response = await fetch(url, options);
    const contentLength = response.headers.get('Content-Length');
    switch (true) {
      case !contentLength:
      case parseInt(contentLength) === 0:
        return E.errResult(E.Errs.err(`${method} ${url}: Empty response body`));
    }
    const body = await response.json();
    switch (true) {
      case body && typeof body === 'object' && 'isOk' in body && body.isOk:
        return E.okResult(body.result as T);
      case body && typeof body === 'object' && 'isOk' in body && !body.isOk:
        return makeErrors<T>(method, url, body.errors);
      default:
        return E.errResult(E.Errs.err(`${method} ${url}: Malformed response envelope`));
    }
  } catch (err) {
    switch (true) {
      case !!err:
        console.error(err);
        return E.errResult(E.Errs.err(err as Error));
    }
  }
}
//--------------------------------------------End Of Implementation--------------------------------------------
/** convert the errors property from an error-envelope to 
 *  E.Result<T, E.Errs>.
 */
//---------------------------------------------------------------------------------------------------------------
function makeErrors<T>(method: string, url: string, errors: any): E.Result<T, E.Errs> 
{
  if (!Array.isArray(errors)) {
    const msg =
      `${method} ${url}: isOk == false but errors of type "${typeof errors}"`;
    return E.errResult(E.Errs.err(msg));
  }
  if (errors.length === 0) {
    const msg = `${method} ${url}: isOk == false but no errors found`;
    return E.errResult(E.Errs.err(msg));
  }
  const errs = new E.Errs();
  for (const err of errors) {
    const e =
      (err.message !== undefined && err.code !== undefined)
      ? E.Err.err(err.message, err.code, err.options)
      : E.Err.err(err);
    errs.add(e);
  }
  return E.errResult(errs);
}