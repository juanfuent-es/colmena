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
        this.sortable()
        //
        document.querySelectorAll('.alert').forEach(item => new Alert(item))
        document.querySelectorAll('.uploader-container:not(.is-video)').forEach(container => new Uploader(container))
        document.querySelectorAll('.uploader-container.is-video').forEach(container => new VideoUploader(container))
    }

    sortable() {
        $(".sortable").sortable({
			update: function() {
                let ids = []
                $(this).children("[data-id]").each((idx, el) => {
                    ids.push($(el).data("id"))
                })
                $.ajax({
                    url: $(this).data("url"),
                    data: {
                        ids: ids.join("_")
                    }
                })
            }
		})
    }

    loaded() {
        return this.preloader.hide()
    }
}

window["app"] = new Admin()
window.addEventListener("load", window["app"].loaded())