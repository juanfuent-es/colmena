import "./core/constants"
import "./core/functions"
// import "./core/stats"
import "./core/ui"
import Preloader from "./components/preloader"
import Credits from './components/credits'
import Share from './components/share'

export default class Layout {
    constructor() {
        this.preloader = new Preloader()
        this.credits = new Credits("Colmena  | Community Building")
        this.share = new Share()
    }

    pageShow(e) {
        let historyTraversal = e.persisted || (typeof window.performance != "undefined" && window.performance.navigation.type === 2)
        if (historyTraversal) this.reload()
        else this.loaded()
    }

    reload(e) {
        return window.location.reload()
    }

    loaded() {
        this.preloader.hide()
    }
}