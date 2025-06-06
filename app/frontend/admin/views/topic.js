import Uploader from '../uploader'

export default class Topic {
    constructor() {
        this.events()
    }

    events() {
        $(document).on("click", "#add-topic-block-btn", (e) => {
            e.preventDefault()
            let time = new Date().getTime()
            let regexp = new RegExp(e.target.dataset.id, 'g')
            let $html = $(e.target.dataset.fields.replace(regexp, time))
            $("#topic-blocks-container").prepend($html[0])
            return new Uploader($html[0].querySelector('.uploader-container'))
        })

        $(document).on("click", ".tab-link", (e) => {
            e.preventDefault()
            $(".tab-link").removeClass("active")
            $(e.target).addClass("active")
            $(".tab").hide()
            $(e.target.hash).show()
        })
    }
}