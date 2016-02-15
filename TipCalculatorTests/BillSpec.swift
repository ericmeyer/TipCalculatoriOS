import TipCalculatoriOS
import Quick
import Nimble

class BillSpec: QuickSpec {

    override func setUp() {
        continueAfterFailure = false
    }

    override func spec() {

        var bill: Bill!

        beforeEach() {
            bill = Bill()
        }

        describe("The bill total") {
            it("starts at zero") {
                expect(bill.total()).to(equal(0))
            }

            it("includes the subtotal") {
                bill.subtotal = 15
                expect(bill.total()).to(equal(15))
            }

            it("includes the tip in the total") {
                bill.subtotal = 100
                bill.tipPercentage = 15
                expect(bill.total()).to(equal(115))
            }

            it("splits the bill") {
                bill.subtotal = 100
                bill.tipPercentage = 20
                bill.numberOfPeople = 3
                expect(bill.total()).to(beCloseTo(120, within: 0.001))
                expect(bill.totalPerPerson()).to(beCloseTo(40.0, within: 0.001))
            }
        }

        describe("The tip amount") {
            it("is calculated for a whole number") {
                bill.subtotal = 100
                bill.tipPercentage = 15
                expect(bill.tip()).to(beCloseTo(15, within: 0.001))
            }

            it("calculated the tip per person") {
                bill.subtotal = 50
                bill.tipPercentage = 10
                bill.numberOfPeople = 2
                expect(bill.tipPerPerson()).to(beCloseTo(2.5, within: 0.001))
            }
        }

        describe("The rounding strategy") {
            it("rounds the tip up") {
                bill.subtotal = 85.50
                bill.tipPercentage = 15
                expect(bill.tip()).to(beCloseTo(12.83, within: 0.001))
                expect(bill.total()).to(beCloseTo(98.33, within: 0.001))
            }

            it("rounds the tip down") {
                bill.subtotal = 77.23
                bill.tipPercentage = 15
                expect(bill.tip()).to(beCloseTo(11.58, within: 0.001))
                expect(bill.total()).to(beCloseTo(88.81, within: 0.001))
            }
        }
    }
}
