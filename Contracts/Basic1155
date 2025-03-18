// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Basic is ERC1155, Ownable {
    constructor(string memory uri) ERC1155(uri) {}

    // Mint tokens to an address (only callable by the owner or forging contract)
    function mint(address to, uint256 id, uint256 amount, bytes memory data) external onlyOwner {
        _mint(to, id, amount, data);
    }

    // Burn tokens from an address (only callable by the owner or forging contract)
    function burn(address from, uint256 id, uint256 amount) external onlyOwner {
        _burn(from, id, amount);
    }
}
