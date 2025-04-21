export default class Analytics {
    constructor(trackingId) {
        this.trackingId = trackingId
    }

    load() {
        // Google tag (gtag.js)
        const script1 = document.createElement('script')
        script1.async = true
        script1.src = `https://www.googletagmanager.com/gtag/js?id=${this.trackingId}`
        document.head.appendChild(script1)

        const script2 = document.createElement('script')
        script2.innerHTML = `
          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());
          gtag('config', '${this.trackingId}');
        `
        document.head.appendChild(script2)
    }
}