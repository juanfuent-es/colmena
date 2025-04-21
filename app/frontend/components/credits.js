/**
 * @author JuanFuent.es
 * @desc Imprime en consola del browser créditos
 * @param { String } Message
 */
export default class Credits {
    constructor(msg = "Lorem Credits") {
        this.msg = [
            `%c %c ${msg} `,
            'background: #FFF; padding: 5px 0;',
            'font-family: monospace; background: black; color: #FFF; padding: 5px 5px 5px 5px;'
        ]
        this.craft = [
            "%c %c Web Development | https://juanfuent.es",
            'background: #FCFCFC; color: orange; padding: 5px 0;',
            'font-family: monospace; color: #FFF; background: #000; padding: 5px 5px 5px 5px;'
        ]
        this.roll()
    }
    
    roll() {
        console.log.apply(console, this.msg)
        console.log.apply(console, this.craft)
    }
}