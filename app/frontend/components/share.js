import { gsap } from "gsap"
export default class Share {
    constructor() {
        this.shareButton = document.querySelector('#share-page-btn');
        if (!this.shareButton) return false
        this.span = this.shareButton.querySelector('span')
        this.txt = this.shareButton.getAttribute('aria-label') || 'Share'
        this.str = ''
        this.events()
        this.setTL()
    }
    
    events() {
        this.shareButton.addEventListener('click', (e) => this.onClick(e), false)
        this.shareButton.addEventListener('mouseenter', (e) => this.onMouseEnter(e), false)
        this.shareButton.addEventListener('mouseleave', (e) => this.onMouseLeave(e), false)
    }

    onClick(e) {
        e.preventDefault()
        if ('share' in navigator) return this.shareNative(e)
        else return this.copyLinkHandler(e)
    }

    setTL() {
        this.timeline = new gsap.timeline({
            paused: true,
            onComplete: () => {
                this.str = this.txt
                this.updateText()
            }
        })
        this.reverseTimeline = gsap.timeline({
            paused: true,
            onComplete: () => {
                this.timeline.restart().pause()
            }
        })
        //
        const chars = this.txt.split('')
        chars.forEach((char, index) => this.animateChar(index))
    }

    animateChar(charIdx) {
        const randomChars = '-/·=+*^%$#@!¡?¿';
        const chars = this.txt.split('')
        const duration = 1 / chars.length
        this.timeline.to({}, {
            duration: duration,
            // delay: charIdx * duration,
            onComplete: () => {
                let extraChar = randomChars.charAt(Math.floor(Math.random() * randomChars.length));
                this.str = this.txt.slice(0, charIdx) + extraChar
                this.updateText()
            }
        }, charIdx * duration)
        this.reverseTimeline.to({}, {
            duration: duration,
            // delay: charIdx * duration,
            onComplete: () => {
                this.str = this.txt.slice(0, chars.length - charIdx - 1);
                this.updateText();
            }
        }, charIdx * duration)
    }

    updateText() {
        this.span.innerText = this.str
        this.span.style.display = 'inline-block'
    }

    onMouseEnter() {
        this.reverseTimeline.restart().pause()
        this.timeline.duration(.35).play()
    }
    
    onMouseLeave() {
        this.reverseTimeline.duration(.15).play()
    }

    shareNative(e) {
        const title = document.querySelector("title").innerHTML || "Colmena"
        const text = document.querySelector("meta[name='description']")
        navigator.share({
            title: title,
            text: text,
            url: window.location.href
        })
    }
    
    copyLinkHandler(e) {
        e.preventDefault()
        let textArea = document.createElement("textarea")
        textArea.value = e.target.dataset.url
        document.body.appendChild(textArea)
        textArea.select()
        document.execCommand('copy')
        document.body.removeChild(textArea)
        this.span.innerText = "Link copied!"
    }
}