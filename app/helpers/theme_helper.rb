# frozen_string_literal: true

module ThemeHelper
  # Retorna la clase CSS actual del tema
  def theme_class
    'dark' if cookies[:theme] == 'dark' || (cookies[:theme].blank? && system_prefers_dark?)
  end

  # Detecta si el sistema prefiere dark mode
  def system_prefers_dark?
    request.headers['Sec-CH-Prefers-Color-Scheme']&.downcase == 'dark'
  end

  # Retorna el atributo color-scheme para HTML
  def color_scheme_meta
    tag.meta(name: 'color-scheme', content: 'light dark')
  end

  # Helper para componentes con contraste stone-950/stone-50
  # Uso: <div class="<%= contrast_classes %>">...</div>
  def contrast_classes(inverted: false)
    if inverted
      'bg-stone-950 text-stone-50 dark:bg-stone-50 dark:text-stone-950'
    else
      'bg-stone-50 text-stone-950 dark:bg-stone-950 dark:text-stone-50'
    end
  end

  # Helper para texto con contraste
  def contrast_text_classes(inverted: false)
    if inverted
      'text-stone-50 dark:text-stone-950'
    else
      'text-stone-950 dark:text-stone-50'
    end
  end
end
