import WatchKit
import Foundation

class EnterBillController: WKInterfaceController {

    let numpad = Numpad()

    @IBOutlet weak var numpadDisplay: WKInterfaceLabel!

    override func willActivate() {
        super.willActivate()
        clear()
    }

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return [
            "billSubTotal" : numpad.value
        ]
    }

    @IBAction func clear() {
        numpad.clear()
        numpadDisplay.setText(numpad.display)
    }

    @IBAction func pressDot() {
        numpad.pressDot()
        numpadDisplay.setText(numpad.display)
    }

    private func pressNumber(number: Int) {
        numpad.press(number: number)
        numpadDisplay.setText(numpad.display)
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
