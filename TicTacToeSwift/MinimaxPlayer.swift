import Foundation

class MinimaxPlayer: Player {
    var receiver: MoveReceiver?

    override func move(#spaces: [Token], receiver: MoveReceiver) {
        self.receiver = receiver
        responseData(buildRequest(spaces))
    }

    private func responseData(request: NSMutableURLRequest) {
        var response: NSURLResponse?
        var data: NSData?
        var error: NSError?
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response, data, error) in self.sendMove(data)})
    }

    private func sendMove(responseData: NSData?) {
        let receiver = self.receiver!
        if let response = responseData {
            receiver.makeMove(move: parseMove(response))
        } else {
            receiver.makeMove(move: nil)
        }
    }

    private func buildRequest(spaces: [Token]) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: NSURL(string: Config.minimaxURL())!)
        request.HTTPMethod = "POST"
        request.HTTPBody = serialize(spaces)
        return request
    }

    private func serialize(spaces: [Token]) -> NSData {
        let stringSpaces = spaces.map { $0.rawValue }
        var error: NSError?
        return NSJSONSerialization.dataWithJSONObject(stringSpaces, options: nil, error: &error)!
    }

    private func parseMove(responseData: NSData) -> Int {
        return NSString(data: responseData, encoding: NSUTF8StringEncoding)!.integerValue
    }
}