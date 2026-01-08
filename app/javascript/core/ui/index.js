import Cursor from "./cursor"

if (BROWSER.desktop) {
    window.CURSOR = new Cursor()
    window.RAF.on("animate", (delta) => window.CURSOR.render(delta))
}
