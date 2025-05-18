# Decentralized Application (dApp) Starter Kit: Frontend + Blockchain

## Overview
This repository provides a comprehensive starter kit for building decentralized applications (dApps). It integrates a simple React frontend with a Hardhat-based blockchain development environment. Use this as a foundation to develop and deploy your dApps.
You may assume Node.js, npm, and Hardhat are installed and configured.

## Structure
Your working directory is `/workspace/sandbox-init-template`. The key structure of this project is as follows:

```
/workspace/sandbox-init-template
├── .gitignore
├── blockchain/                  # Smart contract development and deployment
│   ├── contracts/               # Solidity smart contracts
│   │   └── .gitkeep
│   ├── hardhat.config.js        # Hardhat configuration
│   ├── package.json             # Dependencies for blockchain development
│   ├── package-lock.json
│   ├── scripts/                 # Deployment and interaction scripts
│   │   └── .gitkeep
│   └── test/                    # Smart contract tests
│       └── .gitkeep
├── frontend/                    # Plain JavaScript frontend (all files and directories are empty)
│   ├── contracts                # empty directory where the post deployment will store contract address and abi
│   ├── index.html               # Main HTML entry point
│   ├── index.css               
│   └── postcss.config.js        
│   └── tailwind.config.js       
│   └── package.json            
│   └── package-lock.json
│   └── favicon.ico
│   └── App.jsx                 # main jsx file you need to modify to implement the required functionality
```

## Technical Stack

**Frontend:**
- React 
- Vite
- Tailwind  
- Ethers

**Blockchain:**
- **Development Environment:** Hardhat
- **Smart Contract Language:** Solidity
- **Testing:** Mocha/Chai (via Hardhat)
- **Deployment/Interaction:** Ethers.js
- **Package Manager:** npm

This implementation provides a robust foundation for a modern decentralized application. Build upon this structure to implement specific user requirements.

<current-blockchain-code>

/workspace/sandbox-init-template/blockchain/hardhat.config.js
```
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
solidity: "0.8.20",
networks: {
hardhat: {},
// Add other networks as needed
// Example:
sepolia: {
url: process.env.SEPOLIA_URL || "",
accounts: process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
},
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
```

/workspace/sandbox-init-template/blockchain/package.json
```
{
  "name": "blockchain",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "description": "",
  "devDependencies": {
    "@nomicfoundation/hardhat-chai-matchers": "^2.0.8",
    "@nomicfoundation/hardhat-ethers": "^3.0.8",
    "@nomicfoundation/hardhat-network-helpers": "^1.0.12",
    "@nomicfoundation/hardhat-toolbox": "^5.0.0",
    "@openzeppelin/contracts": "^5.3.0",
    "@typechain/ethers-v6": "^0.5.1",
    "@typechain/hardhat": "^9.1.0",
    "chai": "^4.5.0",
    "dotenv": "^16.5.0",
    "ethers": "^6.13.7",
    "hardhat": "^2.23.0",
    "hardhat-gas-reporter": "^1.0.10",
    "solidity-coverage": "^0.8.15",
    "typechain": "^8.3.2"
  }
}
```
</current-blockchain-code>

<current-frontend-code>
/workspace/sandbox-init-template/frontend/package.json
```
{
    "name": "dapp-frontend",
    "version": "1.0.0",
    "scripts": {
        "dev": "vite",
        "build": "vite build",
        "preview": "vite preview"
    },
    "dependencies": {
        "ethers": "^6.14.1",
        "react": "^18.3.1",
        "react-dom": "^18.3.1",
        "react-router-dom": "^7.6.0"
    },
    "devDependencies": {
        "autoprefixer": "^10.4.0",
        "postcss": "^8.4.0",
        "tailwindcss": "^3.3.0",
        "vite": "^4.0.0"
    }
}
```

/workspace/sandbox-init-template/frontend/App.jsx
```
import React from "react";
import { createRoot } from "react-dom/client";
import "./index.css";

function App() {
  return (
    <div className="flex items-center justify-center h-screen bg-gray-100">
      <h1 className="text-4xl font-bold text-blue-500">Hello, World!</h1>
    </div>
  );
}

// Mount it manually (since there's no main.jsx)
createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

export default App;
```

/workspace/sandbox-init-template/frontend/index.css
```
@tailwind base;
@tailwind components;
@tailwind utilities;
```
/workspace/sandbox-init-template/frontend/index.html
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Dapp</title>
  </head>
  <body class="bg-gray-100">
    <div id="root"></div>
    <script type="module" src="./App.jsx"></script>
  </body>
</html>
```

/workspace/sandbox-init-template/frontend/postcss.config.js
```
module.exports = {
    plugins: {
        tailwindcss: {},
        autoprefixer: {},
    },
}
```

/workspace/sandbox-init-template/frontend/tailwind.config.js
```
module.exports = {
    content: ["./index.html", "./App.jsx"],
    theme: {
        extend: {},
    },
    plugins: [],
}
```
</current-frontend-code>