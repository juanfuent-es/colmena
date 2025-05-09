import Editor from './text-editor'
export default class Forms {
    constructor() {
        this.events()
        this.setEditors()
        this.plugins()
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

    plugins() {
        $('.selectize').selectize({
            create: true,
            sortField: "text"
        })
    }

    events() {
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