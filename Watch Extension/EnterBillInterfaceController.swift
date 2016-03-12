import WatchKit
import Foundation


class EnterBillInterfaceController: WKInterfaceController {
    var numpad: Numpad!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let context: Numpad = context as? Numpad {
            self.numpad = context
        }
    }

    override func willActivate() {
        super.willActivate()        
        self.clearDisplay()
    }
    
}


// MARK: Action
private extension EnterBillInterfaceController {
    
    @IBAction func pressDoubleZero() {
        self.pressDigit(0)
        self.pressDigit(0)
    }
    
    @IBAction func pressZero() {
        self.pressDigit(0)
    }
    
    @IBAction func pressOne() {
        self.pressDigit(1)
    }
    
    @IBAction func pressTwo() {
        self.pressDigit(2)
    }
    
    @IBAction func pressThree() {
        self.pressDigit(3)
    }
    
    @IBAction func pressFour() {
        self.pressDigit(4)
    }
    
    @IBAction func pressFive() {
        self.pressDigit(5)
    }
    
    @IBAction func pressSix() {
        self.pressDigit(6)
    }
    
    @IBAction func pressSeven() {
        self.pressDigit(7)
    }
    
    @IBAction func pressEight() {
        self.pressDigit(8)
    }
    
    @IBAction func pressNine() {
        self.pressDigit(9)
    }
    
    @IBAction func clearDisplay() {
        self.numpad.clear()
        self.renderNumpadLabel()
        print("clearDisplayWithEnteredBill")
    }
    
    
    @IBAction func onMenuItemClearTouch() {
        self.clearDisplay()
        print("onMenuItemClearTouch")
    }
}

// MARK: Press digit
private extension EnterBillInterfaceController {
    
    private func pressDigit(digit: Int) {
        self.numpad.press(digit: digit)
        self.renderNumpadLabel()

    }
}

// MARK: Render display
private extension EnterBillInterfaceController {
    
    func renderNumpadLabel() {
        let billWithCurrency = CurrencyFormatter.format(amount: numpad.display)

        self.setTitle(billWithCurrency)
    }
}
