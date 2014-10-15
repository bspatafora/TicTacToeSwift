import Foundation

class Board {
    private let emptySpace: String // Class variables not yet supported
    private var spaces: [String]

    init() {
        emptySpace = " "
        spaces = Array(count: 9,
                       repeatedValue: emptySpace)
    }

    func place(#token: String, space: Int) {
        spaces[space] = token
    }

    func space(space: Int) -> String {
        return spaces[space]
    }

    func getSpaces() -> [String] {
        return spaces
    }

    func getFullLines() -> ([[String]])? {
        return lines().filter({ self.isFullLine($0) })
    }

    func isFull() -> Bool {
        for space in spaces {
            if space == emptySpace {
                return false
            }
        }
        return true
    }

    private func lines() -> [[String]] {
        return rows() + columns() + diagonals()
    }

    private func rows() -> [[String]] {
        return [[spaces[0], spaces[1], spaces[2]],
                [spaces[3], spaces[4], spaces[5]],
                [spaces[6], spaces[7], spaces[8]]]
    }

    private func columns() -> [[String]] {
        return [[spaces[0], spaces[3], spaces[6]],
                [spaces[1], spaces[4], spaces[7]],
                [spaces[2], spaces[5], spaces[8]]]
    }

    private func diagonals() -> [[String]] {
        return [[spaces[0], spaces[4], spaces[8]],
                [spaces[2], spaces[4], spaces[6]]]
    }

    private func isFullLine(line: [String]) -> Bool {
        for space in line {
            if space == emptySpace {
                return false
            }
        }
        return true
    }
}