import TipCalculator
import Quick
import Nimble

class BillSpec: QuickSpec {

    override func spec() {

        describe("The bill total") {
            it("starts at zero") {
                let bill = Bill()
                expect(bill.total()).to(equal(0))
            }

            it("includes the subtotal") {
                let bill = Bill()
                bill.subtotal = 15
                expect(bill.total()).to(equal(15))
            }

            it("includes the tip in the total") {
                let bill = Bill()
                bill.subtotal = 100
                bill.tipPercentage = 15
                expect(bill.total()).to(equal(115))
            }

            it("splits the bill") {
                let bill = Bill()
                bill.subtotal = 100
                bill.tipPercentage = 20
                bill.numberOfPeople = 3
                expect(bill.total()).to(beCloseTo(120, within: 0.001))
                expect(bill.totalPerPerson()).to(beCloseTo(40.0, within: 0.001))
            }
        }

    }
}
