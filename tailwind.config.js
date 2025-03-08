module.exports = {
  // darkMode: false,
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
        sans: ['Hubot-sans', 'sans-serif'],
        mono: ['Space Mono', 'monospace'],
      },
    },
    colors: { // https://materialpalettes.com/
      current: "currentColor",
      black: '#000000',
      white: '#FFFFFF',
    }
  }
}