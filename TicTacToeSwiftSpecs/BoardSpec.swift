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

        it("provides its full row lines") {
            let board = TestBoard().generate(["X", "O", "X",
                                              " ", " ", " ",
                                              "O", "X", "O"])
            let fullLines = board.fullLines()!
            let firstRowLine = fullLines[0]
            let secondRowLine = fullLines[1]

            expect(fullLines.count).to(.Equal(2))
            expect(firstRowLine).to(.Equal([Token.X, Token.O, Token.X]))
            expect(secondRowLine).to(.Equal([Token.O, Token.X, Token.O]))
        }

        it("provides its full column lines") {
            let board = TestBoard().generate(["O", " ", "X",
                                              "X", " ", "O",
                                              "O", " ", "X"])
            let fullLines = board.fullLines()!
            let firstRowLine = fullLines[0]
            let secondRowLine = fullLines[1]
            
            expect(fullLines.count).to(.Equal(2))
            expect(firstRowLine).to(.Equal([Token.O, Token.X, Token.O]))
            expect(secondRowLine).to(.Equal([Token.X, Token.O, Token.X]))
        }

        it("provides its full diagonal lines") {
            let board = TestBoard().generate([" ", " ", "X",
                                              " ", "X", " ",
                                              "X", " ", " "])
            let fullLines = board.fullLines()!

            expect(fullLines.count).to(.Equal(1))
            expect(fullLines[0]).to(.Equal([Token.X, Token.X, Token.X]))
        }

        it("returns an empty array when it has no full lines") {
            let board = TestBoard().generate([" ", "O", " ",
                                              " ", " ", "X",
                                              "X", " ", " "])
            expect(board.fullLines()!.count).to(.Equal(0))
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
    }
}