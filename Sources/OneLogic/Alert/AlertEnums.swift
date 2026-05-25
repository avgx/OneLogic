import Foundation
import SafeEnum

/// Alert initiator type (`Alert.EInitiatorType` in `Events.proto`).
public enum AlertInitiatorType: String, Codable, Sendable {
    /// User initiator; ``Alert/initiator`` is the user login.
    case user = "AIT_USER"
    /// Macro initiator; ``Alert/initiator`` is the macro ID.
    case macro = "AIT_MACRO"
}

/// Alert processing state (`AlertState.EState` in `Events.proto`).
public enum AlertStateKind: String, Codable, Sendable {
    case none = "ST_NONE"
    case wantReaction = "ST_WANT_REACTION"
    case wantProcessing = "ST_WANT_PROCESSING"
    case closed = "ST_CLOSED"
}

/// Alert severity (`AlertState.ESeverity` in `Events.proto`).
public enum AlertSeverity: String, Codable, Sendable {
    case unclassified = "SV_UNCLASSIFIED"
    case falseAlarm = "SV_FALSE"
    case notice = "SV_NOTICE"
    case warning = "SV_WARNING"
    case alarm = "SV_ALARM"
}

/// Severity sent when completing an alert review (`AlertState.ESeverity` / `CompleteAlertReviewRequest.severity`).
public enum AlertReviewSeverity: String, Encodable, Sendable {
    case falseAlarm = "SV_FALSE"
    case warning = "SV_WARNING"
    case alarm = "SV_ALARM"
}

/// Alert reviewer type (`AlertState.EReviewerType` in `Events.proto`).
public enum AlertReviewerType: String, Codable, Sendable {
    case system = "RT_SYSTEM"
    case user = "RT_USER"
}

/// Alert priority (`EAlertPriority` in `Events.proto`).
public enum AlertPriority: String, Codable, Sendable {
    case unspecified = "ALERT_PRIORITY_UNSPECIFIED"
    case minimum = "AP_MINIMUM"
    case low = "AP_LOW"
    case medium = "AP_MEDIUM"
    case high = "AP_HIGH"
    case maximum = "AP_MAXIMUM"
}
