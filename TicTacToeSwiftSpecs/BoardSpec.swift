import Foundation
import Swiftest

class BoardSpec: SwiftestSuite {
    let spec = describe("Board") {
        it("can be written to and read from") {
            let board = Board()
            board.place(token: "X", space: 0)
            expect(board.space(0)).to(.Equal("X"))
        }
        
        it("initializes its spaces to empty strings") {
            let board = Board()
            expect(board.space(0)).to(.Equal(""))
        }
        
        it("initializes with 9 spaces by default") {
            let board = Board()
            expect(board.getSpaces().count).to(.Equal(9))
        }
    }
}