import Quick
import Nimble
import TipCalculatoriOS

class ViewControllerSpec: QuickSpec {
    override func spec() {

        it("exists") {
            let controller = ViewController()
            expect(controller).notTo(beNil())
        }
    }
}
