import Foundation

struct CurrencyFormatter {
    static func format(amount amount: Float) -> String {
        
        func currencySymbol() -> String {
            let formatter = NSNumberFormatter()
            let symbol = formatter.currencySymbol
            
            return symbol
        }
        
        let symbol = currencySymbol()
        return String(format: "\(symbol)%.2f", amount)
    }
}
