import gsap from "gsap/all"

export default class Alert {
	constructor(element) {
		this.element = element
		//
		this.visible = false
		this.setTl()
		this.events()
		this.show()
		gsap.delayedCall(3, () => this.hide())
	}
	
	events() {
		this.element.addEventListener("click", () => this.hide())
	}
	
	setTl() {
		this.tl = new gsap.timeline({
			paused: true
		}).from(this.element, {
			ease: "back.out(.7)",
			opacity: 0,
			display: "none",
			y: -60
		}, 0)
	}
	
	show() {
		if (this.visible) return false
		this.visible = true
		return this.tl.duration(.9).play()
	}
	
	hide() {
		if (!this.visible) return false
		this.visible = false
		return this.tl.duration(.45).reverse()
	}
}