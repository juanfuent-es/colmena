import "../core/constants"
import "../core/functions/index"

import Rails from "@rails/ujs"
import Forms from "../admin/forms.js"

import Alert from "../components/alert"
import Menu from "../components/menu"
import Preloader from "../components/preloader"

window.addEventListener("pageshow", function (event) {
    var historyTraversal = event.persisted || (typeof window.performance != "undefined" && window.performance.navigation.type === 2)
    if (historyTraversal) window.location.reload()
})

class Admin {
    constructor() {
        this.preloader = new Preloader()
        Rails.start()
        //
        this.menu = new Menu()
        this.forms = new Forms()
        //
        document.querySelectorAll('.alert').forEach(item => new Alert(item))
    }

    loaded() {
        return this.preloader.hide()
    }
}

window["app"] = new Admin()
window.addEventListener("load", window["app"].loaded())