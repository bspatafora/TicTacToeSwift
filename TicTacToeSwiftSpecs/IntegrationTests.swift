import Foundation
import Swiftest

class IntegrationTests: SwiftestSuite {
  let spec = describe("A game between two users") {
    it("ends with a winner") {
        let game = Game(board: Board(), firstToken: "X", secondToken: "O")
        let adapter = MockUIAdapter()
        let port = UIPort(game: game, adapter: adapter)

        port.moveWasMade(move: 0)
        port.moveWasMade(move: 8)
        port.moveWasMade(move: 1)
        port.moveWasMade(move: 7)
        port.moveWasMade(move: 2)
        expect(adapter.receivedGameEndedInWinner).to(.Be(true))
    }

    it("ends with a draw") {
        let game = Game(board: Board(), firstToken: "X", secondToken: "O")
        let adapter = MockUIAdapter()
        let port = UIPort(game: game, adapter: adapter)
        
        port.moveWasMade(move: 0)
        port.moveWasMade(move: 4)
        port.moveWasMade(move: 1)
        port.moveWasMade(move: 2)
        port.moveWasMade(move: 6)
        port.moveWasMade(move: 3)
        port.moveWasMade(move: 7)
        port.moveWasMade(move: 8)
        port.moveWasMade(move: 5)
        expect(adapter.drawMessageReceived).to(.Be(true))
    }
  }
}
