import UIKit

class ViewController: UIViewController, UIAdapterProtocol {
    @IBOutlet var board: BoardView!
    @IBOutlet var status: UILabel!
    @IBOutlet var newGameButton: UIButton!
    var boardButtons: [UIButton]!
    var game: Game!
    var port: UIPort!

    override func viewDidLoad() {
        boardButtons = board.buttons()
        newGame()
    }

    @IBAction func tapNewGame(sender: UIButton) {
        if game.isOver() {
            resetGame()
        } else {
            confirmNewGame()
        }
    }

    @IBAction func tapBoardButton(sender: UIButton) {
        disableButtons()
        disableNewGameButton()
        port.makeMove(move: sender.tag)
    }

    func boardWasUpdated(#spaces: [String]) {
        updateButtons(spaces)
        enableButtons(spaces)
        enableNewGameButton()
        setStatusText("")
    }

    func aiIsThinking(#spaces: [String]) {
        updateButtons(spaces)
        setStatusText("Thinking")
    }

    func serviceIsUnavailable() {
        disableButtons()
        setStatusText("AI offline")
        enableNewGameButton()
    }

    func gameEndedInDraw(#spaces: [String]) {
        endGame(spaces, outcome: "Draw")
    }

    func gameEndedInWinner(#spaces: [String], token: String) {
        endGame(spaces, outcome: "\(token) wins!")
    }

    private func confirmNewGame() {
        let alertController = UIAlertController(title: "Start a new game?", message: "This will end your current game.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let defaultAction = UIAlertAction(title: "New Game", style: .Default) { (action) in self.resetGame() }

        alertController.addAction(cancelAction)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }

    private func resetGame() {
        newGame()
        resetButtons()
        setStatusText("")
    }

    private func newGame() {
        game = Game(board: Board(), firstPlayer: Player(token: "X", type: PlayerType.Human), secondPlayer: MinimaxPlayer(token: "O", type: PlayerType.AI))
        port = UIPort(game: game, adapter: self)
    }

    private func endGame(spaces: [String], outcome: String) {
        disableButtons()
        updateButtons(spaces)
        setStatusText(outcome)
        enableNewGameButton()
    }

    private func disableButtons() {
        for button in boardButtons {
            button.enabled = false
        }
    }

    private func enableButtons(spaces: [String]) {
        for (index, button) in enumerate(boardButtons) {
            if game.isSpaceOpen(index) {
                button.enabled = true
            }
        }
    }

    private func updateButtons(spaces: [String]) {
        for (index, button) in enumerate(boardButtons) {
            button.setTitle(spaces[index], forState: UIControlState.Normal)
        }
    }

    private func resetButtons() {
        for button in boardButtons {
            button.enabled = true
            button.setTitle(nil, forState: UIControlState.Normal)
        }
    }

    private func setStatusText(message: String) {
        status.text = message
    }

    private func disableNewGameButton() {
        newGameButton.enabled = false
    }

    private func enableNewGameButton() {
        newGameButton.enabled = true
    }
}
