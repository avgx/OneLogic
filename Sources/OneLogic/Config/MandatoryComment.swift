import Foundation

/// Required comment flags for alert completion (`MandatoryComment` in proto).
public struct MandatoryComment: Codable, Equatable, Sendable {
    public let confirmedAlarm: Bool
    public let suspiciousSituation: Bool
    public let falseAlarm: Bool

    private enum CodingKeys: String, CodingKey {
        case confirmedAlarm = "confirmed_alarm"
        case suspiciousSituation = "suspicious_situation"
        case falseAlarm = "false_alarm"
    }
}
