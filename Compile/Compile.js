const fs = require("fs");
const solc = require("solc");
const path = require("path");

//1. get path of the Contract
const pathContract = path.resolve(__dirname, "../Contracts", "Lottery.sol");

//2. get Contract Compiled Code
const contractCode = fs.readFileSync(pathContract, "utf8");

var input = {
  language: "Solidity",
  sources: {
    "Compile.sol": {
      content: contractCode
    }
  },
  settings: {
    outputSelection: {
      "*": {
        "*": ["*"]
      }
    }
  }
};

var output = JSON.parse(solc.compile(JSON.stringify(input)));
// console.log(output);
// for (var contractName in output.contracts['Compile.sol']) {
//     console.log(contractName + ': ' + output.contracts['Compile.sol'][contractName].evm.bytecode.object);
// }

//3: export
module.exports = output.contracts["Lottery"];
