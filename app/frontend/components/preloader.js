import { gsap, Power2 } from "gsap/all"

export default class Preloader {
    constructor() {
        this.container = document.querySelector("#preloader")
        this.loaded = false
        this.setTL()
    }

    setTL() {
        this.tl = gsap.timeline({
            paused: true
        }).to("#preloader", {
            ease: 'power2.easeInOut',
            duration: .45,
            display: 'none',
            opacity: 0,
        })
        // .to("main", {
        //     ease: 'power2.easeInOut',
        //     duration: .45,
        //     opacity: 1
        // }, 0)
    }

    show() {
        if (!this.loaded) return false
        this.loaded = false
        // return this.tl.reverse()
        gsap.to("#preloader", {
            ease: 'power2.easeInOut',
            duration: .45,
            display: 'none',
            opacity: 0,
        })
    }

    hide(callback) {
        if (this.loaded) return false
        // this.loaded = true
        gsap.to("#preloader", {
            ease: 'power2.easeInOut',
            duration: .45,
            display: 'none',
            opacity: 0,
            onComplete: () => {
                this.loaded = true
                if (callback) callback()
            }
        })
        // return this.tl.delay(3).play()
        
    }
}