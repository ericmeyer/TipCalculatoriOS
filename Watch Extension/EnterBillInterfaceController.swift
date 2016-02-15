import WatchKit
import Foundation
import TipCalculator


class EnterBillInterfaceController: WKInterfaceController {

    let numpad = Numpad()
    let formatter = CurrencyFormatter()

    @IBOutlet weak var numpadDisplay: WKInterfaceLabel!

    override func willActivate() {
        super.willActivate()
        let foo = Foo()
        foo.bar()
        clear()
    }

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return [
            "billSubTotal" : numpad.value / 100
        ]
    }

    @IBAction func clear() {
        updateDisplay()
    }

    private func pressNumber(number: Int) {
        numpad.press(number: number)
        updateDisplay()
    }

    private func updateDisplay() {
        numpadDisplay.setText(formatter.format(numpad.value / 100))
    }

    @IBAction func pressZero() {
        pressNumber(0)
    }

    @IBAction func pressOne() {
        pressNumber(1)
    }

    @IBAction func pressTwo() {
        pressNumber(2)
    }

    @IBAction func pressThree() {
        pressNumber(3)
    }

    @IBAction func pressFour() {
        pressNumber(4)
    }

    @IBAction func pressFive() {
        pressNumber(5)
    }

    @IBAction func pressSix() {
        pressNumber(6)
    }

    @IBAction func pressSeven() {
        pressNumber(7)
    }

    @IBAction func pressEight() {
        pressNumber(8)
    }
    
    @IBAction func pressNine() {
        pressNumber(9)
    }
    
}
