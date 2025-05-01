#!/bin/bash

# Exit on error
set -e

# Create the main project directory
mkdir -p my-dapp
cd my-dapp

# Set up Hardhat project in blockchain directory
echo "Setting up Hardhat project..."
mkdir -p blockchain
cd blockchain

# Initialize npm and install Hardhat and related dependencies
npm init -y
npm install --save-dev hardhat @nomicfoundation/hardhat-toolbox @nomicfoundation/hardhat-network-helpers @nomicfoundation/hardhat-chai-matchers @nomicfoundation/hardhat-ethers @typechain/hardhat typechain @typechain/ethers-v6 chai ethers hardhat-gas-reporter solidity-coverage @openzeppelin/contracts dotenv

# Initialize Hardhat project
npx hardhat init --github false

# Create contract directory and sample contract
mkdir -p contracts
cat > contracts/SimpleStorage.sol << 'EOL'
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private value;

    event ValueChanged(uint256 newValue);

    function store(uint256 newValue) public {
        value = newValue;
        emit ValueChanged(newValue);
    }

    function retrieve() public view returns (uint256) {
        return value;
    }
}
EOL

# Create test directory and sample test
mkdir -p test
cat > test/SimpleStorage.js << 'EOL'
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("SimpleStorage", function () {
  let simpleStorage;
  let owner;

  beforeEach(async function () {
    [owner] = await ethers.getSigners();
    
    const SimpleStorage = await ethers.getContractFactory("SimpleStorage");
    simpleStorage = await SimpleStorage.deploy();
  });

  it("Should store and retrieve a value", async function () {
    await simpleStorage.store(42);
    expect(await simpleStorage.retrieve()).to.equal(42);
  });
});
EOL

# Create scripts directory and sample deployment script
mkdir -p scripts
cat > scripts/deploy.js << 'EOL'
const hre = require("hardhat");

