import Foundation
import Swiftest

class UIPortSpec: SwiftestSuite {
    let spec = describe("UIPort") {
        it("tells its adapter the board was updated when game continues") {
            let game = MockGame()
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            
            port.makeMove(move: 0)
            expect(adapter.receivedBoardWasUpdated).to(.Be(true))
        }

        it("tells its adapter when the game ended in a draw") {
            let game = MockGame()
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            game.setIsOver(true)
            game.setWasDraw(true)
            
            port.makeMove(move: 0)
            expect(adapter.receivedGameEndedInDraw).to(.Be(true))
        }

        it("tells its adapter when there is a winner") {
            let game = MockGame()
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            game.setIsOver(true)
            game.setWasDraw(false)
            
            port.makeMove(move: 0)
            expect(adapter.receivedGameEndedInWinner).to(.Be(true))
        }

        it("asks its game for the current player’s move when it’s an AI") {
            let game = MockGame()
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            game.setCurrentPlayerIsAI(true)

            port.makeMove(move: 0)
            expect(game.receivedCurrentPlayerMove).to(.Be(true))
        }

        it("tells its adapter when the AI service is unavailable") {
            let game = MockGame()
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            
            port.serviceIsUnavailable()
            expect(adapter.receivedServiceIsUnavailable).to(.Be(true))
        }
    }
}