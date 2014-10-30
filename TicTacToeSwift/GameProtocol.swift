import Foundation

protocol GameProtocol {
    func currentPlayerIsAI() -> Bool

    func getCurrentPlayerMove() -> Int?
    
    func move(space: Int)
    
    func spaces() -> [String]
    
    func isOver() -> Bool
    
    func wasDraw() -> Bool
    
    func winningToken() -> String?
}