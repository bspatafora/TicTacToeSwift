import Foundation
import Swiftest

class VictoryConditionsSpec: SwiftestSuite {
    let spec = describe("VictoryConditions") {
        it("returns false if there is no winning token and no draw") {
            let board = Board()
            expect(VictoryConditions().isGameOver(board: board)).to(.Equal(false))
            expect(VictoryConditions().isDraw(board: board)).to(.Equal(false))
        }

        it("returns true if there is a winning token") {
            let board = TestBoard().generate(["X", " ", " ",
                                              " ", "X", " ",
                                              " ", " ", "X"])
            expect(VictoryConditions().isGameOver(board: board)).to(.Equal(true))
        }

        it("returns true if there is a draw") {
            let board = TestBoard().generate(["X", "X", "O",
                                              "O", "O", "X",
                                              "X", "O", "X"])
            expect(VictoryConditions().isGameOver(board: board)).to(.Equal(true))
            expect(VictoryConditions().isDraw(board: board)).to(.Equal(true))
        }

        it("returns nil if there is no winning token") {
            let board = TestBoard().generate(["X", " ", "X",
                                              "O", "O", " ",
                                              " ", " ", "X"])
            expect(VictoryConditions().winningToken(board: board)).to(.Equal(nil))
        }

        it("returns the token with a row win") {
            let board = TestBoard().generate(["X", "X", "X",
                                              " ", " ", " ",
                                              " ", " ", " "])
            expect(VictoryConditions().winningToken(board: board)).to(.Equal("X"))
        }

        it("returns the token with a column win") {
            let board = TestBoard().generate(["X", "O", "X",
                                              " ", "O", " ",
                                              " ", "O", " "])
            expect(VictoryConditions().winningToken(board: board)).to(.Equal("O"))
        }

        it("returns the token with a diagonal win") {
            let board = TestBoard().generate(["X", "O", " ",
                                              " ", "X", " ",
                                              " ", "O", "X"])
            expect(VictoryConditions().winningToken(board: board)).to(.Equal("X"))
        }
    }
}