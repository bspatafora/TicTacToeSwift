import Foundation

protocol GameProtocol {
    func getCurrentPlayer() -> Player
    
    func move(space: Int)
    
    func spaces() -> [String]
    
    func isOver() -> Bool
    
    func wasDraw() -> Bool
    
    func winningToken() -> String?
}