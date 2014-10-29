import Foundation
import Swiftest

class MinimaxPlayerSpec: SwiftestSuite {
    let spec = describe("MinimaxPlayer") {
        it("Gets the minimax AI move for the passed spaces") {
            let spaces = ["O", " ", " ",
                          "X", "X", "O",
                          "X", " ", " "]
            let player = MinimaxPlayer(token: "O", type: PlayerType.AI)
            
            expect(player.move(spaces: spaces)).to(.Equal(2))
        }
    }
}