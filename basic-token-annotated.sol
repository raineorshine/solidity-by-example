// declare which version of Solidity we are using
// different versions of Solidity have different
pragma solidity ^0.4.11;

// define a smart contract called "BasicToken"
contract BasicToken {

  // examples of simple variables
  // string myName;
  // bool isApproved;
  // uint daysRemaining;

  // an array is a list of individuals values, e.g. list of numbers, list of names
  // uint256[] numbers;

  // a mapping is a list of pairs
  mapping(address => uint256) balances; // a mapping of all user's balances
  // 0xa5c => 10 Ether
  // 0x91b => 5 Ether
  // 0xcdd => 1.25 Ether

  // another mapping example
  // mapping(address => bool) signatures; // a mapping of signatures
  // 0xa2d => true (approved)
  // 0xb24 => true (approved)
  // 0x515 => false (not approved)

  // address myAddress = 0x1235647381947839275893275893; // ethereum address
  // uint256 count = 10; // unsigned (non-negative) integer, 256-bytes in size

  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  // define a function called "transfer"
  // inputs? (parameters) an address called "_to" and a uint256 called "_value"
  function transfer(address _to, uint256 _value) public {
    // msg.sender is a predefined variable that specifies the address of the
    // person sending this transaction
    // address msg.sender = 0x5ba...;

    // balances[msg.sender] -> set the balance of the sender
    // set the balance of the sender to their current balance minus _value
    // withdrawing tokens from the sender's account
    balances[msg.sender] = balances[msg.sender].sub(_value); // balance - _value

    // balances[_to] -> set the balance of the receiver (_to)
    // set the balance of the receiver to their current balance plus _value
    // depositing tokens into the receiver's account
    balances[_to] = balances[_to].add(_value); // balance + _value
  }

  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  // define function called "balanceOf"
  // inputs? (parameters) the address of the owner (_owner)
  // ontputs? (returns) the balance (number)
  function balanceOf(address _owner) public constant returns (uint256 balance) {

    // balances[_owner] -> return the balance of the owner
    return balances[_owner];
  }

}
