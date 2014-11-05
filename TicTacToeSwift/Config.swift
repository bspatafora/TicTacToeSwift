import Foundation

struct Config {
    static func minimaxURL() -> String {
        let environment = plistEntries()["Environment"] as String
        if environment.lowercaseString == "local" {
            return "http://localhost:5000/"
        }
        return "http://minimax.herokuapp.com/"
    }

    private static func plistEntries() -> [String: AnyObject] {
        let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")!
        return NSDictionary(contentsOfFile: path)! as [String: AnyObject]
    }
}