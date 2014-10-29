import Foundation

class MockUIAdapter: UIAdapterProtocol {
    var receivedUpdatedSpaces: [String]?
    var drawMessageReceived = false
    var receivedWinningToken: String?
    var receivedGameEndedInWinner = false

    init() { } // Required to prevent erroneous compiler error
    
    func boardWasUpdated(#spaces: [String]) {
        receivedUpdatedSpaces = spaces
    }
    
    func gameEndedInDraw(#spaces: [String]) {
        drawMessageReceived = true
        receivedUpdatedSpaces = spaces
    }
    
    func gameEndedInWinner(#spaces: [String], token: String) {
        receivedWinningToken = token
        receivedUpdatedSpaces = spaces
        receivedGameEndedInWinner = true
    }
}