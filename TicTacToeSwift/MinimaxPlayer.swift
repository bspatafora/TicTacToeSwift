import Foundation

class MinimaxPlayer: Player {
    override func move(#spaces: [String]) -> Int {
        let request = buildRequest(spaces)
        let response = responseData(request)
        return parseMove(response)
    }
    
    private func buildRequest(spaces: [String]) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:9000/"))
        var serializationError: NSError?
        let boardData = NSJSONSerialization.dataWithJSONObject(spaces, options: nil, error: &serializationError)
        request.HTTPMethod = "POST"
        request.HTTPBody = boardData
        return request
    }
    
    private func responseData(request: NSMutableURLRequest) -> NSData {
        var response: NSURLResponse?
        var connectionError: NSErrorPointer = nil
        return NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: connectionError)!
    }
    
    private func parseMove(responseData: NSData) -> Int {
        let responseDataString = NSString(data: responseData, encoding: NSUTF8StringEncoding)
        return responseDataString.integerValue
    }
}