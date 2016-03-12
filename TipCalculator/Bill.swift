import Foundation

struct Bill {
    var subTotal: Float = 0.0
    var tipPercentage: Float = 0.0
    var numberOfPeople: Int = 1
    var total: Float {
        get {
            return self.subTotal + self.tip
        }
    }
    
    var tip: Float {
        get {
            let percentFromSubTotal = (self.subTotal * (self.tipPercentage / 100))
            let preperToRound = percentFromSubTotal * 100
            let numberOfRoundedCents = Int(preperToRound + 0.5)
            let roundedTip =  Float(numberOfRoundedCents) / Float(100)
            
            return roundedTip
        }
    }
    
}
