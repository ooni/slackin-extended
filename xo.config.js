/** @type {import('xo').FlatXoConfig} */
const xoConfig = [
  {
    space: true,
    rules: {
      'arrow-parens': 'off',
      '@stylistic/arrow-parens': [
        'error',
        'always',
      ],
      camelcase: 'off',
      'capitalized-comments': 'off',
      'comma-dangle': 'off',
      curly: [
        'error',
        'multi-line',
      ],
      'import-x/extensions': 'off',
      'import/extensions': 'off',
      'object-curly-spacing': 'off',
      '@stylistic/object-curly-spacing': [
        'error',
        'always',
      ],
      'operator-linebreak': [
        'error',
        'before',
      ],
      'spaced-comment': 'off',
      'unicorn/expiring-todo-comments': 'off',
      'unicorn/explicit-length-check': 'off',
      'unicorn/no-array-for-each': 'off',
      'unicorn/numeric-separators-style': 'off',
      'unicorn/prefer-module': 'off',
      'unicorn/prevent-abbreviations': 'off',
      'wrap-iife': 'off',
      '@stylistic/wrap-iife': [
        'error',
        'outside',
      ],
    },
  },
  {
    files: ['test/*.js'],
    languageOptions: {
      globals: {
        describe: 'readonly',
        it: 'readonly',
        before: 'readonly',
        after: 'readonly',
        beforeEach: 'readonly',
        afterEach: 'readonly',
      },
    },
  },
  {
    files: ['assets/*.js'],
    languageOptions: {
      ecmaVersion: 3,
      sourceType: 'script',
      globals: {
        window: 'readonly',
        document: 'readonly',
        navigator: 'readonly',
        XMLHttpRequest: 'readonly',
      },
    },
    rules: {
      'no-multi-assign': 'off',
      'no-var': 'off',
      'object-shorthand': 'off',
      'prefer-arrow-callback': 'off',
      'prefer-destructuring': 'off',
      semi: 'off',
      'unicorn/no-for-loop': 'off',
      'unicorn/numeric-separators-style': 'off',
      'unicorn/prefer-dom-node-append': 'off',
      'unicorn/prefer-dom-node-remove': 'off',
      'unicorn/prefer-math-trunc': 'off',
      'unicorn/prefer-modern-dom-apis': 'off',
      'unicorn/prefer-query-selector': 'off',
      'unicorn/prefer-string-starts-ends-with': 'off',
    },
  },
];

export default xoConfig;
