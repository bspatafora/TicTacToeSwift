import UIKit

class ViewController: UIViewController, UIAdapterProtocol {
    @IBOutlet var button0: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var status: UILabel!

    var buttons: [UIButton]!
    var game: Game!
    var port: UIPort!

    override func viewDidLoad() {
        buttons = [button0, button1, button2, button3, button4, button5, button6, button7, button8]
        game = Game(board: Board(),
                    firstToken: "X",
                    secondToken: "O")
        port = UIPort(game: game, adapter: self)
    }

    @IBAction func buttonTouch(sender: UIButton) {
        disableButton(sender)
        port.moveWasMade(move: sender.tag)
    }

    func boardWasUpdated(#spaces: [String]) {
        updateButtons(spaces)
    }

    func gameEndedInDraw(#spaces: [String]) {
        updateAndDisableButtons(spaces)
        status.text = "Draw"
    }

    func gameEndedInWinner(#spaces: [String], token: String) {
        updateAndDisableButtons(spaces)
        status.text = "\(token) wins!"
    }

    private func updateAndDisableButtons(spaces: [String]) {
        updateButtons(spaces)
        disableButtons()
    }

    private func updateButtons(spaces: [String]) {
        for (space, button) in enumerate(buttons) {
            button.setTitle(spaces[space],
                            forState: UIControlState.Normal)
        }
    }

    private func disableButtons() {
        for button in buttons {
            disableButton(button)
        }
    }

    private func disableButton(button: UIButton) {
        button.enabled = false
    }
}
