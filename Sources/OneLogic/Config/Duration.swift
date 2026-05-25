import Foundation

/// Logic service duration (`Duration` in `LogicService.proto`).
public struct LogicDuration: Codable, Equatable, Sendable {
    public let seconds: String

    public init(seconds: String) {
        self.seconds = seconds
    }
}
