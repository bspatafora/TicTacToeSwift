import Foundation

class TestBoard {
    func generate(spaces: [String]) -> Board {
        let board = Board()
        for (space, token) in enumerate(spaces) {
            board.place(token: token, space: space)
        }
        return board
    }
}