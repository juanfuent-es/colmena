export default class Uploader {
    constructor(container) {
        this.container = container;
        this.preview = this.container.querySelector('.uploader-image')
        this.input_id = this.container.querySelector('.uploader-id')
        this.fileInput = this.container.querySelector('.uploader-input')
        this.labelBtn = this.container.querySelector('label.btn')
        this.progressBar = this.container.querySelector('.uploader-progress')
        this.percent = this.container.querySelector('.uploader-percent')
        this.defaultURL = "/static/not-found.png";
        this.attr = this.container.dataset.attr || 'image'
        this.url = this.container.dataset.url || '/admin/images'

        this.initEvents()
    }

    // Inicializa los eventos para los elementos del DOM
    initEvents() {
        this.fileInput.addEventListener('change', (event) => this.uploadImage(event))
    }

    // Maneja la carga de la imagen
    uploadImage(event) {
        const csrf = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        const file = event.target.files[0]
        
        if (file) {
            this.preview.src = URL.createObjectURL(file)
            this.preview.classList.remove("opacity-0")
            this.preview.classList.add("opacity-40")
            const formData = new FormData()
            formData.append(this.attr, file)

            const xhr = new XMLHttpRequest()
            xhr.open('POST', this.url, true)
            xhr.setRequestHeader('X-CSRF-Token', csrf)
            xhr.upload.addEventListener('progress', (e) => this.updateProgress(e))
            xhr.onload = () => this.handleUploadResponse(xhr, file)

            xhr.send(formData)
        } else {
            this.preview.src = this.defaultURL
        }
    }

    // Actualiza la barra de progreso durante la carga de la imagen
    updateProgress(event) {
        if (event.lengthComputable) {
            const percentComplete = Math.round((event.loaded / event.total) * 100);
            this.progressBar.style.width = `${percentComplete}%`;
            this.percent.innerText = `${percentComplete}%`;
        }
    }

    // Maneja la respuesta del servidor después de cargar la imagen
    handleUploadResponse(xhr, file) {
        if (xhr.status === 201) {
            const response = JSON.parse(xhr.responseText)
            this.input_id.value = response.id;
            this.progressBar.style.width = '0%';
            this.percent.innerText = `Carga completa`;
            this.fileInput.value = ''; // Eliminar la referencia al archivo local
            setTimeout(() => {
                this.percent.innerText = ``
            }, 500)
            this.labelBtn.classList.remove("danger")
            this.labelBtn.classList.add("success")
        } else {
            console.error('Error uploading uploader:', xhr.responseText)
        }
    }

}