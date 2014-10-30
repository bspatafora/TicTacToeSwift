import Foundation

class UIPort {
    let game: GameProtocol
    let adapter: UIAdapterProtocol

    init(game: GameProtocol, adapter: UIAdapterProtocol) {
        self.game = game
        self.adapter = adapter
    }

    func makeMove(#move: Int) {
        game.move(move)
        if game.isOver() {
            endGame()
        } else {
            continueGame()
        }
    }

    private func continueGame() {
        if game.currentPlayerIsAI() {
            if let move = game.getCurrentPlayerMove() {
                makeMove(move: move)
            } else {
                adapter.serviceIsUnavailable()
            }
        } else {
            updateUI()
        }
    }

    private func endGame() {
        if game.wasDraw() {
            adapter.gameEndedInDraw(spaces: game.spaces())
        } else {
            adapter.gameEndedInWinner(spaces: game.spaces(), token: game.winningToken()!)
        }
    }

    private func updateUI() {
        adapter.boardWasUpdated(spaces: game.spaces())
    }
}