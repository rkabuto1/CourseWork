import { makeWsGrades, WsGrades } from './ws-grades.js';
import { Errors as E, Types as T, SECTION_IDS } from 'grades-client-lib';

//---------------------------------------------------------------------------------------------------------------
/** Factory function for App.  Does any asynchronous initialization
 * before calling constructor.
 */
//--------------------------------------------Start Of Implementation--------------------------------------------
export default async function makeApp(wsHostUrl: string) {
  const wsGrades = await makeWsGrades(wsHostUrl);
  await Promise.all(SECTION_IDS.map(id => wsGrades.getSectionInfo(id))); 
  return new App(wsGrades); 
}

export class App {
  private readonly wsGrades: WsGrades;
  private sectionId: T.SectionId;
  private isEditable: boolean;

  constructor(wsGrades: WsGrades) {
    this.wsGrades = wsGrades;
    this.sectionId = '' as T.SectionId;
    this.isEditable = false;

    document.querySelector('#grades-form')?.addEventListener('submit', X => X.preventDefault());
    const SELECTION_TAB = document.querySelector('#section-id') as HTMLSelectElement;

    for (const ID of SECTION_IDS) {
      const FindInfo = this.wsGrades.getSectionInfo(ID);
      FindInfo.then(Res => {
        if (Res.isOk) {
          const Choice = makeElement('option', { value: ID }, Res.val.name);
          SELECTION_TAB.append(Choice);
        } else {
          errors(Res);
        }
      });
    }
    SELECTION_TAB.addEventListener('change', (X) => {
      const Source = X.target as HTMLSelectElement;
      this.sectionId = Source.value as T.SectionId;
      console.log('sectionId =', this.sectionId);
      this.TableGrades(); 
    });
    const Toggle = document.querySelector('#is-editable') as HTMLInputElement;
    Toggle.addEventListener('change', (X) => {
      const Source = X.target as HTMLInputElement;
      this.isEditable = Source.checked;
      console.log('isEditable =', this.isEditable);
      this.TableGrades(); 
    });
  }
//---------------------------------------------------------------------------------------------------------------
/** Updates the #grades table based on current sectionId and isEditable state.
  *  For now, just show the headers for colHdrs of the section.
  */
/** Re-render the grades table based on current sectionId and isEditable settings */
//---------------------------------------------------------------------------------------------------------------
private Input = async (X: Event | KeyboardEvent) => {
  clearErrors();
  const input = X.target as HTMLInputElement;
  const SEC_ID = input.dataset.sectionid as T.SectionId;
  const ROW_ID = input.dataset.rowid as T.StudentId;
  const COL_ID = input.dataset.colid as T.ColId;
  let data = input.value.trim();
  let val: T.Score = null;
  switch (true) {
    case data === '':
      val = null;
      break;
    case !isNaN(Number(data)):
      val = Number(data);
      break;
    default:
      val = data;
  }
  const response = await this.wsGrades.addScore(SEC_ID, ROW_ID, COL_ID, val);
  if (!response.isOk) {
    errors(response);
    return;
  }
  switch (true) {
    case X instanceof KeyboardEvent && (X.key === 'Enter' || X.key === 'Tab'):
      this.isEditable = false;
      const isEdit = document.querySelector('#is-editable') as HTMLInputElement;
      isEdit.checked = false;
      this.TableGrades();
      break;
  }
};
private EditTabSpace(SEC_ID: T.SectionId, ROW_ID: string, COL_ID: string, Header: T.ColHdr, Val: T.Entry): HTMLElement {
  const Block = document.createElement('td');
  const Edit = this.isEditable && T.isStudentId(ROW_ID) && (Header._tag === 'numScore' || Header._tag === 'textScore');

  switch (true) {
    case Edit: {
      const Inp = document.createElement('input');
      if (Val !== null && Val !== undefined) {
        Inp.value = Val.toString();
      } else {
        Inp.value = '';
      }
      if (SEC_ID) 
        Inp.setAttribute('data-sectionid', SEC_ID);
      if (ROW_ID) 
        Inp.setAttribute('data-rowid', ROW_ID);
      if (COL_ID) 
        Inp.setAttribute('data-colid', COL_ID);
      if (typeof this.Input === 'function') {
        Inp.addEventListener('change', this.Input);
        Inp.addEventListener('keydown', this.Input);
      }
      Block.appendChild(Inp);
      break;
    }
    default: {
      const text = Val != null ? Val.toString() : '';
      const Range = makeElement('span', {
        'data-sectionid': SEC_ID,
        'data-rowid': ROW_ID,
        'data-colid': COL_ID,
      }, text);
      Block.append(Range);
    }
  }
  return Block;
}

private TableGrades = async () => {
  clearErrors();
  let SEC_ID: T.SectionId;
  let SEC_RESULT: E.Result<T.SectionInfo, E.Errs>;
  let ROW_HEADER: HTMLTableRowElement;
  let DATA_RESULT: E.Result<T.SectionData, E.Errs>;
  let SEC_DATA: T.SectionData;
  let Table: HTMLTableElement;
  let OriginalData: E.Result<T.SectionInfo, E.Err>;
  let Info: T.SectionInfo;

  switch (true) {
    case !this.sectionId: {
      const blankSheet = document.createElement('table');
      document.querySelector('#grades > table')?.replaceWith(blankSheet);
      return;
    }
  }
  SEC_ID = this.sectionId;
  OriginalData = this.wsGrades['grades'].getSectionInfo(SEC_ID);
  SEC_RESULT = E.toErrs(OriginalData);
  switch (true) {
    case !SEC_RESULT.isOk:
      errors(SEC_RESULT);
      return;
  }
  Info = SEC_RESULT.val;
  DATA_RESULT = await this.wsGrades.FindData(SEC_ID);
  switch (true) {
    case !DATA_RESULT.isOk:
      errors(DATA_RESULT);
      return;
  }
  SEC_DATA = DATA_RESULT.val;
  Table = document.createElement('table');
  ROW_HEADER = document.createElement('tr');

  for (const hdr of Object.values(Info.colHdrs)) {
    ROW_HEADER.append(makeElement('th', {}, hdr.name));
  }
  Table.append(ROW_HEADER);

  for (const [rID, row] of Object.entries(SEC_DATA)) {
    const Row = document.createElement('tr');
    const isTotal = rID in Info.rowHdrs;
    for (const [cID, hdr] of Object.entries(Info.colHdrs)) {
      const value = row[cID as T.ColId];
      switch (true) {
        case isTotal && hdr._tag === 'student':
          switch (true) {
            case cID === 'id': {
              const Block = document.createElement('td');
              const label = Info.rowHdrs[rID as T.AggrRowId].name;
              Block.append(makeElement('span', {}, label));
              Row.append(Block);
              break;
            }
            default: {
              const Block = document.createElement('td');
              Block.append(document.createTextNode(''));
              Row.append(Block);
            }
          }
          continue;
      }
      const Block = this.EditTabSpace(SEC_ID, rID, cID, hdr, value);
      Row.append(Block);
     }
     Table.append(Row);
    }
    document.querySelector('#grades > table')?.replaceWith(Table);
  };
}  
//--------------------------------------------End Of Implementation--------------------------------------------
//---------------------------------------------------------------------------------------------------------------
/******************************** Errors *******************************/
/** add errors from result to #errors */
//---------------------------------------------------------------------------------------------------------------
function errors<T>(result: E.Result<T, E.Errs>) {
  if (result.isOk === true) return;
  const errWidget = document.querySelector('#errors');
  for (const e of result.err.errors()) {
    errWidget.append(makeElement('li', {}, e.message));
  }
}
//---------------------------------------------------------------------------------------------------------------
/** clear out all errors from #errors */
//---------------------------------------------------------------------------------------------------------------
function clearErrors() {
  const errWidget = document.querySelector('#errors');
  errWidget.innerHTML = '';
}
//---------------------------------------------------------------------------------------------------------------
/***************************** DOM Utilities ***************************/
/** Return a new DOM element with specified tagName, attributes
 *  given by object attrs and contained text.
 */
//---------------------------------------------------------------------------------------------------------------
function makeElement(tagName: string, attrs: {[attr: string]: string} = {}, text = ''): HTMLElement {
  const element = document.createElement(tagName);
  for (const [k, v] of Object.entries(attrs)) {
    element.setAttribute(k, v);
  }
  if (text.length > 0) element.append(text);
  return element;
}
