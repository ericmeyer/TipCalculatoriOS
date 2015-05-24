import TipCalculator
import Nimble
import Quick

class CurrencyFormatterSpec: QuickSpec {

    func format(amount: Float) -> String {
        return CurrencyFormatter().format(amount)
    }

    override func spec() {
        it("formats dollars only") {
            expect(self.format(123)).to(equal("$123"))
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
