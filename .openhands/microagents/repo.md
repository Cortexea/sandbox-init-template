# Decentralized Application (dApp) Starter Kit: Frontend + Blockchain

## Overview
This repository provides a comprehensive starter kit for building decentralized applications (dApps). It integrates a modern frontend built with Vite, React, TypeScript, and Shadcn UI, with a Hardhat-based blockchain development environment. Use this as a foundation to develop and deploy your dApps.
You may assume Node.js, npm (or bun, as `bun.lockb` is present for the frontend), Vite, and Hardhat are installed and configured.

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
│   │   └── deploy.js
│   └── test/                    # Smart contract tests
│       └── .gitkeep
├── frontend/                    # Modern web application (Vite + React + TS)
│   ├── .gitignore
│   ├── bun.lockb
│   ├── components.json
│   ├── eslint.config.js
│   ├── index.html               # Main HTML entry point
│   ├── package.json             # Project dependencies and scripts for frontend
│   ├── package-lock.json
│   ├── postcss.config.js
│   ├── README.md
│   ├── tailwind.config.ts
│   ├── tsconfig.json            # TypeScript configuration for frontend
│   ├── vite.config.ts           # Vite configuration
│   ├── public/                  # Static assets for frontend
│   │   ├── favicon.ico
│   │   └── ...
│   └── src/                     # Main application source code for frontend
│       ├── App.css
│       ├── App.tsx              # Root React component
│       ├── index.css            # Global styles
│       ├── main.tsx             # Application entry point (renders App.tsx)
│       ├── vite-env.d.ts
│       ├── components/
│       │   └── ui/              # Shadcn UI components
│       │       ├── button.tsx
│       │       └── ...(many other UI components)
│       ├── hooks/               # Custom React hooks
│       │   ├── use-mobile.tsx
│       │   └── use-toast.ts
│       ├── lib/                 # Utility functions
│       │   └── utils.ts
│       └── pages/               # Page-level components
│           ├── Index.tsx
│           └── NotFound.tsx
└── scripts/                     # General project scripts (e.g., post-deployment)
    └── post-deploy.js
```

## Technical Stack

**Frontend:**
- **Build Tool & Dev Server:** Vite
- **UI Library/Framework:** React
- **Language:** TypeScript
- **UI Components:** Shadcn UI (built on Radix UI)
- **Styling:** Tailwind CSS (with PostCSS)
- **Routing:** React Router DOM
- **State Management/Data Fetching:** @tanstack/react-query
- **Forms:** React Hook Form & Zod for validation
- **Linting:** ESLint
- **Package Managers:** npm, bun

**Blockchain:**
- **Development Environment:** Hardhat
- **Smart Contract Language:** Solidity
- **Testing:** Mocha/Chai (via Hardhat)
- **Deployment/Interaction:** Ethers.js
- **Package Manager:** npm

This implementation provides a robust foundation for a modern decentralized application. Build upon this structure to implement specific user requirements. Your task is generally considered complete when the implemented features are functional and, if applicable, tested (e.g., by running `npm run dev` in the `frontend` directory and deploying/testing contracts in the `blockchain` directory).
