import Foundation

protocol GameProtocol {
    func currentPlayerIsAI() -> Bool

    func currentPlayerMove(#receiver: MoveReceiver)
    
    func move(space: Int)
    
    func spaces() -> [String]

    func isSpaceOpen(spaces: Int) -> Bool
    
    func isOver() -> Bool
    
    func wasDraw() -> Bool
    
    func winningToken() -> String?
}