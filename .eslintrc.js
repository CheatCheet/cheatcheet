module.exports = {
  root: true,
  extends: 'eslint:recommended',
  parser: '@babel/eslint-parser',
  env: {
    browser: true,
    jquery: true,
    es6: true,
  },
  ignorePatterns: ['app/javascript/controllers/index.js'],
  rules: {
    'no-undef': 'off',
    'no-eval': 'off',
    'no-new': 'off',
  },
}
