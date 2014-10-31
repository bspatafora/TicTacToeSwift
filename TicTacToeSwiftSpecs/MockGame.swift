import Foundation

class MockGame: GameProtocol {
    var receivedMove = false
    var isOverFlag = false
    var wasDrawFlag = false
    var currentPlayerIsAIFlag = false
    var receivedCurrentPlayerMove = false

    init() { }

    func setIsOver(flag: Bool) {
        isOverFlag = flag
    }

    func setWasDraw(flag: Bool) {
        wasDrawFlag = flag
    }

    func setCurrentPlayerIsAI(flag: Bool) {
        currentPlayerIsAIFlag = flag
    }

    func currentPlayerIsAI() -> Bool {
        return currentPlayerIsAIFlag
    }

    func currentPlayerMove(#receiver: MoveReceiver) {
        receivedCurrentPlayerMove = true
    }

    func move(space: Int) {
        receivedMove = true
    }

    func spaces() -> [String] {
        return []
    }

    func isSpaceOpen(spaces: Int) -> Bool {
        return false
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