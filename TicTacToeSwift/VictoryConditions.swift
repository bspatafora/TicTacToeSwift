import Foundation

class VictoryConditions {
    func isGameOver(#board: Board) -> Bool {
        return isWinner(board) || isDraw(board: board)
    }

    func winningToken(#board: Board) -> Token? {
        for line in fullLines(board)! {
            if filledWithSameToken(line) {
                return line[0]
            }
        }
        return nil
    }

    func isDraw(#board: Board) -> Bool {
        return !isWinner(board) && board.isFull()
    }

    private func isWinner(board: Board) -> Bool {
        return winningToken(board: board) != nil
    }

    private func filledWithSameToken(line: [Token]) -> Bool {
        let firstToken = line[0]
        for space in line {
            if space != firstToken {
                return false
            }
        }
        return true
    }

    private func fullLines(board: Board) -> ([[Token]])? {
        let lines = board.rows() + board.columns() + board.diagonals()
        return lines.filter({ board.isFullLine($0) })
    }
}