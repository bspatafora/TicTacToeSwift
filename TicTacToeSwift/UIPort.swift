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
            if game.getCurrentPlayer().type == PlayerType.AI {
                makeMove(move: game.getCurrentPlayer().move(spaces: game.spaces()))
            } else {
                updateBoard()
            }
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