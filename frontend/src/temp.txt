# Anycademy Frontend

This project uses React + TypeScript + Vite with the following packages:

## Dependencies

- **@tailwindcss/vite** (^4.0.9) - TailwindCSS integration for Vite
- **axios** (^1.8.2) - Promise-based HTTP client for browser and Node.js
- **react** (^19.0.0) - JavaScript library for building user interfaces
- **react-dom** (^19.0.0) - React package for working with the DOM
- **react-router-dom** (^7.3.0) - Routing library for React applications
- **tailwindcss** (^4.0.9) - Utility-first CSS framework
- **super-tokens** (^1.8.2) - auth framework for jwt tokens

## Development Dependencies

- **@eslint/js** (^9.21.0) - ESLint JavaScript plugin
- **@types/react** (^19.0.10) - TypeScript definitions for React
- **@types/react-dom** (^19.0.4) - TypeScript definitions for React DOM
- **@vitejs/plugin-react** (^4.3.4) - Official React plugin for Vite
- **eslint** (^9.21.0) - JavaScript linting utility
- **eslint-plugin-react-hooks** (^5.1.0) - ESLint rules for React hooks
- **eslint-plugin-react-refresh** (^0.4.19) - ESLint plugin for React Fast Refresh
- **globals** (^15.15.0) - Global identifiers for ESLint
- **typescript** (~5.7.2) - TypeScript language
- **typescript-eslint** (^8.24.1) - TypeScript ESLint parser
- **vite** (^6.2.0) - Next generation frontend tooling

## Getting Started

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react/README.md) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

## Expanding the ESLint configuration

If you are developing a production application, we recommend updating the configuration to enable type-aware lint rules:

```js
export default tseslint.config({
  extends: [
    // Remove ...tseslint.configs.recommended and replace with this
    ...tseslint.configs.recommendedTypeChecked,
    // Alternatively, use this for stricter rules
    ...tseslint.configs.strictTypeChecked,
    // Optionally, add this for stylistic rules
    ...tseslint.configs.stylisticTypeChecked,
  ],
  languageOptions: {
    // other options...
    parserOptions: {
      project: ['./tsconfig.node.json', './tsconfig.app.json'],
      tsconfigRootDir: import.meta.dirname,
    },
  },
})
```

You can also install [eslint-plugin-react-x](https://github.com/Rel1cx/eslint-react/tree/main/packages/plugins/eslint-plugin-react-x) and [eslint-plugin-react-dom](https://github.com/Rel1cx/eslint-react/tree/main/packages/plugins/eslint-plugin-react-dom) for React-specific lint rules:

```js
// eslint.config.js
import reactX from 'eslint-plugin-react-x'
import reactDom from 'eslint-plugin-react-dom'

export default tseslint.config({
  plugins: {
    // Add the react-x and react-dom plugins
    'react-x': reactX,
    'react-dom': reactDom,
  },
  rules: {
    // other rules...
    // Enable its recommended typescript rules
    ...reactX.configs['recommended-typescript'].rules,
    ...reactDom.configs.recommended.rules,
  },
})
```
