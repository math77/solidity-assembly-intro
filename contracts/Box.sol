// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Box {

  uint256 private _value;

  event NewValue(uint256 newValue);
	
  function retrieve() public view returns (uint256) {
    assembly {

      //load value
      let v := sload(0)
      //store in the memory
      mstore(0x80, v)
      //return at 0 memory address and 32 bytes size
      return(0x80, 32)
    }
  }

  function store(uint256 newValue) public {
    assembly {
      sstore(0, newValue)
      
      // emit event
      mstore(0x80, newValue)

      //third param: hash of event signature bytes32(keccak256("NewValue(uint256)"))
      log1(0x80, 0x20,0xac3e966f295f2d5312f973dc6d42f30a6dc1c1f76ab8ee91cc8ca5dad1fa60fd)

    }
  } 
}
