import Quick
import Nimble
import TipCalculator

class FooSpec: QuickSpec {
    override func spec() {

        describe("Foo") {
            it("exists") {
                let foo = Foo()
                expect(foo.bar()).to(equal(123))
            }
        }
    }
}
