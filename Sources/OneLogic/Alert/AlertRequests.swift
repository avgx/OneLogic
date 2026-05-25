import Foundation

// MARK: - Active alerts

public struct ActiveAlertsRequest: Encodable, Equatable, Sendable {
    public let cameraAp: AccessPoint

    public init(cameraAp: AccessPoint) {
        self.cameraAp = cameraAp
    }

    private enum CodingKeys: String, CodingKey {
        case cameraAp = "camera_ap"
    }
}

public struct ActiveAlertsResponse: Decodable, Equatable, Sendable {
    public let alerts: [Alert]
}

public struct BatchGetActiveAlertsRequest: Encodable, Equatable, Sendable {
    public let nodes: [String]

    public init(nodes: [String] = []) {
        self.nodes = nodes
    }
}

public struct BatchGetActiveAlertsResponse: Decodable, Equatable, Sendable {
    public let alerts: [Alert]
    public let unreachableNodes: [String]

    private enum CodingKeys: String, CodingKey {
        case alerts
        case unreachableNodes = "unreachable_nodes"
    }
}

// MARK: - Raise / review (unary)

public struct RaiseAlertRequest: Encodable, Equatable, Sendable {
    public let cameraAp: AccessPoint

    public init(cameraAp: AccessPoint) {
        self.cameraAp = cameraAp
    }

    private enum CodingKeys: String, CodingKey {
        case cameraAp = "camera_ap"
    }
}

public struct RaiseAlertResponse: Decodable, Equatable, Sendable {
    public let result: Bool
    public let alertId: String?

    private enum CodingKeys: String, CodingKey {
        case result
        case alertId = "alert_id"
    }
}

public struct BeginAlertReviewRequest: Encodable, Equatable, Sendable {
    public let cameraAp: AccessPoint
    public let alertId: String

    public init(cameraAp: AccessPoint, alertId: String) {
        self.cameraAp = cameraAp
        self.alertId = alertId
    }

    private enum CodingKeys: String, CodingKey {
        case cameraAp = "camera_ap"
        case alertId = "alert_id"
    }
}

public struct CancelAlertReviewRequest: Encodable, Equatable, Sendable {
    public let cameraAp: AccessPoint
    public let alertId: String

    public init(cameraAp: AccessPoint, alertId: String) {
        self.cameraAp = cameraAp
        self.alertId = alertId
    }

    private enum CodingKeys: String, CodingKey {
        case cameraAp = "camera_ap"
        case alertId = "alert_id"
    }
}

public struct ContinueAlertReviewRequest: Encodable, Equatable, Sendable {
    public let cameraAp: AccessPoint
    public let alertId: String

    public init(cameraAp: AccessPoint, alertId: String) {
        self.cameraAp = cameraAp
        self.alertId = alertId
    }

    private enum CodingKeys: String, CodingKey {
        case cameraAp = "camera_ap"
        case alertId = "alert_id"
    }
}

public struct CompleteAlertReviewRequest: Encodable, Equatable, Sendable {
    public let severity: AlertReviewSeverity
    public let bookmark: AlertBookmark
    public let cameraAp: AccessPoint
    public let alertId: String

    public init(
        cameraAp: AccessPoint,
        alertId: String,
        severity: AlertReviewSeverity,
        bookmark: AlertBookmark = .empty
    ) {
        self.cameraAp = cameraAp
        self.alertId = alertId
        self.severity = severity
        self.bookmark = bookmark
    }

    private enum CodingKeys: String, CodingKey {
        case severity
        case bookmark
        case cameraAp = "camera_ap"
        case alertId = "alert_id"
    }
}

public struct EscalateAlertRequest: Encodable, Equatable, Sendable {
    public let cameraAp: AccessPoint
    public let alertId: String
    public let priority: AlertPriority
    public let userRoles: [String]
    public let comment: String

    public init(
        cameraAp: AccessPoint,
        alertId: String,
        priority: AlertPriority,
        userRoles: [String] = [],
        comment: String = ""
    ) {
        self.cameraAp = cameraAp
        self.alertId = alertId
        self.priority = priority
        self.userRoles = userRoles
        self.comment = comment
    }

    private enum CodingKeys: String, CodingKey {
        case cameraAp = "camera_ap"
        case alertId = "alert_id"
        case priority
        case userRoles = "user_roles"
        case comment
    }
}

public struct AlertReviewResultResponse: Decodable, Equatable, Sendable {
    public let result: Bool
}
