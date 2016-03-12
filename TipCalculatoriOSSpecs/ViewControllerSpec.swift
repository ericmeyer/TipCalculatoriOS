import Quick
import Nimble
import TipCalculatoriOS

class ViewControllerSpec: QuickSpec {
    override func spec() {

        var controller: ViewController!
        var tipAmount: UILabel!
        var tipPercent: UISlider!

        beforeEach({
            controller = ViewController()
            tipAmount = UILabel()
            controller.tipAmount = tipAmount

            tipPercent = UISlider()
            tipPercent.maximumValue = 30.0
            controller.tipPercent = tipPercent
        })

        describe("Loading the view") {
            it("starts with an initial tip amount of $0") {
                controller.viewDidLoad()

                expect(tipAmount.text).to(equal("$0.00"))
            }

            it("starts with a tip percent of 15%") {
                controller.viewDidLoad()

                expect(tipPercent.value).to(equal(15.0))
            }
        }

        describe("Updating the subtotal") {
            var subtotalInput: UITextField!

            beforeEach({
                subtotalInput = UITextField()
            })

            it("calculates a new tip for $100") {
                controller.viewDidLoad()
                subtotalInput.text = "100.0"

                controller.subtotalChanged(subtotalInput)

                expect(tipAmount.text).to(equal("$15.00"))
            }

            it("calculates a new tip for $200") {
                controller.viewDidLoad()
                subtotalInput.text = "200.0"

                controller.subtotalChanged(subtotalInput)

                expect(tipAmount.text).to(equal("$30.00"))
            }
        }

        describe("Updating the tip percent") {
            var subtotalInput: UITextField!

            beforeEach({
                subtotalInput = UITextField()
            })

            it("recalculates the tip for a big tipper") {
                controller.viewDidLoad()
                subtotalInput.text = "100.0"
                controller.subtotalChanged(subtotalInput)

                controller.tipPercentChanged(20.0)

                expect(tipAmount.text).to(equal("$20.00"))
            }

            it("recalculates the tip for a poor service") {
                controller.viewDidLoad()
                subtotalInput.text = "100.0"
                controller.subtotalChanged(subtotalInput)

                controller.tipPercentChanged(5.0)

                expect(tipAmount.text).to(equal("$5.00"))
            }

            it("recalculates the tip for a different subtotal") {
                controller.viewDidLoad()
                subtotalInput.text = "200.0"
                controller.subtotalChanged(subtotalInput)

                controller.tipPercentChanged(10.0)

                expect(tipAmount.text).to(equal("$20.00"))
            }
        }

    }
}
