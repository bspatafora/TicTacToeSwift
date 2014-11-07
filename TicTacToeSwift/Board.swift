import Foundation

class Board {
    private var spaces = Array(count: 9, repeatedValue: Token.Empty)

    func place(#token: Token, space: Int) {
        spaces[space] = token
    }

    func space(space: Int) -> Token {
        return spaces[space]
    }

    func isSpaceEmpty(space: Int) -> Bool {
        return spaces[space] == Token.Empty
    }

    func getSpaces() -> [Token] {
        return spaces
    }

    func rows() -> [[Token]] {
        return [[spaces[0], spaces[1], spaces[2]],
                [spaces[3], spaces[4], spaces[5]],
                [spaces[6], spaces[7], spaces[8]]]
    }

    func columns() -> [[Token]] {
        return [[spaces[0], spaces[3], spaces[6]],
                [spaces[1], spaces[4], spaces[7]],
                [spaces[2], spaces[5], spaces[8]]]
    }

    func diagonals() -> [[Token]] {
        return [[spaces[0], spaces[4], spaces[8]],
                [spaces[2], spaces[4], spaces[6]]]
    }

    func isFull() -> Bool {
        return isFull(spaces)
    }

    func isFullLine(line: [Token]) -> Bool {
        return isFull(line)
    }

    private func isFull(tokenArray: [Token]) -> Bool {
        for space in tokenArray {
            if space == Token.Empty {
                return false
            }
        }
        return true
    }
}