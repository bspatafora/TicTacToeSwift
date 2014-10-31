import Foundation
import Swiftest

class GameSpec: SwiftestSuite {
    let spec = describe("Game") {
        it("knows whether the current player is an AI") {
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.AI)
            let game = Game(board: Board(),
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)
            
            expect(game.currentPlayerIsAI()).to(.Be(false))
            game.move(0)
            expect(game.currentPlayerIsAI()).to(.Be(true))
        }

        it("asks its current player to provide a move") {
            let firstPlayer = MockAIPlayer(token: "X", type: PlayerType.AI)
            let secondPlayer = MockAIPlayer(token: "O", type: PlayerType.AI)
            let game = Game(board: Board(),
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            game.currentPlayerMove(receiver: MockMoveReceiver())
            expect(firstPlayer.receivedMoveMessage).to(.Be(true))
        }

        it("places moves for the current player") {
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
            let board = Board()
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            game.move(0)
            expect(board.space(0)).to(.Equal("X"))
            game.move(1)
            expect(board.space(1)).to(.Equal("O"))
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

        it("knows whether a space is open") {
            let board = Board()
            let firstPlayer = Player(token: "X", type: PlayerType.Human)
            let secondPlayer = Player(token: "O", type: PlayerType.Human)
            let game = Game(board: board,
                            firstPlayer: firstPlayer,
                            secondPlayer: secondPlayer)

            game.move(1)
            expect(game.isSpaceOpen(0)).to(.Be(true))
            expect(game.isSpaceOpen(1)).to(.Be(false))
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