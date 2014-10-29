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
    
    func getCurrentPlayer() -> Player {
        return currentPlayer
    }

    func switchPlayers() {
        let lastPlayer = currentPlayer
        currentPlayer = nextPlayer
        nextPlayer = lastPlayer
    }

    func move(space: Int) {
        board.place(token: currentPlayer.token, space: space)
    }

    func spaces() -> [String] {
        return board.getSpaces()
    }
    
    func isOver() -> Bool {
        return VictoryConditions().isGameOver(board: board)
    }
    
    func wasDraw() -> Bool {
        return VictoryConditions().isDraw(board: board)
    }
    
    func winningToken() -> String? {
        return VictoryConditions().winningToken(board: board)
    }
    

}