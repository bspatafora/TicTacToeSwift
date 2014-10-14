import Foundation

class Board {
    private var spaces: [String]

    init(rowSize: Int = 3) {
        spaces = Array(count: rowSize * rowSize,
                       repeatedValue: "")
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
}