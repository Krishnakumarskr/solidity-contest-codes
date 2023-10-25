//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "forge-std/Test.sol";
// import {console} from "forge-std/Console.sol";

import {SafeNFT} from "../../src/SafeNFT/SafeNFT.sol";
import {AttackSafeNFT} from "../../src/SafeNFT/AttackSafeNFT.sol";


contract SafeNFTTest is Test {

    SafeNFT safeNFT;
    AttackSafeNFT attack;
    address hacker;

    function setUp() public {
        safeNFT = new SafeNFT("test_name", "test_symbol", 0.5 ether);
        attack = new AttackSafeNFT(address(safeNFT));
        hacker = makeAddr("hacker");
    }

    function testAttackSafeNFT() public {

        vm.startPrank(hacker);
        console.log(safeNFT.balanceOf(address(attack)));
        vm.deal(hacker, 0.5 ether);
        attack.attack{value: 0.5 ether}();
        vm.stopPrank();

        console.log(safeNFT.balanceOf(address(attack)));
    }
}