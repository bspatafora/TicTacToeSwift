import Foundation

class MockGame: GameProtocol {
    var receivedMove = false
    var isOverFlag = false
    var wasDrawFlag = false
    var currentPlayer: Player = Player(token: "X", type: PlayerType.Human)
    var nextPlayer: Player = MockAIPlayer(token: "O", type: PlayerType.AI)

    func setIsOver(flag: Bool) {
        isOverFlag = flag
    }

    func setWasDraw(flag: Bool) {
        wasDrawFlag = flag
    }

    func getCurrentPlayer() -> Player {
        return currentPlayer
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

    private func switchPlayers() {
        let lastPlayer = currentPlayer
        currentPlayer = nextPlayer
        nextPlayer = lastPlayer
    }
}