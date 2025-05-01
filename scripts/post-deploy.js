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
