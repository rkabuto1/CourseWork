import * as mongo from 'mongodb';

import { Grades, Types as T, Errors as E} from 'prj1-sol';

export async function makeGradesDao(dbUrl: string) {
  return await GradesDao.make(dbUrl);
}

//options for new MongoClient()
const MONGO_OPTIONS = {
  //ignoreUndefined: true,  //ignore undefined fields in queries
};

type DbSection = {
  _id: string,
  info: T.SectionInfo,
  grades: T.SectionData,
  studentIds: Record<T.StudentId, boolean>,
};

type DbStudent = T.Student & { _id: string };

export class GradesDao {
  //called by below static make() factory function with
  //parameters to be cached in this instance.
  constructor(private readonly client: mongo.MongoClient,
	      private readonly students: mongo.Collection<DbStudent>,
	      private readonly sections: mongo.Collection<DbSection>) {
  }

  //static factory function; should do all async operations like
  //getting a connection and creating indexing.  Finally, it
  //should use the constructor to return an instance of this class.
  //returns error code DB on database errors.
  static async make(dbUrl: string) : Promise<E.Result<GradesDao, E.Err>> {
    try {
      const client =
	await (new mongo.MongoClient(dbUrl, MONGO_OPTIONS)).connect();
      const db = client.db();
      const students = db.collection<DbStudent>('students');
      const sections = db.collection<DbSection>('sections');
      const dao = new GradesDao(client, students, sections);
      return E.okResult(dao);
    }
    catch (error) {
      return E.errResult(E.Err.err((error as Error).message, 'DB'));
    }
  }

  /** close off this DAO; implementing object is invalid after 
   *  call to close() 
   *
   *  Error Codes: 
   *    DB: a database error was encountered.
   */
  async close() : Promise<E.Result<void, E.Err>> {
    try {
      await this.client.close();
      return E.okResult(undefined);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }

  /** clear all data in this DAO.
   *
   *  Error Codes: 
   *    DB: a database error was encountered.
   */
  async clear() : Promise<E.Result<void, E.Err>> {
    try {
      await this.sections.deleteMany({});
      await this.students.deleteMany({});
      return E.okResult(undefined);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }
 
  async addStudent(student: T.Student) : Promise<E.Result<void, E.Err>> {
    try {
      const query = { _id: student.id };
      const options = { upsert: true };
      await this.students.updateOne(query, { $set: student }, options);
      return E.okResult(undefined);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }

  async getStudent(studentId: T.StudentId)
    : Promise<E.Result<T.Student, E.Err>> 
  {
    try {
      const collection = this.students;
      const projection = { _id: false };
      const student =
	await collection.findOne({_id: studentId}, {projection});
      if (student) {
	return E.okResult(student);
      }
      else {
	return E.errResult(E.Err.err(`no student with id '${studentId}'`,
				     'NOT_FOUND'));
      }
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }

  async getStudents() : Promise<E.Result<T.Student[], E.Err>> 
  {
    try {
      const collection = this.students;
      const q = { };
      const projection = { _id: false };
      const cursor = await collection.find(q, {projection});
      const entries = await cursor.toArray();
      return E.okResult(entries);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }

  async addSectionInfo(sectionInfo: T.SectionInfo)
    : Promise<E.Result<void, E.Err>> 
  {
    try {
      const collection = this.sections;
      const query = { _id: sectionInfo.id };
      const update = { $set: { info: sectionInfo } };
      const options = { upsert: true };
      await collection.updateOne(query, update, options);
      return E.okResult(undefined);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }

  async getSectionInfo(sectionId: T.SectionId)
    : Promise<E.Result<T.SectionInfo, E.Err>> 
  {
    try {
      const collection = this.sections;
      const projection = { _id: false, studentIds: false, grades: false, };
      const section =
	await collection.findOne({_id: sectionId}, {projection});
      return (section) 
	? E.okResult(section.info)
	: E.errResult(E.Err.err(`section ${sectionId} not found`, 'NOT_FOUND'));
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }

  async getSectionInfos() : Promise<E.Result<T.SectionInfo[], E.Err>> 
  {
    try {
      const collection = this.sections;
      const q = { };
      const projection = { _id: false, studentIds: false, grades: false, };
      const cursor = await collection.find(q, {projection});
      const entries = await cursor.toArray();
      return E.okResult(entries.map(dbSection => dbSection.info));
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }
  
  async enrollStudent(sectionId: T.SectionId, studentId: T.StudentId)
    : Promise<E.Result<void, E.Err>> 
  {
    try {
      const collection = this.sections;
      const query = { _id: sectionId };
      const update = { $set: { [`studentIds.${studentId}`]: true } };
      const options = { upsert: true };
      await this.sections.updateOne(query, update, options);
      return E.okResult(undefined);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }

  async getSectionStudentIds(sectionId: T.SectionId)
    : Promise<E.Result<T.StudentId[], E.Err>> 
  {
    try {
      const collection = this.sections;
      const query = { _id: sectionId };
      const projection = { _id: false, info: false, grades: false, };
      const section = await collection.findOne(query, {projection});
      if (!section) {
	const msg = `section ${sectionId} not found`;
	return E.errResult(E.Err.err(msg, 'DB'));
      }
      const studentIds = Object.entries(section.studentIds ?? {})
	.filter(([k, v]) => v)
        .map(([k, v]) => k as T.StudentId);
      return E.okResult(studentIds);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }
  
  async addScore(sectionId: T.SectionId, studentId: T.StudentId,
		 assignId: T.ColId, score: T.Score)
    : Promise<E.Result<void, E.Err>> 
  {
    try {
      const collection = this.sections;
      const query = { _id: sectionId };
      const update = { $set: { [`grades.${studentId}.${assignId}`]: score } };
      const options = { upsert: true };
      await collection.updateOne(query, update, options);
      return E.okResult(undefined);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }

  async getSectionScores(sectionId: T.SectionId)
    : Promise<E.Result<T.SectionData, E.Err>> 
  {
    try {
      const collection = this.sections;
      const query = { _id: sectionId, };
      const projection = { _id: false, info: false, studentIds: false, };
      const section = await collection.findOne(query, {projection});
      return (section)
	? E.okResult(section.grades ?? {})
	: E.errResult(E.Err.err(`section ${sectionId} not found`, 'NOT_FOUND'));
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }
  
  /** Remove all section data, including enrolled students, and
   *  section-info
   */
  async rmSection(sectionId: T.SectionId): Promise<E.Result<void, E.Err>> {
    try {
      const query = { _id: sectionId };
      await this.sections.deleteOne(query);
      return E.okResult(undefined);
    }
    catch (e) {
      return E.errResult(E.Err.err((e as Error).message, 'DB'));
    }
  }
}
