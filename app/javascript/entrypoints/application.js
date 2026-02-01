// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// Si usando un archivo TypeScript entrypoint:
//     <%= vite_typescript_tag 'application' %>
//
// Si quieres usar .jsx o .tsx, agrega la extensión:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Importar sistema de temas
import { initTheme, setTheme, getCurrentTheme } from '../theme'

// Inicializar tema del sistema
initTheme()

// Exponer funciones en ventana global para acceso desde HTML
window.app = window.app || {}
window.app.setTheme = setTheme
window.app.getCurrentTheme = getCurrentTheme

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'