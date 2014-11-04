import Foundation

protocol UIAdapterProtocol {
    func boardWasUpdated(#spaces: [String])

    func aiIsThinking(#spaces: [String])

    func gameEndedInDraw(#spaces: [String])

    func gameEndedInWinner(#spaces: [String], token: String)

    func serviceIsUnavailable()
}