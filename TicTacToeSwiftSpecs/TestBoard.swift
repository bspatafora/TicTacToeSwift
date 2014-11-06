import Foundation

class TestBoard {
    func generate(spaces: [String]) -> Board {
        let board = Board()
        for (space, tokenString) in enumerate(spaces) {
            board.place(token: token(tokenString), space: space)
        }
        return board
    }

    private func token(tokenString: String) -> Token {
        switch tokenString {
        case "X":
            return Token.X
        case "O":
            return Token.O
        default:
            return Token.Empty
        }
    }
}