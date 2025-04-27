export const tsRules = {
    "@typescript-eslint/adjacent-overload-signatures": "error",
    "@typescript-eslint/array-type": "off",
    // INFO: deprecitated
    // '@typescript-eslint/ban-types': [
    //     'error',
    //     {
    //         types: {
    //             Object: {
    //                 message: 'Avoid using the `Object` type. Did you mean `object`?',
    //             },
    //             Function: {
    //                 message:
    //                     'Avoid using the `Function` type. Prefer a specific function type, like `() => void`.',
    //             },
    //             Boolean: {
    //                 message: 'Avoid using the `Boolean` type. Did you mean `boolean`?',
    //             },
    //             Number: {
    //                 message: 'Avoid using the `Number` type. Did you mean `number`?',
    //             },
    //             String: {
    //                 message: 'Avoid using the `String` type. Did you mean `string`?',
    //             },
    //             Symbol: {
    //                 message: 'Avoid using the `Symbol` type. Did you mean `symbol`?',
    //             },
    //         },
    //     },
    // ],
    "@typescript-eslint/consistent-type-assertions": "error",
    // INFO: only useable in ts
    // '@typescript-eslint/dot-notation': 'error',
    "@typescript-eslint/explicit-member-accessibility": [
        "off",
        {
            accessibility: "explicit",
        },
    ],
    "@typescript-eslint/explicit-function-return-type": [
        "error",
        { allowExpressions: true },
    ],
    "@stylistic/ts/indent": [
        "error",
        2,
        {
            SwitchCase: 1,
            MemberExpression: "off",
            ignoredNodes: [
                "ArrowFunctionExpression Identifier",
                "ArrowFunctionExpression BlockStatement",
                "TSTypeParameterInstantiation",
            ],
        },
    ],
    "@stylistic/ts/member-delimiter-style": [
        "error",
        {
            multiline: {
                delimiter: "semi",
                requireLast: true,
            },
            singleline: {
                delimiter: "semi",
                requireLast: false,
            },
        },
    ],
    "@typescript-eslint/member-ordering": "off",
    "@typescript-eslint/naming-convention": [
        "error",
        { selector: "interface", format: ["PascalCase"], prefix: ["I"] },
        {
            selector: "memberLike",
            modifiers: ["private"],
            format: ["camelCase"],
            leadingUnderscore: "require",
        },
        { selector: "method", format: ["PascalCase"] },
        { selector: "typeLike", format: ["PascalCase"] },
        { selector: "variableLike", format: ["camelCase"] },
        { selector: "typeProperty", format: ["camelCase"] },
    ],
    "@typescript-eslint/no-empty-function": "off",
    "@typescript-eslint/no-empty-object-type": "error",
    "@typescript-eslint/no-explicit-any": "off",
    "@typescript-eslint/no-inferrable-types": [
        "error",
        {
            ignoreParameters: true,
        },
    ],
    "@typescript-eslint/no-misused-new": "error",
    "@typescript-eslint/no-namespace": "error",
    "@typescript-eslint/no-non-null-assertion": "error",
    "@typescript-eslint/no-parameter-properties": "off",
    "@typescript-eslint/no-shadow": [
        "error",
        {
            hoist: "all",
        },
    ],
    "@typescript-eslint/no-unused-expressions": "error",
    "@typescript-eslint/no-use-before-define": "off",
    "@typescript-eslint/no-var-requires": "off",
    "@stylistic/ts/no-extra-parens": [
        "error",
        "all",
        { nestedBinaryExpressions: false },
    ],
    "@typescript-eslint/prefer-for-of": "error",
    "@typescript-eslint/prefer-function-type": "error",
    "@typescript-eslint/prefer-namespace-keyword": "error",
    "@stylistic/ts/quotes": [
        "error",
        "single",
        {
            allowTemplateLiterals: true,
        },
    ],
    "@stylistic/ts/semi": ["error", "always"],
    "@typescript-eslint/triple-slash-reference": [
        "error",
        {
            path: "always",
            types: "prefer-import",
            lib: "always",
        },
    ],
    "@stylistic/ts/type-annotation-spacing": "error",
    "@typescript-eslint/unified-signatures": "error",
    "@typescript-eslint/comma-dangle": "off",
    "@stylistic/ts/comma-spacing": ["error"],
    "@typescript-eslint/arrow-body-style": "off",
};
