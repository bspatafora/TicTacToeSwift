import Foundation

enum PlayerType {
    case Human
    case AI
}

struct Player {
    let token: String
    let type: PlayerType
    
    init(token: String, type: PlayerType) {
        self.token = token
        self.type = type
    }
}

func ==(rhs: Player, lhs: Player) -> Bool {
    return rhs.token == lhs.token
}