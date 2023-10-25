pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/Console.sol";


contract KeeperTest is Test {
  address owner;
  address hacker;

  function setUp() public {
    // Set initial timestamp for foundry
    vm.warp(1696832805);

    owner = makeAddr("owner");
    hacker = makeAddr("hacker");
  }

    // function secretFunction(string memory f) external {
    //     require(
    //         keccak256(bytes(f)) !=
    //             0x097798381ee91bee7e3420f37298fe723a9eedeade5440d4b2b5ca3192da2428,
    //         "invalid"
    //     );
    //     (bool success, ) = address(this).call(
    //         abi.encodeWithSignature(f, msg.sender)
    //     );
    //     require(success, "call fail");
    // }

  function testKeeper() public {
    vm.prank(hacker);
    console.logBytes32(keccak256(bytes("changeKeeper(address)")));
  }
}