import Foundation
import Swiftest

class BoardSpec: SwiftestSuite {
    let spec = describe("Board") {
        it("can be written to and read from") {
            let board = Board()
            board.place(token: "X", space: 0)
            expect(board.space(0)).to(.Equal("X"))
        }

        it("initializes its spaces to literal spaces") {
            let board = Board()
            expect(board.space(0)).to(.Equal(" "))
        }

        it("provides its spaces") {
            let board = Board()
            expect(board.getSpaces()).to(.Equal([" ", " ", " ",
                                                 " ", " ", " ",
                                                 " ", " ", " "]))
        }

        it("provides its full row lines") {
            let board = TestBoard().generate(["X", "O", "X",
                                              " ", " ", " ",
                                              "O", "X", "O"])
            expect(board.fullLines()!).to(.Equal([["X", "O", "X"],
                                                     ["O", "X", "O"]]))
        }

        it("provides its full column lines") {
            let board = TestBoard().generate(["O", " ", "X",
                                              "X", " ", "O",
                                              "O", " ", "X"])
            expect(board.fullLines()!).to(.Equal([["O", "X", "O"],
                                                     ["X", "O", "X"]]))
        }

        it("provides its full diagonal lines") {
            let board = TestBoard().generate([" ", " ", "X",
                                              " ", "X", " ",
                                              "X", " ", " "])
            expect(board.fullLines()!).to(.Equal([["X", "X", "X"]]))
        }

        it("returns an empty array when it has no full lines") {
            let board = TestBoard().generate([" ", "O", " ",
                                              " ", " ", "X",
                                              "X", " ", " "])
            expect(board.fullLines()!).to(.Equal([]))
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