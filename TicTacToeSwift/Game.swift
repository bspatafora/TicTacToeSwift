import Foundation

class Game: GameProtocol {
    private var board: Board
    private var currentPlayer: Player
    private var nextPlayer: Player
    
    init(board: Board, firstPlayer: Player, secondPlayer: Player) {
        self.board = board
        self.currentPlayer = firstPlayer
        self.nextPlayer = secondPlayer
    }

    func currentPlayerIsAI() -> Bool {
        return currentPlayer.type == PlayerType.AI
    }

    func currentPlayerMove(#receiver: MoveReceiver) {
        currentPlayer.move(spaces: spaces(), receiver: receiver)
    }

    func move(space: Int) {
        board.place(token: currentPlayer.token, space: space)
        switchPlayers()
    }

    func spaces() -> [Token] {
        return board.getSpaces()
    }

    func isSpaceOpen(space: Int) -> Bool {
        return board.isSpaceEmpty(space)
    }
    
    func isOver() -> Bool {
        return VictoryConditions().isGameOver(board: board)
    }
    
    func wasDraw() -> Bool {
        return VictoryConditions().isDraw(board: board)
    }
    
    func winningToken() -> Token? {
        return VictoryConditions().winningToken(board: board)
    }
    
    private func switchPlayers() {
        let lastPlayer = currentPlayer
        currentPlayer = nextPlayer
        nextPlayer = lastPlayer
    }
}