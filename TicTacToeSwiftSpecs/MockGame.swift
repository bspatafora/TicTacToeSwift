import Foundation

class MockGame: GameProtocol {
    var receivedMove = false
    var receivedSwitchPlayers = false
    var isOverFlag = false
    var wasDrawFlag = false
    
    func setIsOver(flag: Bool) {
        isOverFlag = flag
    }
    
    func setWasDraw(flag: Bool) {
        wasDrawFlag = flag
    }

    func getCurrentPlayer() -> Player {
        return Player(token: "T", type: PlayerType.AI)
    }

    func switchPlayers() {
        receivedSwitchPlayers = true
    }
    
    func move(space: Int) {
        receivedMove = true
    }
    
    func spaces() -> [String] {
        return []
    }
    
    func isOver() -> Bool {
        return isOverFlag
    }
    
    func wasDraw() -> Bool {
        return wasDrawFlag
    }
    
    func winningToken() -> String? {
        return ""
    }
}