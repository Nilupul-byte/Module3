# ERC-1155 Token Minting & Forging dApp

## Overview
This project is a decentralized web app (dApp) that allows users to mint and forge ERC-1155 tokens on the **Polygon network**. The frontend is built with **Scaffold-ETH** (Next.js, RainbowKit, Wagmi, and TypeScript), and the smart contracts are deployed using **Hardhat**.

## Features
- **7 ERC-1155 tokens** (ID 0-6) with unlimited supply.
- **Free minting** for tokens [0-2] (1-minute cooldown).
- **Forging mechanics**:
  - Token 3 = Burn (0 + 1)
  - Token 4 = Burn (1 + 2)
  - Token 5 = Burn (0 + 2)
  - Token 6 = Burn (0 + 1 + 2)
- **Tokens [3-6] cannot be forged further** and can only be burned.
- **Trade tokens [0-2]** using a simple trade button.
- **Network & User Info**:
  - Displays **MATIC balance**.
  - Displays **user’s token holdings**.
  - **Auto-prompts** users to switch to Polygon if needed.
  - Provides a link to the **OpenSea page**.

## Tech Stack
- **Frontend**: Scaffold-ETH (Next.js, RainbowKit, Wagmi, TypeScript, Tailwind CSS)
- **Smart Contracts**: Solidity, Hardhat
- **Network**: Polygon (for lower gas fees)

## Setup & Deployment

### **1. Install Dependencies**
```sh
git clone <https://github.com/Nilupul-byte/Module3.git>
cd <Module3>
yarn install

//To remove cache
rm -rf ./cache ./artifacts
  
