import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    let bill = Bill()

    @IBOutlet weak var tipPercentDisplay: WKInterfaceLabel!
    @IBOutlet weak var total: WKInterfaceLabel!

    @IBAction func tipChanged(value: Float) {
        tipPercentDisplay.setText("\(Int(value))%")
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        println(context)
        tipPercentDisplay.setText("15%")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        total.setText("$123.45")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
