public class CurrencyFormatter {

    public init() {}

    public func format(amount: Float) -> String {
        Int(amount)
        if isWholeNumber(amount) {
            return "$\(Int(amount))"
        } else {
            return String(format: "$%.2f", amount)
        }
    }

    private func isWholeNumber(amount: Float) -> Bool {
        return amount % 1 == 0
    }

}
