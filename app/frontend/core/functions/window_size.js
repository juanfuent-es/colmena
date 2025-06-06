/**
 * Get real device screen size on desktop and mobile with orientation
 * @author juanfuent.es
 * @returns { object }
 */
import mitt from 'mitt'
//
window.SIZE = mitt()
window.WIDTH = window.innerWidth
window.HEIGHT = window.innerHeight
window.HALF_X = window.WIDTH / 2
window.HALF_Y = window.HEIGHT / 2
// doc / body size
let body_rect = document.body.getBoundingClientRect()
window.DOC_WIDTH = body_rect.width
window.DOC_HEIGHT = body_rect.height
//SCROLL MAX
window.MAX_SCROLL_X = window.DOC_WIDTH - WIDTH
window.MAX_SCROLL_Y = window.DOC_HEIGHT - HEIGHT

// Función para obtener el ancho del scroll
function getScrollbarWidth() {
    // Crear un elemento temporal
    const scrollDiv = document.createElement('div')
    scrollDiv.style.position = 'fixed'
    scrollDiv.style.visibility = 'hidden'
    scrollDiv.style.overflow = 'scroll'
    scrollDiv.style.width = '50px'
    scrollDiv.style.height = '50px'
    document.body.appendChild(scrollDiv)
  
    // Obtener el ancho del scroll
    const scrollbarWidth = scrollDiv.offsetWidth - scrollDiv.clientWidth;
  
    // Eliminar el elemento temporal
    document.body.removeChild(scrollDiv);
  
    return scrollbarWidth;
}
// Función para verificar si hay scroll
function hasScroll() {
    return document.body.scrollHeight > window.innerHeight;
}

function onResizeWindow() {
    // Define constants globally
    window.WIDTH = window.innerWidth
    window.HEIGHT = window.innerHeight

    if (BROWSER.desktop) {
        if (hasScroll()) {
            const scrollbar_width = getScrollbarWidth()
            window.WIDTH = window.WIDTH - scrollbar_width
        }
    } else {
        window.WIDTH = window.screen.width
        window.HEIGHT = window.screen.height
        if (window.WIDTH > window.HEIGHT) {
            window.WIDTH = window.screen.height
            window.HEIGHT = window.screen.width
        }
        // if (BROWSER.ios) {
        //     switch (Math.abs(window.orientation)) {
        //         case 0:
        //             window.WIDTH = window.screen.width
        //             window.HEIGHT = window.screen.height
        //             break;
        //         case 90:
        //             window.WIDTH = window.screen.height
        //             window.HEIGHT = window.screen.width
        //             break;
        //     }
        // }
    }
    //
    //
    window.HALF_X = window.WIDTH / 2
    window.HALF_Y = window.HEIGHT / 2

    const vh = (window.HEIGHT * .01).toFixed(2) //Real size on visible viewport
    document.documentElement.style.setProperty('--vh', `${vh}px`)
    // body dimensions
    let body_rect = document.body.getBoundingClientRect()
    window.DOC_WIDTH = body_rect.width
    window.DOC_HEIGHT = body_rect.height
    //SCROLL MAX
    window.MAX_SCROLL_X = window.DOC_WIDTH - WIDTH
    window.MAX_SCROLL_Y = window.DOC_HEIGHT - HEIGHT
    //
    window.SIZE.emit('resize', {
        width: window.WIDTH,
        height: window.HEIGHT
    })
}

let timeout = null

function debounce_resize() {
    let debounce_time = 200
    clearTimeout(timeout)
    timeout = setTimeout(() => onResizeWindow(), debounce_time)
}

const debounce_event = window.THROTTLE(80, () => debounce_resize())
onResizeWindow()
//
document.addEventListener("visibilitychange", () => {
    if (!document.hidden) return onResizeWindow()
})

window.addEventListener("orientationchange", () => {
    setTimeout(100, () => {
        return onResizeWindow()
    })
}, false)

const onResize = new ResizeObserver(debounce_event)
onResize.observe(document.body.parentElement)