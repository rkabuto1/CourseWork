import { Grades, Types as T, Errors as E} from 'prj1-sol';

import { GradesDao, makeGradesDao } from './grades-dao.js';

export async function makeDbGrades(dbUrl: string,
				   rowAggrFns: Record<string, T.RowAggrFn>,
				   colAggrFns: Record<string, T.ColAggrFn>)
: Promise<E.Result<DbGrades, E.Err>>
{
  const grades = new Grades(rowAggrFns, colAggrFns);
  const daoResult = await makeGradesDao(dbUrl);
  if (!daoResult.isOk) return daoResult;
  const dao = daoResult.val;
  const initResult = await initGradesFromDb(dao, grades);
  if (!initResult.isOk) return initResult;
  return E.okResult(new DbGrades(dao, grades));
}

export class DbGrades {

  constructor(private readonly dao: GradesDao,
	      private readonly grades: Grades)
  {
    //grades serves as a validator and cache for the dao
  }

  async close() : Promise<E.Result<void, E.Err>> {
    return await this.dao.close();
  }

  /** Clear out all data
   *      
   *  Errors: DB if db error
   */
  async clear() : Promise<E.Result<undefined, E.Err>> {
    const clearResult = await this.dao.clear();
    if (!clearResult.isOk) return clearResult;
    this.grades.clear();
    return E.okResult(undefined);
  }

  /** add or replace student in this Grades object. */
  async addStudent(student: T.Student): Promise<E.Result<undefined, E.Err>> {
    const daoResult = await this.dao.addStudent(student);
    if (!daoResult.isOk) return daoResult;
    this.grades.addStudent(student);
    return E.okResult(undefined);
  }

  /** return info for student */
  async getStudent(studentId: T.StudentId)
    : Promise<E.Result<T.Student, E.Err>>
  {
    return this.grades.getStudent(studentId);
  }

  /** add or replace sectionInfo in this Grades object.
   *
   * Errors:
   *   BAD_CONTENT: section contains unknown aggr function name
   */
  async addSectionInfo(sectionInfo: T.SectionInfo)
    : Promise<E.Result<void, E.Err>> 
  {
    const chkResult = this.grades.chkSectionInfo(sectionInfo);
    if (!chkResult.isOk) return chkResult;
    const daoResult = await this.dao.addSectionInfo(sectionInfo);
    if (!daoResult.isOk) return daoResult;
    this.grades.addSectionInfoNoChk(sectionInfo);
    return E.okResult(undefined);
  }

  /** return section-info for sectionId */
  async getSectionInfo(sectionId: T.SectionId)
    : Promise<E.Result<T.SectionInfo, E.Err>>
  {
    //simply forward to grades cache
    return this.grades.getSectionInfo(sectionId);
  }

  /** enroll student specified by studentId in section sectionId.  It is
   *  not an error if the student is already enrolled.
   *
   * Errors:
   *   NOT_FOUND: unknown sectionId or studentId.
   */
  async enrollStudent(sectionId: T.SectionId, studentId: T.StudentId) 
    : Promise<E.Result<void, E.Err>>
  {
    const chkResult = this.grades.chkEnrollStudent(sectionId, studentId);
    if (!chkResult.isOk) return chkResult;
    const daoResult = await this.dao.enrollStudent(sectionId, studentId);
    if (!daoResult.isOk) return daoResult;
    this.grades.enrollStudentNoChk(sectionId, studentId);
    return E.okResult(undefined);
  }

  /** Return id's of all students enrolled in sectionId */
  async getEnrolledStudentIds(sectionId: T.SectionId) :
    Promise<E.Result<T.StudentId[], E.Err>>
  {
    //simply forward to grades cache
    return this.grades.getEnrolledStudentIds(sectionId);
  }
   
  
  /** add or replace score for studentId for assignment given by colId
   *  in section sectionId.
   *
   * Errors:
   *   NOT_FOUND: unknown sectionId, studentId or colId.
   *   BAD_CONTENT: student not enrolled in section, or colId
   *   inappropriate for score.
   */
  async addScore(sectionId: T.SectionId, studentId: T.StudentId, colId: T.ColId,
	         score: T.Score) : Promise<E.Result<void, E.Err>> {
    const chkResult =
      this.grades.chkAddScore(sectionId, studentId, colId, score);
    if (!chkResult.isOk) return chkResult;
    const daoResult =
      await this.dao.addScore(sectionId, studentId, colId, score);
    if (!daoResult.isOk) return daoResult;
    this.grades.addScoreNoChk(sectionId, studentId, colId, score);
    return E.okResult(undefined);
  }

