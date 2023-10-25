// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Vault.sol";
import "../src/HackVault.sol";

contract Challenge is Test {
    Vault public vault;
    address hacker;
    Attacker attacker;
    TestVault testVault;

    function setUp() public {
        vault = new Vault("BaoZang");
        hacker = makeAddr("hacker");
        testVault = new TestVault();


    }

    function testHack() public {
        vm.startPrank(hacker, hacker);
        attacker = new Attacker(address(vault));

        // solution
        // uint256 selector = uint256(keccak256("transferOwnership"));
        // vault.anyCall(selector, uint256(1));

        // bytes4 selector = bytes4(keccak256("anyCall(uint, uint)"));
        // uint transferSelector = uint256(keccak256("transferOwnership()"));

        // console.log('vault owner:', vault.owner());

        // assembly {
        //     let ptr := mload(0x40) // Get the free memory pointer
        //     mstore(ptr, selector) // Place the function selector at the beginning
        //     //mstore(add(ptr, 0x04), transferSelector) // Place the arbitrary value after the selector
        //     // mstore(add(ptr, 32), 2)

        //     // Call unsafeFunction on vulnerableContract
        //     let success := call(gas(), sload(vault.slot), 0, ptr, 0x24, 0, 0)
        // }

        // console.log(vulnerableContract.owner(), hacker);
        // attacker.attack();

        attacker.attack();
        console.log(testVault.owner());
        console.log(hacker);
        console.log(attacker.owner());





        vm.stopPrank();
        assertEq(vault.owner(), hacker);
    }
}