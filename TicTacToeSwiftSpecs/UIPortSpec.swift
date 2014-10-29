import Foundation
import Swiftest

class UIPortSpec: SwiftestSuite {
    let spec = describe("UIPort") {
        it("sends its adapter updated spaces when game continues") {
            let board = Board()
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)

            port.makeMove(move: 0)
            expect(adapter.receivedUpdatedSpaces!).to(.Equal(board.getSpaces()))
        }

        it("tells its adapter when the game ended in a draw") {
            let board = TestBoard().generate(["X", "X", "O",
                                              "O", "O", "X",
                                              "X", "O", " "])
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)

            port.makeMove(move: 8)
            expect(adapter.drawMessageReceived).to(.Be(true))
            expect(adapter.receivedUpdatedSpaces!).to(.Equal(board.getSpaces()))
        }

        it("tells its adapter the winning token") {
            let board = TestBoard().generate(["X", "X", " ",
                                              " ", " ", " ",
                                              " ", " ", " "])
            let game = Game(board: board,
                            firstToken: "X",
                            secondToken: "O")
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            
            port.makeMove(move: 2)
            expect(adapter.receivedWinningToken).to(.Equal("X"))
            expect(adapter.receivedUpdatedSpaces!).to(.Equal(board.getSpaces()))
        }
    }
}