/**
 * @author JuanFuent.es
 * @name Cursor
 * @desc 
 */

import {
    _createElement
} from "gsap/CSSPlugin"
import Mouse from "./mouse"
import { gsap } from "gsap"
import { Vector2 } from "three"

export default class Cursor {
    constructor() {
        this.pointer_element = document.querySelector(".toggle-play-btn")
        if (!this.pointer_element) return false
        this.pointer_visible = false
        this.pointer = new Mouse(this.pointer_element)
        this.setPointerTl()
        this.container = this.pointer_element
        // this.container = document.createElement("div")
        // document.body.appendChild(this.container)
        this.position = new Vector2(1, 1)
        this.precision = 2
        this.scale = 1
        this.degrees = 0
        this.lerp = 0.915
        this.size = this.container.getBoundingClientRect().width + 'px'
        this.style()
    }

    style() {
        this.pointer_element.style.position = "fixed"
        this.pointer_element.style.border = "1px solid #FFF"
        this.pointer_element.style.pointerEvents = "none"
    }

    setPointerTl() {
        gsap.set(this.pointer_element, {
            scaleX: .5,
            scaleY: .5,
            opacity: 0,
            display: 'none',
            transformOrigin: 'center'
        })
        //
        this.pointer_tl = gsap.timeline({
            paused: true
        })
        this.pointer_tl.to(this.pointer_element, {
            // ease: "steps(8)",
            ease: "power1.inOut",
            scaleX: 1,
            display: 'block',
            scaleY: 1,
            opacity: 1
        }, 0)
    }

    hide(_duration = .5) {
        if (this.pointer_element && this.pointer_visible) {
            this.pointer_visible = false
            return this.pointer_tl.duration(_duration).reverse()
        }
    }

    show(_duration = .5) {
        if (this.pointer_element && !this.pointer_visible) {
            this.pointer_visible = true
            return this.pointer_tl.duration(_duration).play()
        }
    }

    render() {
        if (!this.pointer_element) return false
        const speed_morph = this.speed_morph()
        this.scale += (speed_morph - this.scale) * this.lerp
        const _rect = this.pointer_element.getBoundingClientRect()
        let _x = - (_rect.width / 2) + this.pointer.x
        let _y = - (_rect.height / 2) + this.pointer.y
        this.position.x = lerp(_x, this.x, this.lerp)
        this.position.y = lerp(_y, this.y, this.lerp)

        this.degrees = Math.atan2(this.dy, this.dx) * 180 / Math.PI

        gsap.set(this.container, {
            force3D: true,
            x: this.x,
            y: this.y
        })
    }

    speed_morph() {
        const min = 0.3
        const max_distance = 500
        const total = this.dist / max_distance
        return Number(Math.min(total, min).toFixed(2))
    }

    get x() {
        return this.position.x.toFixed(this.precision)
    }

    get rotation() {
        return this.degrees.toFixed(this.precision)
    }

    get y() {
        return this.position.y.toFixed(this.precision)
    }

    get dx() {
        return this.pointer.x - this.position.x
    }

    get dy() {
        return this.pointer.y - this.position.y
    }

    get dist() {
        return Math.hypot(this.dx, this.dy)
    }
}
