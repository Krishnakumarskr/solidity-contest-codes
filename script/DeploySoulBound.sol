// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import { Script } from 'forge-std/Script.sol';
import { SoulBound } from '../src/SoulBound.sol';

contract DeploySoulBound is Script {

    SoulBound soluBound;

    function run() external returns(SoulBound) {
        vm.startBroadcast();
        soluBound = new SoulBound();
        vm.stopBroadcast();
        return soluBound;
    }
}