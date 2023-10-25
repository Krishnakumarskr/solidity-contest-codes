// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "./ERC721.sol";

contract SafeNFT is ERC721 {
    uint256 price;
    mapping(address=>bool) public canClaim;
    uint256 count;

    constructor(string memory tokenName, string memory tokenSymbol,uint256 _price) ERC721(tokenName, tokenSymbol) {
        price = _price; //price = 0.01 ETH
    }

    function buyNFT() external payable {
        require(price==msg.value,"INVALID_VALUE");
        canClaim[msg.sender] = true;
    }

    function claim() external {
        require(canClaim[msg.sender],"CANT_MINT");
        _safeMint(msg.sender, ++count); 
        canClaim[msg.sender] = false;
    }


    function tokenURI(uint256 id) public view override returns (string memory) {
        return "";
    }
 
}