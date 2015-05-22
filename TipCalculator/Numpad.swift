import Foundation

public class Numpad {

    public var value: Float {
        get {
            var string = ""
            for char in chars {
                string = string + char
            }
            if string == "" {
                return 0
            } else {
                return (string as NSString).floatValue
            }
        }
    }
    public var display: String {
        get {
            if value == 0 {
                return ""
            } else if value == Float(Int(value)) {
                return "\(Int(value))"
            } else {
                return "\(value)"
            }
        }
    }
    public var chars: [String]

    public init() {
        chars = []
    }

    public func press(#number: Int) {
        chars.append("\(number)")
    }

    public func pressDot() {
        if !contains(chars, ".") {
            chars.append(".")
        }
    }

    public func clear() {
        chars = []
    }
    
}
