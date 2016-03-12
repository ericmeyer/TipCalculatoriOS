import UIKit
import TipCalculator

public class ViewController: UIViewController {

    @IBOutlet weak public var tipAmount: UILabel!
    @IBOutlet weak public var tipPercent: UISlider!
    private var subtotal: Float = 0.0
    private var bill = Bill()

    override public func viewDidLoad() {
        super.viewDidLoad()
        bill.tipPercentage = 15.0
        tipPercent.value = 15.0
        updateTipAmount()
    }

    @IBAction public func subtotalChanged(sender: UITextField) {
        bill.subtotal = (sender.text! as NSString).floatValue
        updateTipAmount()
    }

    public func tipPercentChanged(tipPercent: Float){
        bill.tipPercentage = tipPercent
        updateTipAmount()
    }

    private func updateTipAmount() {
        tipAmount.text = CurrencyFormatter().format(bill.tip())
    }

}
