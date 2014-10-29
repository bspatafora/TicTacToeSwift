import Foundation

class MockAIPlayer: Player {
    var moves = [0, 1, 2]

    override func move(spaces: [String]) -> Int {
        let move = moves[0]
        moves.removeAtIndex(0)
        return move
    }
}