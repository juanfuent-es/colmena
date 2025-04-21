export default class Lazy {
    constructor() {
        this.elements = document.querySelectorAll(".lazy")
    }

    setup() {
        if ('IntersectionObserver' in window) {
            let elements = [].slice.call(document.querySelectorAll('.lazy'))

            let lazyObserver = new IntersectionObserver(function (entries, observer) {
                entries.forEach(function (entry) {
                    if (entry.isIntersecting) {
                        let element = entry.target
                        element.src = element.dataset.src
                        if (element.tagName === 'VIDEO') {
                            element.load()
                        }
                        element.classList.remove('lazy')
                        lazyObserver.unobserve(element)
                    }
                })
            })

            elements.forEach( (lazyImage) => lazyObserver.observe(lazyImage))
        }
    }
}