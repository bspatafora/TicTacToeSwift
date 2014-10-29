import Foundation
import Swiftest

class PlayerSpec: SwiftestSuite {
    let spec = describe("player") {
        it("provides its token") {
            let player = Player(token: "X", type: PlayerType.Human)
            expect(player.token).to(.Equal("X"))
        }

        it("provides its type") {
            let player = Player(token: "X", type: PlayerType.Human)
            expect(player.type).to(.Equal(PlayerType.Human))
        }
    }
}