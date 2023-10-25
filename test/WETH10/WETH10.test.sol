//SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/Console.sol";
import {WETH10} from "../../src/WETH10/WETH10.sol";
import {Attack} from "../../src/WETH10/Attack.sol";

contract Weth10Test is Test {
    WETH10 public weth;
    address owner;
    address bob;
    Attack attack;

    function setUp() public {
        weth = new WETH10();
        bob = makeAddr("bob");

        vm.deal(address(weth), 10 ether);
        vm.deal(address(bob), 1 ether);
    }

    function testHackWeth10() public {
        assertEq(address(weth).balance, 10 ether, "weth contract should have 10 ether");


        vm.startPrank(bob);
        attack = new Attack(address(weth));
        attack.safeGuardEth();


        // hack time!

        vm.stopPrank();
        assertEq(address(weth).balance, 0, "empty weth contract");
        assertEq(bob.balance, 11 ether, "player should end with 11 ether");
    }
}