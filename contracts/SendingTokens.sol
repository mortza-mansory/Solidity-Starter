// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

//---------------------Fast Remembering Solidity----------------------

//Varibles:
//   unit = Unsigned integer => that can have size from 8 , 16 and 256(uint256) ; 
//       This Varible cannot gets negative numbers like -1 -2 
//       its only can get numbers that is more than zero(0).
//   bool = Boolean true or false, like bool isSended = true. 
//   address =  Addreess is kind of ETH wallet 20 byte of blockchain;
//       its can get, payable( that is can get  ETH) we can define it like this too:
//       addreess user = 0xABC...;  or address payable wallet = payable(user);
//   string = a string can get bench of words like mortza or mansouri.
//       its defined like   string name = "mortza";
//   byte = its a varible that is array of bytes( they can get dynamic size ) byte code = "abc";
//   byte32 = its a array of bytes that is defined with 32 lenght byte bytes32 code = "abc";
//   arrays = arrays in this lang can defined like this []uint , []string, 
//       its can be defined like this : uint[] public numbers;
//       and can be push elements like this:     numbers.push(num);
//       its also can be defined with numbers, like this:
//       uint[3] public fixedNumbers = [1, 2, 3];  //now you cannot use push cus its a static array witch you defined from before thier elements. 
//   mapping = its like dictionalry in python or map stl in cpp. that can point a key to a value. 
//       its like this :  mapping(address => uint) public balances;

//Varibles Type:
//  State Variables like public private , and we use it like this: uint public totalSupply;
//    They will defined on level of the contract and will be saved on blockchain. 
//  Local Variables like uint bool and .. witch you define without any keyword on function. they name it local cus they only works on the funcion.
//  Global Variables : some varibles that is  coming from blockchain such as:
//    msg.sender           type = address    purpose = sender of the function call
//    msg.value            type = uint       purpose = amount of ETH sent with the call
//    block.timestamp      type = uint       purpose = time of the current block (unix time)
//    block.number         type = uint       purpose = current block number
//    block.chainid        type = uint       purpose = id of the current chain (like 1 for ETH mainnet)
//    tx.origin            type = address    purpose = original sender of the whole transaction
//    gasleft()            type = uint       purpose = remaining gas for the execution

//Function Types and Visibility:
//   view = this function just read the blockchain data, doesn't change anything. like this:
//       function getBalance() public view returns (uint) { return balance; }
//   pure = this function doesn't even read blockchain data, just do math. like:
//       function double(uint x) public pure returns (uint) { return x * 2; }
//   payable = this function can receive ETH. without this, contract can't get ETH directly.
//       function deposit() public payable { }  // now this func can accept ETH.
//   public = anyone and any contract can call this function.
//   private = only inside the same contract can access this function.
//   internal = only this contract and inherited contracts can access it.
//   external = only other contracts or external callers can access this function (not from inside this one).
//       you can’t call external function from inside the same contract unless you use this.func()


contract SendingTokens {
    event TokensSent(address indexed from, address indexed to, uint256 amount);

    mapping (address => uint) public SendAmouts;
    constructor() {}

    function sendTokens(address to, uint256 amount) external {
        emit TokensSent(msg.sender, to, amount);
    }
}
