module.exports = {
  plugins: [
    require("postcss-import"),
    require("autoprefixer"),
    require("cssnano"),
    require("postcss-inline-svg"),
    require("postcss-initial"),
    require("postcss-autoreset"),
    require("postcss-preset-env"),
  ],
};
