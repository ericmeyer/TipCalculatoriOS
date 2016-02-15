import WatchKit
import Foundation


class CalculateTotalInterfaceController: WKInterfaceController {

    let bill = Bill()
    let formatter = CurrencyFormatter()

    @IBOutlet weak var tipPercentDisplay: WKInterfaceLabel!
    @IBOutlet weak var subtotal: WKInterfaceLabel!
    @IBOutlet weak var tip: WKInterfaceLabel!
    @IBOutlet weak var total: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if let context = context as? Dictionary<String, Float> {
            bill.subtotal = context["billSubTotal"]!
            subtotal.setText(formatter.format(bill.subtotal))
        }
        tipChanged(15)
    }

    @IBAction func tipChanged(tipPercentage: Float) {
        bill.tipPercentage = tipPercentage
        tipPercentDisplay.setText("\(Int(tipPercentage))%")
        tip.setText(formatter.format(bill.tip()))
        total.setText(formatter.format(bill.total()))
    }
}
