import { defineConfig } from "vite";

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => ({
  server: {
    host: "0.0.0.0", // Allows IPv6 and external access (same as 0.0.0.0)
    port: 8080,
  },
}));

