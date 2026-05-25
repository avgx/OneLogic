import Foundation

/// Response for `GET /v1/logic_service/config`.
public struct ConfigResponse: Decodable, Equatable, Sendable {
    public let userAlertTtl: LogicDuration
    public let ruleAlertTtl: LogicDuration
    public let conditionalTtl: LogicDuration
    public let requiredComment: MandatoryComment
    public let maxEventAge: LogicDuration?
    public let eventCleanupPeriod: LogicDuration?

    private enum CodingKeys: String, CodingKey {
        case userAlertTtl = "user_alert_ttl"
        case ruleAlertTtl = "rule_alert_ttl"
        case conditionalTtl = "conditional_ttl"
        case requiredComment = "required_comment"
        case maxEventAge = "max_event_age"
        case eventCleanupPeriod = "event_cleanup_period"
    }
}
