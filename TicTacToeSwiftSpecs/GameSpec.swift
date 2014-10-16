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

        it("returns its board’s spaces") {
            let board = Board()
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            expect(game.spaces()).to(.Equal(board.getSpaces()))
        }

        it("returns false if there is no winning token and no draw") {
            let game = Game(board: Board(),
                            firstToken: "X",
                            secondToken: "O")
            expect(game.isOver()).to(.Equal(false))
            expect(game.wasDraw()).to(.Equal(false))
        }
        
        it("returns true if there is a winning token") {
            let board = TestBoard().generate(["X", " ", " ",
                                              " ", "X", " ",
                                              " ", " ", "X"])
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            expect(game.isOver()).to(.Equal(true))
        }
        
        it("returns true if there is a draw") {
            let board = TestBoard().generate(["X", "X", "O",
                                              "O", "O", "X",
                                              "X", "O", "X"])
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            expect(game.isOver()).to(.Equal(true))
            expect(game.wasDraw()).to(.Equal(true))
        }

        it("returns nil if there is no winning token") {
            let board = TestBoard().generate(["X", " ", "X",
                                              "O", "O", " ",
                                              " ", " ", "X"])
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            expect(game.winningToken()).to(.Equal(nil))
        }

        it("returns the token with a row win") {
            let board = TestBoard().generate(["X", "X", "X",
                                              " ", " ", " ",
                                              " ", " ", " "])
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            expect(game.winningToken()).to(.Equal("X"))
        }

        it("returns the token with a column win") {
            let board = TestBoard().generate(["X", "O", "X",
                                              " ", "O", " ",
                                              " ", "O", " "])
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            expect(game.winningToken()).to(.Equal("O"))
        }

        it("returns the token with a diagonal win") {
            let board = TestBoard().generate(["X", "O", " ",
                                              " ", "X", " ",
                                              " ", "O", "X"])
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            expect(game.winningToken()).to(.Equal("X"))
        }
    }
}