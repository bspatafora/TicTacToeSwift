import Foundation

class UIPort: MoveReceiver {
    let game: GameProtocol
    let adapter: UIAdapterProtocol

    init(game: GameProtocol, adapter: UIAdapterProtocol) {
        self.game = game
        self.adapter = adapter
    }

    func makeMove(#move: Int) {
        game.move(move)
        let spaces = game.spaces()
        if game.wasDraw() {
            adapter.gameEndedInDraw(spaces: spaces)
        } else if game.isOver() {
            adapter.gameEndedInWinner(spaces: spaces, token: game.winningToken()!)
        } else if game.currentPlayerIsAI() {
            adapter.aiIsThinking(spaces: spaces)
            game.currentPlayerMove(receiver: self)
        } else {
            adapter.boardWasUpdated(spaces: spaces)
        }
    }

    func serviceIsUnavailable() {
        adapter.serviceIsUnavailable()
    }
}