async function main() {
  const SimpleStorage = await hre.ethers.getContractFactory("SimpleStorage");
  const simpleStorage = await SimpleStorage.deploy();

  await simpleStorage.waitForDeployment();
  
  const address = await simpleStorage.getAddress();
  console.log(`SimpleStorage deployed to: ${address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
EOL

# Customize hardhat.config.js
cat > hardhat.config.js << 'EOL'
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    hardhat: {},
    // Add other networks as needed
    // Example:
    // sepolia: {
    //   url: process.env.SEPOLIA_URL || "",
    //   accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    // },
  },
  paths: {
    artifacts: "./artifacts",
    cache: "./cache",
    sources: "./contracts",
    tests: "./test",
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};
EOL

# Create .env.example file
cat > .env.example << 'EOL'
PRIVATE_KEY=your_private_key_here
SEPOLIA_URL=your_sepolia_rpc_url_here
ETHERSCAN_API_KEY=your_etherscan_api_key_here
REPORT_GAS=true
EOL

# Return to project root
cd ..

# Set up React project in frontend directory
echo "Setting up React frontend..."
npx create-react-app frontend

# Navigate to frontend directory
cd frontend

# Install web3 related dependencies
npm install --save ethers@6.7.1 web3modal

# Create a utils directory and ethers setup file
mkdir -p src/utils
cat > src/utils/ethereum.js << 'EOL'
import { ethers } from 'ethers';

// This function detects if MetaMask is installed
export const detectEthereum = () => {
  return window.ethereum;
};

// This function creates an ethers provider
export const getProvider = () => {
  if (!detectEthereum()) {
    throw new Error('Please install MetaMask!');
  }
  return new ethers.BrowserProvider(window.ethereum);
};

// This function gets the signer
export const getSigner = async () => {
  const provider = getProvider();
  return await provider.getSigner();
};

// This function connects to a contract
export const connectToContract = async (contractAddress, contractABI) => {
  const signer = await getSigner();
  return new ethers.Contract(contractAddress, contractABI, signer);
};
EOL

# Create a sample component for interacting with the contract
mkdir -p src/components
cat > src/components/SimpleStorage.js << 'EOL'
import React, { useState, useEffect } from 'react';
import { connectToContract, getProvider } from '../utils/ethereum';

// Import your contract ABI (will be available after compilation)
// import SimpleStorageABI from '../contracts/SimpleStorage.json';

const SimpleStorage = () => {
  const [value, setValue] = useState('');
  const [storedValue, setStoredValue] = useState('');
  const [contract, setContract] = useState(null);
  const [account, setAccount] = useState('');
  const [isConnected, setIsConnected] = useState(false);

  // In a real app, you would import the real contract address after deployment
  const contractAddress = '0x0000000000000000000000000000000000000000'; 
  
  // Connect to MetaMask
  const connectWallet = async () => {
    try {
      const provider = getProvider();
      const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
      setAccount(accounts[0]);
      setIsConnected(true);
      
      // Once we have the ABI, we can initialize the contract
      // setContract(await connectToContract(contractAddress, SimpleStorageABI.abi));
    } catch (error) {
      console.error("Error connecting to wallet:", error);
    }
  };

  // Store a new value
  const handleStore = async () => {
    if (!contract) return;
    try {
      const tx = await contract.store(value);
      await tx.wait();
      fetchStoredValue();
    } catch (error) {
      console.error("Error storing value:", error);
    }
  };

  // Fetch the current stored value
  const fetchStoredValue = async () => {
    if (!contract) return;
    try {
      const currentValue = await contract.retrieve();
      setStoredValue(currentValue.toString());
    } catch (error) {
      console.error("Error fetching value:", error);
    }
  };

  return (
    <div className="simple-storage">
      <h2>Simple Storage DApp</h2>
      
      {!isConnected ? (
        <button onClick={connectWallet}>Connect Wallet</button>
      ) : (
        <div>
          <p>Connected Account: {account}</p>
          <div>
            <input 
              type="number" 
              value={value} 
              onChange={(e) => setValue(e.target.value)} 
              placeholder="Enter a value" 
            />
            <button onClick={handleStore}>Store Value</button>
          </div>
          <div>
            <button onClick={fetchStoredValue}>Get Stored Value</button>
            {storedValue && <p>Stored Value: {storedValue}</p>}
          </div>
        </div>
      )}
    </div>
  );
};

export default SimpleStorage;
EOL

# Update App.js to use the SimpleStorage component
cat > src/App.js << 'EOL'
import React from 'react';
import './App.css';
import SimpleStorage from './components/SimpleStorage';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>My Decentralized Application</h1>
        <SimpleStorage />
      </header>
    </div>
  );
}

export default App;
EOL

# Return to project root
cd ..

# Create a README.md file at the root
cat > README.md << 'EOL'
# My Decentralized Application

This is a decentralized application (DApp) built with Hardhat and React.

## Project Structure

- `blockchain/` - Hardhat project for smart contract development
- `frontend/` - React application for the user interface

## Getting Started

### Blockchain Development

```bash
cd blockchain
npm install
npx hardhat compile
npx hardhat test
```

To deploy to a local network:

```bash
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost
```

### Frontend Development

```bash
cd frontend
npm install
npm start
```

## Connecting Frontend to Smart Contracts

After deploying your contracts:

1. Copy the contract address from the deployment output
2. Update the `contractAddress` in `frontend/src/components/SimpleStorage.js`
3. Copy the contract ABI from `blockchain/artifacts/contracts/SimpleStorage.sol/SimpleStorage.json` 
   into your frontend project (for example in `frontend/src/contracts/`)
4. Uncomment the import line in the SimpleStorage component

## Environment Variables

Create a `.env` file in the `blockchain` directory based on `.env.example` with your settings.
EOL

# Create a file to connect contracts to frontend
mkdir -p scripts
cat > scripts/post-deploy.js << 'EOL'
#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

// This script copies contract artifacts to the frontend after deployment
const copyArtifacts = () => {
  const contractsDir = path.join(__dirname, '../frontend/src/contracts');
  
  // Create contracts directory if it doesn't exist
  if (!fs.existsSync(contractsDir)) {
    fs.mkdirSync(contractsDir, { recursive: true });
  }
  
  // Copy SimpleStorage ABI
  const simpleStorageArtifact = require('../blockchain/artifacts/contracts/SimpleStorage.sol/SimpleStorage.json');
  fs.writeFileSync(
    path.join(contractsDir, 'SimpleStorage.json'),
    JSON.stringify(simpleStorageArtifact, null, 2)
  );

  console.log('Contract artifacts copied to frontend!');
};

copyArtifacts();
EOL

# Make the post-deploy script executable
chmod +x scripts/post-deploy.js

# Create a .gitignore file
cat > .gitignore << 'EOL'
# Node
node_modules
npm-debug.log
yarn-error.log
.pnpm-debug.log

# Hardhat
blockchain/artifacts
blockchain/cache
blockchain/coverage
blockchain/coverage.json
blockchain/typechain
blockchain/typechain-types

# React
frontend/build
frontend/node_modules
frontend/.env.local
frontend/.env.development.local
frontend/.env.test.local
frontend/.env.production.local

# Environment variables
.env

# IDE
.idea
.vscode
*.swp
*.swo

# Mac
.DS_Store
EOL

echo "DApp project structure created successfully!"
echo "Next steps:"
echo "1. cd my-dapp"
echo "2. cd blockchain && npm install"
echo "3. npx hardhat compile"
echo "4. cd ../frontend && npm install"
echo "5. Update contract details once deployed"
