import Foundation

class MockUIAdapter: UIAdapterProtocol {
    var receivedBoardWasUpdated = false
    var receivedGameEndedInDraw = false
    var receivedGameEndedInWinner = false
    var receivedGetMove = false
    var receivedServiceIsUnavailable = false
    
    init() { } // Erroneous Swift compiler error when not present
    
    func getMove() -> Int {
        receivedGetMove = true
        return -1
    }
    
    func boardWasUpdated(#spaces: [String]) {
        receivedBoardWasUpdated = true
    }

    func boardWasUpdatedAndAIIsThinking(#spaces: [String]) { }
    
    func gameEndedInDraw(#spaces: [String]) {
        receivedGameEndedInDraw = true
    }
    
    func gameEndedInWinner(#spaces: [String], token: String) {
        receivedGameEndedInWinner = true
    }

    func serviceIsUnavailable() {
        receivedServiceIsUnavailable = true
    }
}