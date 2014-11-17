import Foundation
import Swiftest

class BoardSpec: SwiftestSuite {
    let spec = describe("Board") {
        it("can be written to and read from") {
            let board = Board()
            board.place(token: .X, space: 0)
            expect(board.space(0)).to(.Equal(Token.X))
        }

        it("initializes its spaces to empty tokens") {
            let board = Board()
            expect(board.space(0)).to(.Equal(Token.Empty))
        }

        it("knows whether a space is empty") {
            let board = Board()
            board.place(token: .X, space: 1)
            expect(board.isSpaceEmpty(0)).to(.Be(true))
            expect(board.isSpaceEmpty(1)).to(.Be(false))
        }

        it("provides its spaces") {
            let board = Board()
            expect(board.getSpaces()).to(.Equal([Token.Empty, Token.Empty, Token.Empty,
                                                 Token.Empty, Token.Empty, Token.Empty,
                                                 Token.Empty, Token.Empty, Token.Empty]))
        }

        it("provides its rows") {
            let board = TestBoard().generate(["X", " ", "X",
                                              " ", " ", " ",
                                              "O", "X", " "])

            expect(board.rows()[0]).to(.Equal([Token.X, Token.Empty, Token.X]))
            expect(board.rows()[1]).to(.Equal([Token.Empty, Token.Empty, Token.Empty]))
            expect(board.rows()[2]).to(.Equal([Token.O, Token.X, Token.Empty]))
        }

        it("provides its columns") {
            let board = TestBoard().generate(["O", " ", "X",
                                              "X", " ", "O",
                                              "O", " ", " "])

            expect(board.columns()[0]).to(.Equal([Token.O, Token.X, Token.O]))
            expect(board.columns()[1]).to(.Equal([Token.Empty, Token.Empty, Token.Empty]))
            expect(board.columns()[2]).to(.Equal([Token.X, Token.O, Token.Empty]))
        }

        it("provides its diagonals") {
            let board = TestBoard().generate([" ", " ", "X",
                                              " ", "X", " ",
                                              "X", " ", " "])

            expect(board.diagonals()[0]).to(.Equal([Token.Empty, Token.X, Token.Empty]))
            expect(board.diagonals()[1]).to(.Equal([Token.X, Token.X, Token.X]))
        }

        it("returns false when it is not full") {
            let board = TestBoard().generate(["X", "X", "O",
                                              "O", " ", "X",
                                              "X", "O", "X"])
            expect(board.isFull()).to(.Equal(false))
        }

        it("returns true when it is full") {
            let board = TestBoard().generate(["X", "X", "O",
                                              "O", "O", "X",
                                              "X", "O", "X"])
            expect(board.isFull()).to(.Equal(true))
        }

        it("returns false when the line is not full") {
            expect(Board().isFullLine([Token.Empty, Token.X, Token.O])).to(.Be(false))
        }

        it("returns true when the line is full") {
            expect(Board().isFullLine([Token.O, Token.X, Token.O])).to(.Be(true))
        }
    }
}