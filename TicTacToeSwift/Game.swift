import Foundation

class Game {
    private var board: Board
    private var currentToken: String
    private var nextToken: String

    init(board: Board, firstToken: String, secondToken: String) {
        self.board = board
        self.currentToken = firstToken
        self.nextToken = secondToken
    }

    func getCurrentToken() -> String {
        return currentToken
    }

    func switchTokens() {
        let lastToken = currentToken
        currentToken = nextToken
        nextToken = lastToken
    }
    
    func move(space: Int) {
        board.place(token: currentToken, space: space)
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