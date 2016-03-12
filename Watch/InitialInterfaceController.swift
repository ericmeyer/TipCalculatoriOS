import WatchKit
import Foundation


class InitialInterfaceController: WKInterfaceController {
    private var numpad: Numpad = Numpad()
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        let InterfacePages = ["Enter Bill", "Calculate Total"]
        let pagesContext: [AnyObject]? = [self.numpad, self.numpad]
        
        WKInterfaceController.reloadRootControllersWithNames(InterfacePages, contexts: pagesContext)
    }

}
