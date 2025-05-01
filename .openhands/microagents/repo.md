# DApp Project Repository

## Overview
This is a skeletal directory structure of a decentralized application with Hardhat (smart contracts) and React (frontend). Use this as a starting point to complete the user's requests.

## Structure
```
my-dapp/
├── blockchain/         # Hardhat project
│   ├── contracts/      
│   ├── test/           # Test files
│   ├── scripts/        # Deployment scripts
│   └── hardhat.config.js
├── frontend/           # React app with ethers.js integration
│   ├── src/components/ 
│   └── src/utils/      # ethereum.js: Utilities for wallet connection
└── scripts/            # Project utilities like post-deploy.js
```

## Development Workflow
1. Compile contracts: `cd blockchain && npx hardhat compile`
   - Note: If you see compiler version errors, ensure the Solidity version in contracts matches the one in hardhat.config.js (0.8.19)
2. Test contracts: `npx hardhat test`
3. For local deployment: `npx hardhat node` (in one terminal) and `npx hardhat run scripts/deploy.js --network localhost` (in another)
4. For Sepolia deployment: 
   - First edit `.env` file and add your private key
   - Then run: `npx hardhat run scripts/deploy.js --network sepolia`
5. Copy contract address to frontend
   - After deployment, update contract address in `frontend/src/components/<contract>.js`
   - Write `node scripts/post-deploy.js` and run it to copy ABIs to frontend
6. Run frontend: `cd frontend && npm start`

## Technical Stack
- Solidity 0.8.19
- Hardhat
- React
- ethers.js v6.7.1
- web3modal

This implementation provides the minimum viable structure for a DApp. Build upon this foundation to implement specific user requirements.