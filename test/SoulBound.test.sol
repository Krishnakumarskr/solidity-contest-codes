pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/Console.sol";
import {SoulBound, ERC721TokenReceiver} from "../src/SoulBound.sol";
import {HackSoulBound} from "../src/HackSoulBound.sol";


contract SoulBoundTest is Test {
  SoulBound public soulBound ;
  address owner;
  address hacker;

  function setUp() public {
    // Set initial timestamp for foundry
    vm.warp(1696832805);

    owner = makeAddr("owner");
    hacker = makeAddr("hacker");

    vm.prank(owner);
    soulBound = new SoulBound();
  }

//   function test_Hack() public {
//     vm.startPrank(hacker, hacker);

//     //Your Solution
//     HackSoulBound hackContract = new HackSoulBound(address(soulBound));

//     // soulBound.register(hacker);
//     hackContract.register(address(hackContract));
//     hackContract.register(hacker);
//     soulBound.mint();

//     console.log(soulBound.balanceOf(address(hacker)));
//     console.log(soulBound.balanceOf(address(hackContract)));
    

//     vm.stopPrank();

//     uint256 nftBalance = soulBound.balanceOf(hacker);
//     assertGt(nftBalance, 1);
//   }
}