import TipCalculator
import Quick
import Nimble

class NumpadSpec: QuickSpec {

    override func spec() {
        var numpad: Numpad!

        beforeEach() {
            numpad = Numpad()
        }

        it("starts at 0") {
            expect(numpad.value).to(equal(0))
            expect(numpad.display).to(equal(""))
        }

        it("enters one number") {
            numpad.press(number: 5)
            expect(numpad.value).to(equal(5))
            expect(numpad.display).to(equal("5"))
        }

        it("enters multiple numbers") {
            numpad.press(number: 4)
            numpad.press(number: 8)
            expect(numpad.value).to(equal(48))
            expect(numpad.display).to(equal("48"))
        }

        it("clears the numpad") {
            numpad.press(number: 4)
            numpad.press(number: 8)

            numpad.clear()

            expect(numpad.value).to(equal(0))
            expect(numpad.display).to(equal(""))
        }

        it("has a decimal point") {
            numpad.press(number: 4)
            numpad.pressDot()
            numpad.press(number: 8)

            expect(numpad.value).to(equal(4.8))
        }

        it("cannot have multiple decimals") {
            numpad.press(number: 4)
            numpad.pressDot()
            numpad.press(number: 8)
            numpad.pressDot()
            numpad.press(number: 5)

            expect(numpad.value).to(equal(4.85))
            expect(numpad.display).to(equal("4.85"))
        }
    }

}
