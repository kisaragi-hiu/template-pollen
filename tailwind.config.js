let cjkFallback = [
  "Noto Sans CJK TC",
  "Microsoft Jhenghei",
  "Microsoft Yahei",
  "Meiryo",
  "Malgun Gothic",
];

module.exports = {
  content: ["src/**/*.{html.pm,html.p}"],
  theme: {
    fontFamily: {
      sans: ["Fira Sans", ...cjkFallback, "sans-serif"],
      serif: [
        "'Equity A'",
        "'Noto Serif CJK JP'",
        ...cjkFallback,
        "sans-serif",
      ],
      // serif: ["Equity"],
      mono: [
        "Inconsolata",
        "Noto Sans Mono CJK TC",
        ...cjkFallback,
        "monospace",
      ],
    },
    extend: {
      typography: {
        DEFAULT: {
          // cancelling this out in CSS is even uglier, so just do it here
          css: {
            "blockquote p:first-of-type::before": false,
            "blockquote p:last-of-type::after": false,
          },
        },
      },
    },
  },
  plugins: [require("@tailwindcss/typography")],
};
