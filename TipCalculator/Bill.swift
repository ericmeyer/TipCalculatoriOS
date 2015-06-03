import Foundation

public class Bill {

    public var subtotal: Float = 0
    public var tipPercentage: Float = 0
    public var numberOfPeople: Int = 1

    public init() {}

    public func total() -> Float {
        return subtotal + tip()
    }

    public func tip() -> Float {
        return Float(round(unroundedTip()*100) / 100)
    }

    public func totalPerPerson() -> Float {
        return total() / Float(numberOfPeople)
    }

    public func tipPerPerson() -> Float {
        return tip() / Float(numberOfPeople)
    }

    private func unroundedTip() -> Float {
        return subtotal * (tipPercentage / 100)
    }
}
