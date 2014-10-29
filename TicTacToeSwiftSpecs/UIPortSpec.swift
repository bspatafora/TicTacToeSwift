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
        
        it("switches the players") {
            let game = MockGame()
            let adapter = MockUIAdapter()
            let port = UIPort(game: game, adapter: adapter)
            
            port.makeMove(move: 0)
            expect(game.receivedSwitchPlayers).to(.Be(true))
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
    }
}