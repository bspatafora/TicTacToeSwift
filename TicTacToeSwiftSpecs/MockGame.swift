import Foundation

class MockGame: GameProtocol {
    var receivedMove = false
    var isOverFlag = false
    var wasDrawFlag = false
    var receivedGetCurrentPlayerMove = false
    var currentPlayerIsAIFlag = false
    var currentPlayerMove: Int? = 4

    func setIsOver(flag: Bool) {
        isOverFlag = flag
    }

    func setWasDraw(flag: Bool) {
        wasDrawFlag = flag
    }

    func setCurrentPlayerIsAI(flag: Bool) {
        currentPlayerIsAIFlag = flag
    }

    func setCurrentPlayerMove(move: Int?) {
        currentPlayerMove = move
    }

    func currentPlayerIsAI() -> Bool {
        return currentPlayerIsAIFlag
    }

    func getCurrentPlayerMove() -> Int? {
        receivedGetCurrentPlayerMove = true
        currentPlayerIsAIFlag = false
        return currentPlayerMove
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