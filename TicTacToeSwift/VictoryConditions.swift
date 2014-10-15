import Foundation

class VictoryConditions {
    func isGameOver(#board: Board) -> Bool {
        if isWinner(board) || isDraw(board) {
            return true
        }
        return false
    }

    func winningToken(#board: Board) -> String? {
        for line in board.fullLines()! {
            if filledWithSameToken(line) {
                return line[0]
            }
        }
        return nil
    }

    private func isWinner(board: Board) -> Bool {
        return winningToken(board: board) != nil
    }

    private func isDraw(board: Board) -> Bool {
        return board.isFull()
    }

    private func filledWithSameToken(line: [String]) -> Bool {
        let firstToken = line[0]
        for space in line {
            if space != firstToken {
                return false
            }
        }
        return true
    }
}