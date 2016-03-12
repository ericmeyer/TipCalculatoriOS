import WatchKit
import Foundation


class CalculateTotalInterfaceController: WKInterfaceController {
    @IBOutlet weak var subTotalLabel: WKInterfaceLabel!
    @IBOutlet weak var tipLabel: WKInterfaceLabel!
    @IBOutlet weak var totalLabel: WKInterfaceLabel!
    @IBOutlet weak var percentPicker: WKInterfacePicker!
    var bill: Bill = Bill()
    var enteredBillValue: Numpad?
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let context: Numpad = context as? Numpad {
            self.enteredBillValue = context
        }
        
        self.setup()
    }
    
    override func willActivate() {
        super.willActivate()
        
        self.assignBillSubTotal()
        self.renderLabels()
        self.checkWhetherEnablePercentagePicker()
    }
    
    override func willDisappear() {
        super.willDisappear()
        self.clearLabels()
    }
}


// MARK: Setup
private extension CalculateTotalInterfaceController {
    
    func setup() {
        self.clearLabels()
        self.setupPercentagePicker()
    }
}

// MAKR: Setup picker
private extension CalculateTotalInterfaceController {
    
    func setupPercentagePicker() {
        
        func initializePickerItems() {
            let percentageRates = (0...100).map{ $0 }
            
            let pickerItems: [WKPickerItem] = percentageRates.map {
                (percentage) -> WKPickerItem in
                let item = WKPickerItem()
                item.title = "\(percentage)"
                item.caption = "%"
                
                return item
            }
            
            self.percentPicker.setItems(pickerItems)
        }
        
        
        initializePickerItems()
    }
}


// MARK: Create Bill
private extension CalculateTotalInterfaceController {
    
    func assignBillSubTotal() {
        if let displayValue = self.enteredBillValue?.display {
            self.bill.subTotal = displayValue
        }
    }
}


// MARK: Enable Picker
private extension CalculateTotalInterfaceController {
    
    func checkWhetherEnablePercentagePicker() {
        if self.bill.subTotal > 0 {
            let minTipPercentage: Int = 15
            
            self.percentPicker.setEnabled(true)
            self.percentPicker.setSelectedItemIndex(minTipPercentage)
            self.percentPicker.focus()
            
        } else {
            self.percentPicker.setEnabled(false)
            
        }
    }
}


// MARK: Action
private extension CalculateTotalInterfaceController {
    
    @IBAction func pickerSelectedItemChanged(value: Int) {
        self.bill.tipPercentage = Float(value)
        self.renderTotalLabel()
        self.renderTipLabel()
    }
}


// MARK: Render Labels
private extension CalculateTotalInterfaceController {
    
    func renderSubTotalLabel() {
        let formatedSubTotal = CurrencyFormatter.format(amount: self.bill.subTotal)
        self.subTotalLabel.setText(formatedSubTotal)
    }
    
    func renderTipLabel() {
        self.tipLabel.setText(CurrencyFormatter.format(amount: self.bill.tip))
    }
    
    func renderTotalLabel() {
        self.totalLabel.setText(CurrencyFormatter.format(amount: self.bill.total))
    }
    
    func renderLabels() {
        self.renderSubTotalLabel()
        self.renderTotalLabel()
        self.renderTipLabel()
    }
}


// MARK: Clear Labels
private extension CalculateTotalInterfaceController {
    
    func clearLabels() {
        let resetValue = CurrencyFormatter.format(amount: 0)
        
        self.subTotalLabel.setText(resetValue)
        self.tipLabel.setText(resetValue)
        self.totalLabel.setText(resetValue)
    }
}