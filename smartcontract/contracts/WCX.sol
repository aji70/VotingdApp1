// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Web3token is ERC20, ERC20Burnable {
    address public owner;
    string public userSymbol;
    string public userName;
    

    constructor(string memory _userSymbol, string memory _userName) ERC20(_userName, _userSymbol) {
        owner = msg.sender;
        userSymbol = _userSymbol;
        userName = _userName;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}