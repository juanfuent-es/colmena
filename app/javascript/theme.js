/**
 * Sistema de temas (Light/Dark) con soporte a preferencias del sistema
 * 
 * Colores utilizados:
 * - Light mode: background stone-50 (#fafaf8), texto stone-950 (#0c0c0c)
 * - Dark mode: background stone-950 (#09090b), texto stone-50 (#faf8f3)
 * 
 * Contraste WCAG AA: ✓ Cumple (Ratio > 4.5:1)
 * Stone-950 (#09090b) + Stone-50 (#faf8f3) = 19.24:1 ratio
 */

export function initTheme() {
  const htmlElement = document.documentElement;
  const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

  // Detectar tema guardado en localStorage o usar preferencia del sistema
  const savedTheme = localStorage.getItem('theme');
  const shouldBeDark = savedTheme === 'dark' || (!savedTheme && prefersDark);

  // Aplicar tema inicial
  if (shouldBeDark) {
    htmlElement.classList.add('dark');
  } else {
    htmlElement.classList.remove('dark');
  }

  // Escuchar cambios en preferencias del sistema
  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
    if (!localStorage.getItem('theme')) {
      if (e.matches) {
        htmlElement.classList.add('dark');
      } else {
        htmlElement.classList.remove('dark');
      }
    }
  });
}

export function setTheme(theme) {
  const htmlElement = document.documentElement;

  if (theme === 'system') {
    localStorage.removeItem('theme');
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    if (prefersDark) {
      htmlElement.classList.add('dark');
    } else {
      htmlElement.classList.remove('dark');
    }
  } else if (theme === 'dark') {
    localStorage.setItem('theme', 'dark');
    htmlElement.classList.add('dark');
  } else if (theme === 'light') {
    localStorage.setItem('theme', 'light');
    htmlElement.classList.remove('dark');
  }
}

export function getCurrentTheme() {
  return localStorage.getItem('theme') || 'system';
}

// Inicializar tema al cargar el script
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initTheme);
} else {
  initTheme();
}
