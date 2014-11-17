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
    
    func boardWasUpdated(#spaces: [Token]) {
        receivedBoardWasUpdated = true
    }

    func aiIsThinking(#spaces: [Token]) { }
    
    func gameEndedInDraw(#spaces: [Token]) {
        receivedGameEndedInDraw = true
    }
    
    func gameEndedInWinner(#spaces: [Token], token: Token) {
        receivedGameEndedInWinner = true
    }

    func serviceIsUnavailable() {
        receivedServiceIsUnavailable = true
    }
}