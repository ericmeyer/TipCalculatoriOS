public class Bill {

    public var subtotal: Float = 0
    public var tipPercentage: Float = 0
    public var numberOfPeople: Int = 1

    public init() {}

    public func total() -> Float {
        return subtotal * (1 + (tipPercentage / 100))
    }

    public func totalPerPerson() -> Float {
        return total() / Float(numberOfPeople)
    }

}
