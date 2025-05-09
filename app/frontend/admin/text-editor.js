export default class TextEditor {

    constructor(_container) {
        this.container = _container
        this.element = this.container.querySelector('.editor')
        if (!this.element) return false
        this.editor = this.create()
        this.events()
    }

    events() {
        this.minimizeBtn = this.container.querySelector(".minimize-editor-btn")
        this.maximizeBtn = this.container.querySelector(".maximize-editor-btn")
        if (!this.minimizeBtn || !this.maximizeBtn) return false
        this.maximizeBtn.addEventListener("click", (e) => this.enterFullScreen(e))
        this.minimizeBtn.addEventListener("click", (e) => this.exitFullScreen(e))
        //
        this.maximizeBtn.style.display = "flex"
        this.minimizeBtn.style.display = "none"
    }

    enterFullScreen(e) {
        e.preventDefault()
        if (this.container.requestFullscreen) {
            this.container.requestFullscreen();
        } else if (this.container.mozRequestFullScreen) { // Firefox
            this.container.mozRequestFullScreen();
        } else if (this.container.webkitRequestFullscreen) { // Chrome, Safari y Opera
            this.container.webkitRequestFullscreen();
        } else if (this.container.msRequestFullscreen) { // IE/Edge
            this.container.msRequestFullscreen();
        }
        this.container.classList.add("fullscreen")
        this.maximizeBtn.style.display = "none"
        this.minimizeBtn.style.display = "flex"
    }

    exitFullScreen(e) {
        e.preventDefault()
        this.container.classList.remove("fullscreen")
        if (document.exitFullscreen) {
            document.exitFullscreen();
        } else if (document.mozCancelFullScreen) { // Firefox
            document.mozCancelFullScreen();
        } else if (document.webkitExitFullscreen) { // Chrome, Safari y Opera
            document.webkitExitFullscreen();
        } else if (document.msExitFullscreen) { // IE/Edge
            document.msExitFullscreen();
        }
        this.maximizeBtn.style.display = "flex"
        this.minimizeBtn.style.display = "none"
    }

    create() {
        return ClassicEditor.create(this.element, {
            // toolbar: ['heading', 'undo', 'redo', '|', 'bold', 'italic', 'link', 'numberedList', 'bulletedList', 'link', 'image'],
            toolbar: ["undo", "redo", '|', 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', "numberedList", "imageUpload", "blockQuote", "mediaEmbed"],
            heading: {
                options: [{
                    model: 'paragraph',
                    title: 'Párrafo',
                    class: 'ck-heading_paragraph'
                }, {
                    model: 'heading2',
                    view: 'h2',
                    title: 'Título',
                    class: 'ck-heading_heading2'
                }, {
                    model: 'heading3',
                    view: 'h3',
                    title: 'Subtítulo',
                    class: 'ck-heading_heading3'
                }]
            }
        })
    }
}