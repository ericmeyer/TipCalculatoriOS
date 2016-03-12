import TipCalculator
import Quick
import Nimble

class NumpadSpec: QuickSpec {

    override func spec() {
        var numpad: Numpad!

        beforeEach() {
            numpad = Numpad()
        }

        it("starts displaying nothing") {
            expect(numpad.display).to(equal(0))
        }

        it("enters one number") {
            numpad.press(digit: 5)
            expect(numpad.display).to(equal(0.05))
        }

        it("enters multiple numbers") {
            numpad.press(digit: 4)
            numpad.press(digit: 8)
            expect(numpad.display).to(equal(0.48))
        }

        it("clears the numpad") {
            numpad.press(digit: 4)
            numpad.press(digit: 8)

            numpad.clear()

            expect(numpad.display).to(equal(0))
        }

        it("keeps the decimal point at two places") {
            numpad.press(digit: 4)
            numpad.press(digit: 8)
            numpad.press(digit: 5)

            expect(numpad.display).to(equal(4.85))
        }

        it("ignores leading zeros") {
            numpad.press(digit: 0)
            numpad.press(digit: 0)

            expect(numpad.display).to(equal(0))
        }
    }
    
}
