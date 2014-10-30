import Foundation
import Swiftest

class IntegrationTests: SwiftestSuite {
    let spec = describe("IntegrationTests") {
        it("ends with a winner in a game between two users") {
            let game = Game(board: Board(),
                            firstPlayer: Player(token: "X", type: PlayerType.Human),
                            secondPlayer: Player(token: "O", type: PlayerType.Human))
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            
            port.makeMove(move: 0)
            port.makeMove(move: 8)
            port.makeMove(move: 1)
            port.makeMove(move: 7)
            port.makeMove(move: 2)
            expect(adapter.receivedGameEndedInWinner).to(.Be(true))
        }
        
        it("ends with a draw in a game between two users") {
            let game = Game(board: Board(),
                            firstPlayer: Player(token: "X", type: PlayerType.Human),
                            secondPlayer: Player(token: "O", type: PlayerType.Human))
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            
            port.makeMove(move: 0)
            port.makeMove(move: 4)
            port.makeMove(move: 1)
            port.makeMove(move: 2)
            port.makeMove(move: 6)
            port.makeMove(move: 3)
            port.makeMove(move: 7)
            port.makeMove(move: 8)
            port.makeMove(move: 5)
            expect(adapter.receivedGameEndedInDraw).to(.Be(true))
        }

        it("ends with the AI winning in a game between two a user and an AI") {
            let game = Game(board: Board(),
                            firstPlayer: Player(token: "X", type: PlayerType.Human),
                            secondPlayer: MockAIPlayer(token: "O", type: PlayerType.AI))
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            
            port.makeMove(move: 8)
            port.makeMove(move: 7)
            port.makeMove(move: 4)
            expect(adapter.receivedGameEndedInWinner).to(.Be(true))
        }
    }
}
