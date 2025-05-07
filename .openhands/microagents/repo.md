# Vite + React + TypeScript + Shadcn UI Project Repository

## Overview
This repository contains a modern web application built with Vite, React, TypeScript, and Shadcn UI. It serves as a comprehensive starting point for developing feature-rich user interfaces. Use this as a foundation to complete user requests.
You may assume Node.js, npm (or bun, as `bun.lockb` is present), and Vite are installed and configured.

## Structure
Your working directory is `/workspace/sandbox-init-template`. The key structure of this project is as follows:

```
/workspace/sandbox-init-template
├── .gitignore
├── bun.lockb
├── components.json
├── eslint.config.js
├── index.html                 # Main HTML entry point
├── package.json               # Project dependencies and scripts
├── package-lock.json
├── postcss.config.js
├── README.md
├── tailwind.config.ts
├── tsconfig.json              # TypeScript configuration
├── vite.config.ts             # Vite configuration
├── public/                    # Static assets
│   ├── favicon.ico
│   └── ...
└── src/                       # Main application source code
    ├── App.css
    ├── App.tsx                # Root React component
    ├── index.css              # Global styles
    ├── main.tsx               # Application entry point (renders App.tsx)
    ├── vite-env.d.ts
    ├── components/
    │   └── ui/                # Shadcn UI components (e.g., button.tsx, card.tsx)
    │       ├── accordion.tsx
    │       ├── alert.tsx
    │       ├── button.tsx
    │       └── ... (many other UI components)
    ├── hooks/                 # Custom React hooks
    │   ├── use-mobile.tsx
    │   └── use-toast.ts
    ├── lib/                   # Utility functions
    │   └── utils.ts
    └── pages/                 # Page-level components
        ├── Index.tsx
        └── NotFound.tsx
```

## Technical Stack
- **Build Tool & Dev Server:** Vite
- **UI Library/Framework:** React
- **Language:** TypeScript
- **UI Components:** Shadcn UI (built on Radix UI)
- **Styling:** Tailwind CSS (with PostCSS)
- **Routing:** React Router DOM
- **State Management/Data Fetching:** @tanstack/react-query
- **Forms:** React Hook Form & Zod for validation
- **Linting:** ESLint
- **Package Managers:** npm, bun (indicated by `bun.lockb`)

This implementation provides a robust foundation for a modern web application. Build upon this structure to implement specific user requirements. Your task is generally considered complete when the implemented features are functional and, if applicable, tested (e.g., by running `npm run dev` and verifying in a browser).
