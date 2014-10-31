import Foundation

class MockAIPlayer: Player {
    var moves = [0, 1, 2]
    var receivedMoveMessage = false

    override func move(#spaces: [String], receiver: MoveReceiver) {
        receivedMoveMessage = true
        let move = moves[0]
        moves.removeAtIndex(0)
        receiver.makeMove(move: move)
    }
}