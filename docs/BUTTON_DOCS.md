# Componente Button - Documentación

## 📋 Descripción

Componente de botón con soporte completo para dark/light mode, múltiples variantes y alto contraste WCAG AA/AAA.

## 🎨 Variantes Disponibles

### 1. **Primary** (Default)
Alto contraste, acción principal
- Light: `stone-950` bg, `stone-50` text
- Dark: `stone-50` bg, `stone-950` text
- Ratio: 19.24:1 ✓ WCAG AAA

### 2. **Secondary**
Contraste medio, acciones secundarias
- Light: `stone-200` bg, `stone-950` text
- Dark: `stone-800` bg, `stone-50` text

### 3. **Outline**
Solo borde, transparente
- Light: `stone-950` border, `stone-950` text
- Dark: `stone-50` border, `stone-50` text
- Hover: Invierte fondo y texto

### 4. **Ghost**
Sin borde, transparente
- Light: hover `stone-100` bg
- Dark: hover `stone-900` bg

### 5. **Danger**
Acciones peligrosas (eliminar, etc.)
- Light: `red-600` bg
- Dark: `red-700` bg

## 📦 Parámetros

| Parámetro | Tipo | Valores | Default | Descripción |
|-----------|------|---------|---------|-------------|
| `text` | String | - | *requerido* | Texto del botón |
| `icon` | String | clase CSS | `nil` | Icono antes del texto |
| `button_type` | String | `button`, `submit`, `reset` | `button` | Tipo HTML |
| `variant` | String | `primary`, `secondary`, `outline`, `ghost`, `danger` | `primary` | Estilo visual |
| `size` | String | `sm`, `md`, `lg` | `md` | Tamaño |
| `full_width` | Boolean | `true`, `false` | `true` | Ancho completo |
| `disabled` | Boolean | `true`, `false` | `false` | Estado deshabilitado |

## 💻 Ejemplos de Uso

### Básico
```erb
<%= render 'components/button', text: 'Guardar' %>
```

### Con Icono
```erb
<%= render 'components/button', 
  text: 'Guardar', 
  icon: 'fas fa-save' 
%>
```

### Variantes
```erb
<!-- Primario -->
<%= render 'components/button', 
  text: 'Acción Principal', 
  variant: 'primary' 
%>

<!-- Secundario -->
<%= render 'components/button', 
  text: 'Cancelar', 
  variant: 'secondary' 
%>

<!-- Outline -->
<%= render 'components/button', 
  text: 'Más Info', 
  variant: 'outline' 
%>

<!-- Ghost -->
<%= render 'components/button', 
  text: 'Sutil', 
  variant: 'ghost' 
%>

<!-- Peligro -->
<%= render 'components/button', 
  text: 'Eliminar', 
  variant: 'danger',
  icon: 'fas fa-trash' 
%>
```

### Tamaños
```erb
<!-- Pequeño -->
<%= render 'components/button', 
  text: 'Pequeño', 
  size: 'sm' 
%>

<!-- Mediano (default) -->
<%= render 'components/button', 
  text: 'Mediano' 
%>

<!-- Grande -->
<%= render 'components/button', 
  text: 'Grande', 
  size: 'lg' 
%>
```

### Ancho y Estado
```erb
<!-- Ancho ajustado al contenido -->
<%= render 'components/button', 
  text: 'Ajustado', 
  full_width: false 
%>

<!-- Deshabilitado -->
<%= render 'components/button', 
  text: 'No disponible', 
  disabled: true 
%>
```

### Botón de Submit
```erb
<%= form_with model: @user do |f| %>
  <%= f.text_field :name %>
  
  <%= render 'components/button',
    text: 'Guardar Usuario',
    button_type: 'submit',
    variant: 'primary',
    icon: 'fas fa-check'
  %>
<% end %>
```

### Combinaciones Avanzadas
```erb
<!-- Botón pequeño outline sin ancho completo -->
<%= render 'components/button',
  text: 'Editar',
  icon: 'fas fa-edit',
  variant: 'outline',
  size: 'sm',
  full_width: false
%>

<!-- Botón grande peligro con confirmación -->
<div onclick="if(confirm('¿Estás seguro?')) { /* acción */ }">
  <%= render 'components/button',
    text: 'Eliminar Todo',
    icon: 'fas fa-trash-alt',
    variant: 'danger',
    size: 'lg'
  %>
</div>
```

## 🎨 Clases CSS Personalizadas

Si necesitas usar los estilos directamente:

```html
<!-- Botón primario -->
<button class="btn-primary px-4 py-2 rounded-lg">Click</button>

<!-- Botón secundario -->
<button class="btn-secondary px-4 py-2 rounded-lg">Click</button>

<!-- Botón outline -->
<button class="btn-outline px-4 py-2 rounded-lg">Click</button>

<!-- Botón ghost -->
<button class="btn-ghost px-4 py-2 rounded-lg">Click</button>

<!-- Botón danger -->
<button class="btn-danger px-4 py-2 rounded-lg">Click</button>
```

## 🎯 Estados Interactivos

Todos los botones incluyen:

✓ **Hover** - Color más oscuro/claro
✓ **Active** - Presionado visual
✓ **Focus** - Ring de enfoque accesible
✓ **Disabled** - Opacidad reducida, no clickeable
✓ **Transiciones** - 200ms smooth

## ♿ Accesibilidad

- ✓ Cumple WCAG AA/AAA en contraste
- ✓ Focus ring visible
- ✓ Estados hover/active claros
- ✓ Funciona sin JavaScript
- ✓ Soporte completo teclado

## 📱 Responsive

Los botones son responsive por defecto:
- Ancho completo en móviles (si `full_width: true`)
- Texto y padding ajustables por tamaño
- Touch-friendly (min 44x44px)

## 🌗 Dark/Light Mode

### Comportamiento:
1. **Automático**: Detecta preferencia del sistema
2. **Manual**: Usa selector de tema (`app.setTheme()`)
3. **Persistente**: Guarda en localStorage

### Contraste:
- Primary: 19.24:1 ratio (AAA)
- Secondary: >7:1 ratio (AAA)
- Outline: 19.24:1 ratio (AAA)
- Ghost: >4.5:1 ratio (AA)
- Danger: >4.5:1 ratio (AA)

## 🔧 Personalización

### Agregar nueva variante:

1. En [app/assets/tailwind/application.css](app/assets/tailwind/application.css):
```css
.btn-success {
    @apply bg-green-600 text-white 
           hover:bg-green-700 
           dark:bg-green-700 
           dark:hover:bg-green-600;
}
```

2. En [app/views/components/_button.html.erb](app/views/components/_button.html.erb):
```erb
when 'success'
  "btn-success"
```

3. Usar:
```erb
<%= render 'components/button', 
  text: 'Éxito', 
  variant: 'success' 
%>
```

## 📊 Resumen de Variantes

| Variante | Uso Principal | Contraste | Dark Auto |
|----------|---------------|-----------|-----------|
| Primary | Acción principal | AAA | ✓ |
| Secondary | Acción secundaria | AAA | ✓ |
| Outline | Acción terciaria | AAA | ✓ |
| Ghost | Acción sutil | AA | ✓ |
| Danger | Eliminar/peligro | AA | ✓ |

---

**Última actualización**: Febrero 2026
