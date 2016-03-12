import Foundation

final class Numpad {

    private var enteredNumbers: String = ""
    private var lastNumber: Int?

    func press(digit digit: Int) {
        guard enteredNumbers.characters.count < 8 else { return }

        lastNumber = digit
        if checkWhetherJoinPressedDigit() {
            enteredNumbers.appendContentsOf("\(lastNumber!)")
        }
    }

    func clear() {
        enteredNumbers.removeAll()
    }

    var display: Float {
        get {
            return value / 100
        }
    }

    private var value: Float {
        get {
            if enteredNumbers.isEmpty {
                return 0
            } else {
                return (enteredNumbers as NSString).floatValue
            }
        }
    }
    
    private func checkWhetherJoinPressedDigit() -> Bool {
        if let lastNumber = lastNumber {
            return (!enteredNumbers.isEmpty || (lastNumber != 0))
        }
        
        return false
    }

}
