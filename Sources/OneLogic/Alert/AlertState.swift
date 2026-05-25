import Foundation
import SafeEnum

public struct AlertState: Decodable, Equatable, Sendable {
    public let guid: String
    public let timestamp: String
    public let nodeInfo: NodeRef
    public let camera: ComponentRef
    public let alertId: String
    public let offset: String?
    public let state: SafeEnum<AlertStateKind>
    public let severity: SafeEnum<AlertSeverity>
    public let reviewerType: SafeEnum<AlertReviewerType>
    public let priority: SafeEnum<AlertPriority>?
    public let reviewer: String?
    public let bookmark: AlertStateBookmark?

    private enum CodingKeys: String, CodingKey {
        case guid
        case timestamp
        case nodeInfo = "node_info"
        case camera
        case alertId = "alert_id"
        case offset
        case state
        case severity
        case reviewerType = "reviewer_type"
        case priority
        case reviewer
        case bookmark
    }
}

public struct AlertStateBookmark: Decodable, Equatable, Sendable {
    public let guid: String?
    public let timestamp: String?
    public let isProtected: Bool?
    public let alertId: String?
    public let groupId: String?
    public let user: String?
    public let message: String?
    public let boundaryDeprecated: String?
    public let geometryDeprecated: String?

    private enum CodingKeys: String, CodingKey {
        case guid
        case timestamp
        case isProtected = "is_protected"
        case alertId = "alert_id"
        case groupId = "group_id"
        case user
        case message
        case boundaryDeprecated = "boundary_deprecated"
        case geometryDeprecated = "geometry_deprecated"
    }
}
