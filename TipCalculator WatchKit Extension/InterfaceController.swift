import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tipPercentDisplay: WKInterfaceLabel!

    @IBAction func tipChanged(value: Float) {
        tipPercentDisplay.setText("\(Int(value))%")
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        tipPercentDisplay.setText("15%")
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
