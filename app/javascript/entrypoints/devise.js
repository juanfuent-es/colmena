import Layout from "../layout"

import mitt from 'mitt'
window.LOAD_EVENT = mitt()

class App extends Layout {
    constructor() {
        super()
        this.status = "loading"
        this.addEvents()
    }
    
    addEvents() {
        document.querySelectorAll(".toggle-lecture-btn").forEach(item => this.addItemEvent(item))
        //
        window.onload = (e) => this.loaded(e)
        window.addEventListener("pageshow",  (e) => this.pageShow(e))
        window.onpopstate = (e) => this.reload(e)
    }
    
    addItemEvent(_item) {
        _item.addEventListener("click", (e) => {
            e.preventDefault()
            const target = _item.dataset.target
            const input = document.querySelector(target)
            const type = input.getAttribute("type")
            const icon = _item.querySelector("i")
            input.focus()
            if (type == "password") {
                icon.classList.remove("fa-eye")
                icon.classList.add("fa-eye-low-vision")
                return input.setAttribute("type", "text")
            } else {
                icon.classList.add("fa-eye")
                icon.classList.remove("fa-eye-low-vision")
                return input.setAttribute("type", "password")
            }
        })
    }
    
    loaded() {
        if (this.status == "loaded") return false
        this.status = "loaded"
        window.LOAD_EVENT.emit('loaded')
        this.preloader.hide()
    }

}

const _app = new App()