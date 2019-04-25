

function parseInput(str, placeCount, faceOrder) {
  let res = '';
  for(let j = 0; j < faceOrder.length; j++) {
    for(let i = 0; i < placeCount; i++) {
      res += `${str.charAt(j * faceOrder.length + i)}, ${faceOrder.charAt(j)}${i + 1}; `
    }
  }
  return `scramble(${res}).`
}

const faceOrder = 'URFDLB';
const placeCount = 9;
const input = 'DRLUUBFBRBLURRLRUBLRDDFDLFUFUFFDBRDUBRUFLLFDDBFLUBLRBD';

let str = '';

str += parseInput(input, placeCount, faceOrder);
console.log(str);
