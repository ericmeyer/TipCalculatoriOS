import WatchKit
import Foundation


class EnterBillController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
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

    private func pressNumber(number: Int) {
        println("Number: \(number)")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return "Hey"
    }

}
