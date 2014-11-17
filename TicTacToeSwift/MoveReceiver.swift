import Foundation

protocol MoveReceiver {
    func makeMove(#move: Int)

    func serviceIsUnavailable()
}