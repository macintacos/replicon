import typescript from "@rollup/plugin-typescript";
import { nodeResolve } from "@rollup/plugin-node-resolve";
import commonjs from "@rollup/plugin-commonjs";
import eslint from "@rollup/plugin-eslint";

export default {
  input: "src/ts/main.ts",
  output: {
    dir: "./dist",
    sourcemap: "inline",
    format: "cjs",
    exports: "default",
  },
  external: ["obsidian"],
  plugins: [typescript(), nodeResolve({ browser: true }), commonjs(), eslint()],
};
