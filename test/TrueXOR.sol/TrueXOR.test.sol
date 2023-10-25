//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {TrueXOR, Target} from "../../src/TrueXoR/TrueXOR.sol";

contract TestTrueXOR is Test {

    TrueXOR trueXor;
    Target target;

    function setUp() public {
        trueXor = new TrueXOR();
        target = new Target();
    }

    function testTrueXor() public {
        vm.prank(msg.sender);
        bool success = trueXor.callMe{gas: 10000}(address(target));
        assertTrue(success);
    }
}