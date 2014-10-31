import Foundation

class UIPort: MoveReceiver {
    let game: GameProtocol
    let adapter: UIAdapterProtocol

    init(game: GameProtocol, adapter: UIAdapterProtocol) {
        self.game = game
        self.adapter = adapter
    }

    func makeMove(var #move: Int?) {
        if let move = move {
            game.move(move)
            if game.isOver() {
                endGame()
            } else {
                continueGame()
            }
        } else {
            adapter.serviceIsUnavailable()
        }
    }

    private func continueGame() {
        if game.currentPlayerIsAI() {
            adapter.boardWasUpdatedAndAIIsThinking(spaces: game.spaces())
            game.currentPlayerMove(receiver: self)
        } else {
            adapter.boardWasUpdated(spaces: game.spaces())
        }
    }

    private func endGame() {
        if game.wasDraw() {
            adapter.gameEndedInDraw(spaces: game.spaces())
        } else {
            adapter.gameEndedInWinner(spaces: game.spaces(), token: game.winningToken()!)
        }
    }
}