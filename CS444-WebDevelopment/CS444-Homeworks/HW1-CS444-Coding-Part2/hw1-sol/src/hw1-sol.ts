#!/usr/bin/env ts-node
//------------------------------------------------------------------------
/* *** IMPORTANT NOTE ***
ALL FUNCTIONS BELOW MUST BE IMPLEMENTED WITHOUT USING RECURSION OR **ANY**
DESTRUCTIVE OPERATIONS.

Some consequences:

  + *NO LOOPS* of any kind.

  + Only const declarations.

  + Use Array methods like .map() and .reduce() and Array.from({length:n}) 
    (to create an empty n-element array).

  + No destructive Array methods like .push() (use .concat() instead).

  + You may use not destructive methods like .reverse(), but can use the
    newer non-destructive .toReversed().

  + Use String methods like split().

  + Use RegExp methods.

More details are in the .<restrictions.html> document linked from the
main assignment.

When fully implemented, running this file should result in the LOG
linked from the main assignment.

*/
//------------------------------------------------------------------------
type TODO = any; //to mark TODO return values


//------------------------------------------------------------------------
// #1: 4-points
// Given string `text` and non-negative integer `n`, return
// `text` preceded and followed by `n` '*'s.
export function emphasize(text: string, n: number) : string {
  const p = '*'.repeat(n)
  return [p, text, p].join('');
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #2: 4-points
// Given a string `str` and non-negative integer `n`, return string
// `str` with the `n` characters starting at index str.length/2 removed.
export function rmMid(str: string, n: number) : string {
  const mid_point = (str.length / 2) | 0;
  const output = str.slice(0, mid_point) +  str.slice(mid_point + n);
  return output;
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #3: 4-points
// Return a count of the number of distinct characters in text.
export function charsCount(text: string) : number {
  const characters = Array.from(new Set(text));
  return characters.join("").length;
  //return -1 as TODO;
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #4: 4-points
// Given a string `text`, and positive integer `n`, return a list of
// all words in `text` which have a length divisible by `n`. Note that
// a word is a maximal sequence of characters which are not
// whitespace.
export function wordsWithLenMultiple(text: string, n: number) : string[] {
  const len = text.trim().split(/\s+/);
  const allowed = len.filter(p => p.length % n == 0);
  return allowed 
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #5: 4-points
// Return `text` with all digit sequences replaced with the length of
// that digit sequence.
export function replaceIntsWithLengths(text: string) : string {
  const dig = text.split(/(\d+)/)
  const change = dig.map(p => p.replace(/\d+/g, p.length.toString()))
  return change.join("");
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #6: 5-points - Check To Make sure this doesn't break rules
//
// given an array `arr` of arbitrary JavaScript objects, return
// the number of permutations of that array.
// Note that all array elements in `arr` are always regarded as distinct.
export function nPermutations(arr: any[]) : number {
  const x = Array.from(Array(arr.length), (_, i) => i + 1);
  return x.reduce((x, y) => x * y, 1);
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #7: 5-points
// Given a list `coeffs` of numbers and a number `x` return the
// sum of multiplying `x` by each element of `coeff`.
export function sumProducts(coeffs: number[], x: number) : number {
  const s_prod = coeffs.map(c => c * x);
  return Math.max(0, s_prod.reduce((a, b) => a + b, 0));
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #8: 5-points
// Given a non-negative integer `n`, return an `n`-element array
// `[(n-1), (n-2), ..., 1, 0]`.
// Your solution may not use Array toReversed().
export function reversedRange(n: number) : number[] {
  const x = Array.from({ length: n});
  return x.map((_, i) => n -1 - i);
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #9: 5-points
// Given a non-negative integer `n`, and integers `init` and `inc`
// returns an `n`-element array `[ init, init + inc, init + 2*inc,
// ..., init + (n-1)*inc]`.
export function range(n: number, init = 0, inc = 1) : number[] {
  const x = Array.from({ length: n});
  return x.map((_, i) => init + i * inc);
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #10: 5-points
// Given a string `text` and index `offset`, returns the line at index
// `offset` in string `text`.  A line is defined to be a maximal
// sequence of characters which does not contain a `'\n'` newline
// character.
export function lineAt(text: string, offset: number) : string {
  const split_line = text.split("\n")
  const find_index = split_line.map((_, i, arr) => arr.slice(0, i).join("\n").length + (i && 1));
  const len = find_index;
  const output_line = split_line.find((_, i) => offset >= len[i] && offset < len[i] + split_line[i].length);
  return output_line || "";
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #11: 5-points
// Given a string `text`, return `text` with all lines within text
// with length set to `len`.  When a line is shorter than `len` it is
// padded on the right with the requisite number of spaces; when it's
// length is greater than `len`, the requisite number of suffix
// characters are removed.  Note that a line is a maximal sequence of
// characters not containing a newline character `'\n'`.
// All lines in the return value must always be followed by a `'\n'`
// character irrespective of whether that is the case for the
// corresponding line in `text`.
export function fixedLengthLines(text: string, len: number) : string {
  const split_line = text.split("\n");
  const proc_line = split_line.map(split_line => (split_line + " ".repeat(len)).slice(0, len) + "\n");
  const output = proc_line.join("");
  return output; 
}
//------------------------------------------------------------------------

//------------------------------------------------------------------------
// #12: 10-points
// Given a string `text`, return `text` with all lines which have
// even length (not counting the `'\n'`) removed.  Note that a line
// is a maximal sequence of characters not containing a newline
// character `'\n'`.
// All lines in the return value must always be followed by a `'\n'`
// character irrespective of whether that is the case for the
// corresponding line in `text`.
export function oddLengthLines(text: string) : string {
  const split_line = text.split("\n").filter(line => line.length % 2 == 1);
  const output = split_line.join("\n") || "";
  return output && output + "\n"; 
}

//------------------------------------------------------------------------
// #13
// Given a list `nums` of numbers, return the list containing the
// sums of the prefixes of `nums`.
// The performance *must* be *linear* in the size of `nums`.
export function sumPartials(nums: number[]) : number[] {
  const ind = nums.map((_, i) => i);
  const sa = ind.map(i => nums.slice(0, i + 1));
  const output = sa.map(arr => arr.reduce((acc, num) => acc + num, 0));
  return output; 
}
//------------------------------------------------------------------------
