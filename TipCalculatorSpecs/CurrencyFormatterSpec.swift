import TipCalculator
import Nimble
import Quick

class CurrencyFormatterSpec: QuickSpec {

    func format(amount: Float) -> String {
        return CurrencyFormatter().format(amount)
    }

    override func spec() {
        it("formats 0") {
            expect(self.format(0)).to(equal("$0.00"))
        }

        it("includes the leading 0 for an amount less than a dollar") {
            expect(self.format(0.12)).to(equal("$0.12"))
        }

        it("includes cents for a whole dollar") {
            expect(self.format(123)).to(equal("$123.00"))
        }

        it("formats simple dollars and cents") {
            expect(self.format(123.45)).to(equal("$123.45"))
        }

        it("shows two decimal places") {
            expect(self.format(123.5)).to(equal("$123.50"))
        }

        it("shows a leading zero for amounts less than a dollar") {
            expect(self.format(0.45)).to(equal("$0.45"))
        }

        it("rounds a value up") {
            expect(self.format(0.44999)).to(equal("$0.45"))
        }

        it("rounds a value down") {
            expect(self.format(0.4449)).to(equal("$0.44"))
        }
    }
    
}
