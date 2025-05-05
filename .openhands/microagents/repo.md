# DApp Project Repository

## Overview
This is a skeletal directory structure of a decentralized application with Hardhat (smart contracts) and React (frontend). Use this as a starting point to complete the user's requests.
You may assume hardhat, npm and react are installed. If you encounter not-found error, then attempt install.

## Structure
Your working directory is `/workspace`. It has a directory called sandbox-init-template, under which there are multiple subdirectories and files. You can safely assume the following structure exists:
```
sandbox-init-template
   ├── blockchain                   # Hardhat project
   │   ├── contracts                # empty
   │   ├── hardhat.config.js        # has solidity: "0.8.19" and other boilerplate
   │   ├── package-lock.json
   │   ├── package.json             # has required dependencies
   │   ├── scripts
   │   │   └── deploy.js            # empty
   │   └── test                     # empty
   ├── frontend                     # React app with ethers.js integration
   │   ├── package-lock.json
   │   ├── package.json             # has required dependencies like ethers and react
   │   ├── public                   # empty
   │   └── src                      # You will need to create App.js and other files here
   │       ├── components           # empty
   │       └── utils
   │           └── ethereum.js      # Utilities for wallet connection
   └── scripts
      └── post-deploy.js           # empty
```

## Technical Stack
- Solidity 0.8.19
- Hardhat
- React
- ethers.js v6.7.1
- web3modal

This implementation provides the minimum viable structure for a DApp. Build upon this foundation to implement specific user requirements. Your task is done when you've tested that the implementation works.