import js from "@eslint/js";
import globals from "globals";
import tseslint from "typescript-eslint";
import { defineConfig } from "eslint/config";
import stylisticTs from "@stylistic/eslint-plugin-ts";
import stylisticJs from "@stylistic/eslint-plugin-js";
import parserTs from "@typescript-eslint/parser";
import { jsRules } from "./eslint.jsrules.mjs";
import { tsRules } from "./eslint.tsrules.mjs";

export default defineConfig([
    {
        files: ["**/*.{js,mjs,cjs,ts}"],
        plugins: { js },
        extends: ["js/recommended"],
    },
    {
        files: ["**/*.{js,mjs,cjs,ts}"],
        languageOptions: { globals: globals.browser },
    },
    tseslint.configs.recommended,
    {
        files: ["**/*.{js,mjs,cjs,ts}"],
        plugins: { "@stylistic/js": stylisticJs },
        rules: jsRules,
    },
    {
        files: ["**/*.{cjs,ts}"],
        plugins: { "@stylistic/ts": stylisticTs },
        languageOptions: {
            parser: parserTs,
        },
        rules: tsRules,
    },
]);
