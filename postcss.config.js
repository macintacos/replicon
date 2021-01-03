module.exports = {
  plugins: [
    require("postcss-import"),
    require("autoprefixer"),
    require("cssnano"),
    require("postcss-inline-svg"),
    require("postcss-initial"),
    require("postcss-preset-env")({
      stage: 2,
      features: {
        "nesting-rules": true,
      },
    }),
    require("tailwindcss"),
  ],
};
