/**
 * @filename: lint-staged.config.js
 * @type {import('lint-staged').Configuration}
 */
export default {
  "*": "prettier --write --ignore-unknown",
  "*.{yaml,yml}": "yamllint --list-files --strict",
};
