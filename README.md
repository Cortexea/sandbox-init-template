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
