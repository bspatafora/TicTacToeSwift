import Foundation

class UIPort {
    let game: Game
    let adapter: UIAdapterProtocol

    init(game: Game, adapter: UIAdapterProtocol) {
        self.game = game
        self.adapter = adapter
    }

    func moveWasMade(#move: Int) {
        game.move(move)
        game.switchTokens()
        if game.isOver() {
            endGame()
        } else {
            updateBoard()
        }
    }

    private func endGame() {
        if game.wasDraw() {
            adapter.gameEndedInDraw(spaces: game.spaces())
        } else {
            adapter.gameEndedInWinner(spaces: game.spaces(), token: game.winningToken()!)
        }
    }

    private func updateBoard() {
        adapter.boardWasUpdated(spaces: game.spaces())
    }
}