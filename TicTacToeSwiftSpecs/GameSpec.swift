import Foundation
import Swiftest

class GameSpec: SwiftestSuite {
    let spec = describe("Game") {
        it("knows the current player") {
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: Board(),
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)
            
            expect(game.getCurrentPlayer() == firstPlayer).to(.Be(true))
        }

        it("makes moves for the current player") {
            let board = Board()
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            game.move(4)
            expect(board.space(4)).to(.Equal("X"))
        }

        it("updates the current player") {
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: Board(),
                firstPlayer: firstPlayer,
                secondPlayer: secondPlayer)
            
            expect(game.getCurrentPlayer() == firstPlayer).to(.Be(true))
            game.move(0)
            expect(game.getCurrentPlayer() == firstPlayer).to(.Be(false))
        }

        it("returns its board’s spaces") {
            let board = Board()
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            expect(game.spaces()).to(.Equal(board.getSpaces()))
        }

        it("returns false if there is no winning token and no draw") {
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: Board(),
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            expect(game.isOver()).to(.Equal(false))
            expect(game.wasDraw()).to(.Equal(false))
        }
        
        it("returns true if there is a winning token") {
            let board = TestBoard().generate(["X", " ", " ",
                                              " ", "X", " ",
                                              " ", " ", "X"])
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            expect(game.isOver()).to(.Equal(true))
        }
        
        it("returns true if there is a draw") {
            let board = TestBoard().generate(["X", "X", "O",
                                              "O", "O", "X",
                                              "X", "O", "X"])
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            expect(game.isOver()).to(.Equal(true))
            expect(game.wasDraw()).to(.Equal(true))
        }

        it("returns nil if there is no winning token") {
            let board = TestBoard().generate(["X", " ", "X",
                                              "O", "O", " ",
                                              " ", " ", "X"])
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            expect(game.winningToken()).to(.Equal(nil))
        }

        it("returns the token with a row win") {
            let board = TestBoard().generate(["X", "X", "X",
                                              " ", " ", " ",
                                              " ", " ", " "])
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            expect(game.winningToken()).to(.Equal("X"))
        }

        it("returns the token with a column win") {
            let board = TestBoard().generate(["X", "O", "X",
                                              " ", "O", " ",
                                              " ", "O", " "])
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            expect(game.winningToken()).to(.Equal("O"))
        }

        it("returns the token with a diagonal win") {
            let board = TestBoard().generate(["X", "O", " ",
                                              " ", "X", " ",
                                              " ", "O", "X"])
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            expect(game.winningToken()).to(.Equal("X"))
        }
    }
}