  /** return entry at [sectionId][rowId][colId].
   *
   *  Errors:
   *    NOT_FOUND: unknown sectionId, rowId or colId.
   *    BAD_CONTENT: rowId is a studentId who is not enrolled in sectionId.
   */
  async getEntry(sectionId: T.SectionId, rowId: T.RowId, colId: T.ColId)
    : Promise<E.Result<T.Entry, E.Err>>
  {
    //simply forward to grades cache
    return this.grades.getEntry(sectionId, rowId, colId);
  }

  /** return full data (including aggregate data) for sectionId.  If
   *  rowIds is non-empty, then only the rows having those rowId's are
   *  returned.  If colIds is non-empty, then only the columns having
   *  those colId's are returned.
   *
   *  If no rowIds are specified, then the rows should be sorted by rowId,
   *  otherwise they should be in the order specified by rowIds.  If no
   *  colIds are specified, then they should be in the order specified by
   *  the sectionInfo, otherwise they should be in the order specified by
   *  colIds (ordering is possible, because JS objects preserve insertion
   *  order).
   *
   *  Note that the RowAggrFns are applied first across the rows of
   *  the table; then the ColAggrFns are applied to the columns
   *  (including AggrCols of the table.  It follows that ColAggrsFns
   *  can be applied to the result of a RowAggrFn, but RowAggrFns can
   *  never be applied to the result of a ColAggrFn.
   *
   * Errors:
   *   NOT_FOUND: unknown sectionId, rowId or colId.
   *   BAD_CONTENT: row specifies a studentId of a known but unenrolled student
   */
  async getSectionData(sectionId: T.SectionId, rowIds: T.RowId[] = [],
	  colIds: T.ColId[] = []) : Promise<E.Result<T.SectionData, E.Err>>
  {
    //simply forward to grades cache
    return this.grades.getSectionData(sectionId, rowIds, colIds);
  }


  /** Clear section sectionId; remove all grade data, enrolled students, and
   *  section-info
   *      
   *  Errors: DB: db error
   *          NOT_FOUND: unknown section-id
   */
  async rmSection(sectionId: T.SectionId) : Promise<E.Result<undefined, E.Err>> 
  {
    const chkResult = this.grades.chkSectionId(sectionId);
    if (!chkResult.isOk) return chkResult;
    const daoResult = await this.dao.rmSection(sectionId);
    if (!daoResult.isOk) return daoResult;
    this.grades.rmSection(sectionId);
    return E.okResult(undefined);
  }

  // convenience methods

  /** method to load multiple students */
  async addStudents(students: T.Student[])
    : Promise<E.Result<undefined, E.Err>>
  {
    for (const student of students) {
      const addResult = await this.addStudent(student);
      if (!addResult.isOk) return addResult;
    }
    return E.okResult(undefined);
  }

  /** return all independent data (non-aggregate, non-student) for sectionId */
  async getRawData(sectionId: T.SectionId)
    : Promise<E.Result<T.SectionData, E.Err>>
  {
    const infoResult = await this.getSectionInfo(sectionId);
    if (!infoResult.isOk) return infoResult as E.Result<T.SectionData, E.Err>;
    const info = infoResult.val;
    const isRawColHdr = (h: T.ColHdr) =>
      (h.id === 'id') || (h._tag !== 'aggrCol' && h._tag !== 'student');
    const colIds = Object.values(info.colHdrs)
      .filter(isRawColHdr)
      .map(h => h.id);
    const studentIdsResult = await this.getEnrolledStudentIds(sectionId);
    if (!studentIdsResult.isOk) return studentIdsResult;
    const studentIds = studentIdsResult.val;
    const rowIds = [ ... studentIds ];
    return await this.getSectionData(sectionId, rowIds, colIds);
  }

