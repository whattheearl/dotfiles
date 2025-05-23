export const jsRules = {
    'arrow-body-style': 'off',
    'arrow-parens': ['off', 'always'],
    'comma-dangle': 'off',
    '@stylistic/js/comma-spacing': 'error',
    complexity: 'off',
    'constructor-super': 'error',
    curly: 'error',
    '@stylistic/js/eol-last': 'error',
    eqeqeq: ['error', 'smart'],
    'guard-for-in': 'error',
    'id-denylist': [
        'error',
        'any',
        'Number',
        'number',
        'String',
        'string',
        'Boolean',
        'boolean',
        'Undefined',
        'undefined',
    ],
    'id-match': 'error',
    'import/order': 'off',
    'max-classes-per-file': 'off',
    'max-len': 'off',
    '@stylistic/js/new-parens': 'error',
    'no-bitwise': 'error',
    'no-caller': 'error',
    'no-cond-assign': 'error',
    'no-console': [
        'error',
        {
            allow: [
                'log',
                'warn',
                'dir',
                'timeLog',
                'assert',
                'clear',
                'count',
                'countReset',
                'group',
                'groupEnd',
                'table',
                'dirxml',
                'error',
                'groupCollapsed',
                'Console',
                'profile',
                'profileEnd',
                'timeStamp',
                'context',
            ],
        },
    ],
    'no-debugger': 'error',
    'no-empty': 'off',
    'no-eval': 'error',
    'no-extra-parens': 'off',
    'no-fallthrough': 'error',
    'no-invalid-this': 'off',
    'no-multiple-empty-lines': 'off',
    'no-new-wrappers': 'error',
    'no-restricted-imports': ['error', 'rxjs/Rx'],
    'no-throw-literal': 'error',
    '@stylistic/js/no-trailing-spaces': ['error', { ignoreComments: true, skipBlankLines: true }],
    'no-undef-init': 'error',
    'no-underscore-dangle': 'off',
    'no-unsafe-finally': 'error',
    'no-unused-labels': 'error',
    'no-var': 'error',
    'object-shorthand': 'error',
    'one-var': ['error', 'never'],
    'prefer-const': 'error',
    '@stylistic/js/quote-props': ['error', 'as-needed', { unnecessary: false }],
    radix: 'error',
    '@stylistic/js/space-before-function-paren': [
        'error',
        {
            anonymous: 'never',
            asyncArrow: 'always',
            named: 'never',
        },
    ],
    '@stylistic/js/spaced-comment': [
        'error',
        'always',
        {
            markers: ['/'],
        },
    ],
    'use-isnan': 'error',
    'valid-typeof': 'off',
};
