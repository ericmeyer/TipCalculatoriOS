public class CurrencyFormatter {

    public init() {}

    public func format(amount: Float) -> String {
        return String(format: "$%.2f", amount)
    }

}
