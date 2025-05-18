import Topic from './views/topic'
import Editor from './text-editor'
export default class Forms {
    constructor() {
        this.topic = new Topic()
        this.events()
        this.sortable()
        this.setEditors()
        this.selectize()
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

    setEditors() {
        this.editors = []
        let editors = document.querySelectorAll('.editor-container')
        editors.forEach((editor) => {
            this.editors.push(new Editor(editor))
        })
    }

    sanitize(str = "") {
        return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(" ", "-")
    }

    selectize() {
        $('.selectize').selectize({
            create: true,
            sortField: "text"
        })
    }

    events() {
        $(document).on("click", ".remove-block", (e) => {
            let target = $(e.target).data("target")
            $(target).hide()
            $(target + " [required]").removeAttr("required")
        })
        $(document).on("change", '.input-file', (el) => {
            const [file] = $(el.target)[0].files
            let target = $(el.target).data("target")
            if (file) return $(target).attr("src", URL.createObjectURL(file))
            else return $(target).attr("src", "")
        })

        // Contador de caracteres
        $(document).on("keyup", '.str-counter', (el) => {
            let str = $(el.target).val()
            let target = $(el.target).data("target")
            $(target).text(str.length)
        })

        // .input-og-value se ocupa para los campos que se reflejan en la miniatura de la  og card
        $(document).on("keyup", '.input-og-value', (el) => {
            let str = $(el.target).val()
            let attr = $(el.target).data("attr")
            $(`#page-og-${attr}`).text(str)
        })
    }
}