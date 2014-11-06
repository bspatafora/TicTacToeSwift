import Foundation

protocol UIAdapterProtocol {
    func boardWasUpdated(#spaces: [Token])

    func aiIsThinking(#spaces: [Token])

    func gameEndedInDraw(#spaces: [Token])

    func gameEndedInWinner(#spaces: [Token], token: Token)

    func serviceIsUnavailable()
}