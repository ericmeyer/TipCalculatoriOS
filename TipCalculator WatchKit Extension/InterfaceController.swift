import WatchKit
import Foundation


class CalculateTotalController: WKInterfaceController {

    let bill = Bill()
    let formatter = CurrencyFormatter()

    @IBOutlet weak var tipPercentDisplay: WKInterfaceLabel!
    @IBOutlet weak var total: WKInterfaceLabel!

    @IBAction func tipChanged(tipPercentage: Float) {
        bill.tipPercentage = tipPercentage
        tipPercentDisplay.setText("\(Int(tipPercentage))%")
        total.setText(formatter.format(bill.total()))
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if let context = context as? Dictionary<String, Float> {
            bill.subtotal = context["billSubTotal"]!
        }
        tipChanged(15)
    }

}
