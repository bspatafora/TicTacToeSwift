import UIKit

class ViewController: UIViewController, UIAdapterProtocol {
    @IBOutlet var board: UIView!
    @IBOutlet var status: UILabel!
    var boardButtons: [UIButton]!
    var game: Game!
    var port: UIPort!

    override func viewDidLoad() {
        boardButtons = board.subviews as [UIButton]
        let firstPlayer = Player(token: "X", type: PlayerType.Human)
        let secondPlayer = MinimaxPlayer(token: "O", type: PlayerType.AI)
        game = Game(board: Board(),
                    firstPlayer: firstPlayer,
                    secondPlayer: secondPlayer)
        port = UIPort(game: game, adapter: self)
    }

    @IBAction func userMove(sender: UIButton) {
        disableButtons()
        port.makeMove(move: sender.tag)
    }

    func boardWasUpdated(#spaces: [String]) {
        updateButtons(spaces)
        enableButtons(spaces: spaces)
        status.text = nil
    }

    func boardWasUpdatedAndAIIsThinking(#spaces: [String]) {
        updateButtons(spaces)
        status.text = "Thinking"
    }

    func gameEndedInDraw(#spaces: [String]) {
        updateAndDisableButtons(spaces)
        status.text = "Draw"
    }

    func gameEndedInWinner(#spaces: [String], token: String) {
        updateAndDisableButtons(spaces)
        status.text = "\(token) wins!"
    }

    func serviceIsUnavailable() {
        disableButtons()
        status.text = "AI offline"
    }

    private func updateAndDisableButtons(spaces: [String]) {
        updateButtons(spaces)
        disableButtons()
    }

    private func updateButtons(spaces: [String]) {
        for (index, button) in enumerate(boardButtons) {
            button.setTitle(spaces[index],
                            forState: UIControlState.Normal)
        }
    }

    private func disableButtons() {
        for button in boardButtons {
            button.enabled = false
        }
    }

    private func enableButtons(#spaces: [String]) {
        for (index, button) in enumerate(boardButtons) {
            if game.isSpaceOpen(index) {
                button.enabled = true
            }
        }
    }
}
