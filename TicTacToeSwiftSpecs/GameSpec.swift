import Foundation
import Swiftest

class GameSpec: SwiftestSuite {
    let spec = describe("Game") {
        it("knows the current token") {
            let game = Game(board: Board(),
                            firstToken: "X",
                            secondToken: "O")
            expect(game.getCurrentToken()).to(.Equal("X"))
        }

        it("updates the current token") {
            let game = Game(board: Board(),
                firstToken: "X",
                secondToken: "O")
            game.switchTokens()
            expect(game.getCurrentToken()).to(.Equal("O"))
            game.switchTokens()
            expect(game.getCurrentToken()).to(.Equal("X"))
        }

        it("makes moves for the current token") {
            let board = Board()
            let game = Game(board: board,
                firstToken: "X",
                secondToken: "O")
            game.move(4)
            expect(board.space(4)).to(.Equal("X"))
        }
    }
}