  /** return a single row (including aggregates) for student studentId.
   */
  async getStudentData(sectionId: T.SectionId, studentId: T.StudentId)
    : Promise<E.Result<T.SectionData, E.Err>>
  {
    return await this.getSectionData(sectionId, [ studentId ]);
  }

  /** return all aggregate rows for sectionId */
  async getAggrRows(sectionId: T.SectionId)
    : Promise<E.Result<T.SectionData, E.Err>>
  {
    const infoResult = await this.getSectionInfo(sectionId);
    if (!infoResult.isOk) return infoResult as E.Result<T.SectionData, E.Err>;
    const info = infoResult.val;
    const rowIds = Object.values(info.rowHdrs)
      .filter(h => h._tag === 'aggrRow')
      .map(h => h.id);
    return await this.getSectionData(sectionId, rowIds);
  }


  /** Create/replace sectionInfo and sectionData.  Will enroll all
   *  students from sectionData (assumes those students already exist
   *  outside of the section).
   *
   *  Errors: NOT_FOUND, BAD_CONTENT, DB as appropriate
   */
  async loadSection(sectionInfo: T.SectionInfo, data: T.SectionData) 
    : Promise<E.Result<undefined, E.Err>> 
  {
    const sectionId = sectionInfo.id;
    const rmResult = await this.rmSection(sectionId);
    if (!rmResult.isOk && rmResult.err.code !== 'NOT_FOUND') return rmResult;
    const infoResult = await this.addSectionInfo(sectionInfo);
    if (!infoResult.isOk) return infoResult;
    for (const k of Object.keys(data)) {
      const enrollResult =
	await this.enrollStudent(sectionId, k as T.StudentId);
      if (!enrollResult.isOk) return enrollResult;
    }
    for (const k of Object.keys(data)) {
      const studentId = k as T.StudentId;
      const row = data[studentId];
      for (const c of Object.keys(row)) {
	const assignId = c as T.ColId;
	const score = row[assignId] as T.Score;
	const scoreResult =
	  await this.addScore(sectionId, studentId, assignId, score);
	if (!scoreResult.isOk) return scoreResult;
      }
    }
    return E.okResult(undefined);
  }
 
}


async function initGradesFromDb(dao: GradesDao, grades: Grades)
  : Promise<E.Result<void, E.Err>> {
  const studentsResult = await dao.getStudents();
  if (!studentsResult.isOk) return studentsResult;
  for (const student of studentsResult.val) { grades.addStudent(student); }
  const sectionInfosResult = await dao.getSectionInfos();
  if (!sectionInfosResult.isOk) return sectionInfosResult;
  for (const info of sectionInfosResult.val) {
    const infoResult = grades.addSectionInfo(info);
    if (!infoResult.isOk) return infoResult;
    const sectionId = info.id;
    const sectionStudentIdsResult = await dao.getSectionStudentIds(sectionId);
    if (!sectionStudentIdsResult.isOk) return sectionStudentIdsResult;
    for (const studentId of sectionStudentIdsResult.val) {
      const enrollResult = grades.enrollStudent(sectionId, studentId);
      if (!enrollResult.isOk) return enrollResult;
    }
    const sectionGradesResult = await dao.getSectionScores(sectionId);
    if (!sectionGradesResult.isOk) return sectionGradesResult;
    const sectionGrades = sectionGradesResult.val;
    for (const studentIdStr of Object.keys(sectionGrades)) {
      const studentId = studentIdStr as T.StudentId;
      const row = sectionGrades[studentId];
      for (const colIdStr of Object.keys(row)) {
	const assignId = colIdStr as T.ColId;
	const colHdr = info.colHdrs[assignId];
	if (!colHdr) {
	  const msg = `unknown assignId ${assignId} for section ${sectionId}`;
	  return E.errResult(E.Err.err(msg, 'BAD_CONTENT'));
	}
	const score = row[assignId] as T.Score;
	const scoreResult =
	  grades.addScore(sectionId, studentId, assignId, score);
	if (!scoreResult) return scoreResult;
      }
    }
  }
  return E.okResult(undefined);
}