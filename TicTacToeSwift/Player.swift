import Foundation

enum PlayerType {
    case Human
    case AI
}

class Player {
    let token: Token
    let type: PlayerType
    
    init(token: Token, type: PlayerType) {
        self.token = token
        self.type = type
    }

    func move(#spaces: [Token], receiver: MoveReceiver) { }
}

func ==(rhs: Player, lhs: Player) -> Bool {
    return rhs.token == lhs.token
}