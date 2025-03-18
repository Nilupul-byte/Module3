// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./basicERC1155.sol";

contract ForgingLogic is Ownable {
    Basic public tokenContract;

    // Cooldown for minting tokens [0-2]
    mapping(address => uint256) public cooldowns;

    // Constructor to set the ERC1155 token contract address
    constructor(address _tokenContract) {
        tokenContract = Basic(_tokenContract);
    }

    // Mint tokens [0-2] with a 1-minute cooldown
    function mintFree(uint256 id) external {
        require(id >= 0 && id <= 2, "Invalid token ID");
        require(block.timestamp >= cooldowns[msg.sender], "Cooldown not over");

        // Set cooldown to 1 minute from now
        cooldowns[msg.sender] = block.timestamp + 1 minutes;

        // Mint the token
        tokenContract.mint(msg.sender, id, 1, "");
    }

    // Forge token 3 by burning tokens 0 and 1
    function forgeToken3() external {
        require(tokenContract.balanceOf(msg.sender, 0) >= 1, "Insufficient token 0");
        require(tokenContract.balanceOf(msg.sender, 1) >= 1, "Insufficient token 1");

        // Burn tokens 0 and 1
        tokenContract.burn(msg.sender, 0, 1);
        tokenContract.burn(msg.sender, 1, 1);

        // Mint token 3
        tokenContract.mint(msg.sender, 3, 1, "");
    }

    // Forge token 4 by burning tokens 1 and 2
    function forgeToken4() external {
        require(tokenContract.balanceOf(msg.sender, 1) >= 1, "Insufficient token 1");
        require(tokenContract.balanceOf(msg.sender, 2) >= 1, "Insufficient token 2");

        // Burn tokens 1 and 2
        tokenContract.burn(msg.sender, 1, 1);
        tokenContract.burn(msg.sender, 2, 1);

        // Mint token 4
        tokenContract.mint(msg.sender, 4, 1, "");
    }

    // Forge token 5 by burning tokens 0 and 2
    function forgeToken5() external {
        require(tokenContract.balanceOf(msg.sender, 0) >= 1, "Insufficient token 0");
        require(tokenContract.balanceOf(msg.sender, 2) >= 1, "Insufficient token 2");

        // Burn tokens 0 and 2
        tokenContract.burn(msg.sender, 0, 1);
        tokenContract.burn(msg.sender, 2, 1);

        // Mint token 5
        tokenContract.mint(msg.sender, 5, 1, "");
    }

    // Forge token 6 by burning tokens 0, 1, and 2
    function forgeToken6() external {
        require(tokenContract.balanceOf(msg.sender, 0) >= 1, "Insufficient token 0");
        require(tokenContract.balanceOf(msg.sender, 1) >= 1, "Insufficient token 1");
        require(tokenContract.balanceOf(msg.sender, 2) >= 1, "Insufficient token 2");

        // Burn tokens 0, 1, and 2
        tokenContract.burn(msg.sender, 0, 1);
        tokenContract.burn(msg.sender, 1, 1);
        tokenContract.burn(msg.sender, 2, 1);

        // Mint token 6
        tokenContract.mint(msg.sender, 6, 1, "");
    }

    // Trade any token for tokens [0-2]
    function tradeForBasicTokens(uint256 id) external {
        require(id >= 0 && id <= 6, "Invalid token ID");

        // Burn the traded token
        tokenContract.burn(msg.sender, id, 1);

        // Mint a random basic token [0-2]
        uint256 randomTokenId = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 3;
        tokenContract.mint(msg.sender, randomTokenId, 1, "");
    }
}
