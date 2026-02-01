module.exports = {
  darkMode: 'class',
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/tailwind/**/*.{css}',
    './app/javascript/**/*.js*'
  ],
  plugins: [
    require("tailwindcss"),
    require("@tailwindcss/forms")({
      strategy: 'base', // only generate global styles
      // strategy: 'class', // only generate classes
    }),
    require('postcss-import'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ],
  theme: { // @see: https://tailwindcss.com/docs/customizing-colors
    extend: {
      fontFamily: {
        sans: ['-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', 'sans-serif'],
        mono: ["ui-monospace", "Menlo", "Monaco", "Cascadia Mono", "Segoe UI Mono", "Roboto Mono", "Oxygen Mono", "Ubuntu Mono", "Source Code Pro", "Fira Mono", "Droid Sans Mono", "Consolas", "Courier New", "monospace"],
      },
    },
  }
}