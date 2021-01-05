module.exports = {
  plugins: [
    require("postcss-import"),
    require("postcss-css-variables"),
    require("autoprefixer"),
    require("postcss-inline-svg")({
      paths: ["src/style/svg"],
    }),
    require("postcss-preset-env")({
      stage: 2,
      features: {
        "nesting-rules": true,
      },
    }),
    require("tailwindcss"),
    require("cssnano")({
      preset: "default",
    }),
  ],
};
