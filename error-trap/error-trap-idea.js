// Solidity+
contract Contract {
    function Foo(uint a) constant returns(uint) {
        if(a < 100) {
            throw('Too small'); // throw statement with an argument, what?!?
        }
        uint b = 5;
        return b;
    }
}

// transpiled into normal Solidity
contract ContractTrapped {
    function Foo(uint a) constant returns(string, uint) {
        uint nullReturn;
        if(a < 100) {
            return('Too small', nullReturn);
        }
        uint b = 5;
        return ('', b);
    }
}

/** TESTS (web3) **/

const debug = true

/** If in debug mode, handles the error tuple from the trapped result, returning
the normal result if no error. If not in debug mode, returns the untrapped 
result. */
const trap = trappedPromise => {
    return debug ? trappedPromise : 
        trappedPromise.then(result => {
            if(result[0]) {
                console.error(result[0])
            }
            return result[1]
        })
}

/** Returns a new function that traps the given contract function. */
const trapFunction = (key, fn) => {
    return (...args) => {
        return trap(fn(...args))
    }
}

/** Make a version of the contract with all functions trapped. */
const trapContract = contract => {
    return mapObject(contract, trapFunction)
}

// get a trapped version of the contract
const contract = trapContract(myContract)

// call contract as normal
contract.Foo(10)
