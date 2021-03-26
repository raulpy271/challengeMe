// Description: https://www.codewars.com/kata/587731fda577b3d1b0001196/typescript

function upperFirstElement(str: string): string {
  return str ? str[0].toUpperCase() + str.substr(1, str.length - 1)
  : ''
}

export function camelCase(str: string): string {
  let words = str.split(' ')
  let captalizedWords = words.map(upperFirstElement)
  return captalizedWords.join('')
}
