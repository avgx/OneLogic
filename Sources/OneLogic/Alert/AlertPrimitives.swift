import Foundation

public struct NodeRef: Decodable, Equatable, Sendable {
    public let name: String
    public let friendlyName: String

    private enum CodingKeys: String, CodingKey {
        case name
        case friendlyName = "friendly_name"
    }
}

public struct ComponentRef: Decodable, Equatable, Sendable {
    public let accessPoint: AccessPoint
    public let friendlyName: String
    public let group: String?

    private enum CodingKeys: String, CodingKey {
        case accessPoint = "access_point"
        case friendlyName = "friendly_name"
        case group
    }
}

public struct AlertTimeRange: Codable, Equatable, Sendable {
    public let beginTime: String
    public let endTime: String

    public init(beginTime: String, endTime: String) {
        self.beginTime = beginTime
        self.endTime = endTime
    }

    private enum CodingKeys: String, CodingKey {
        case beginTime = "begin_time"
        case endTime = "end_time"
    }
}

public struct AlertBookmarkEndpoint: Codable, Equatable, Sendable {
    public let accessPoint: AccessPoint

    public init(accessPoint: AccessPoint) {
        self.accessPoint = accessPoint
    }

    private enum CodingKeys: String, CodingKey {
        case accessPoint = "access_point"
    }
}

/// Bookmark payload for `completealert` (`events.Bookmark` subset used on wire).
public struct AlertBookmark: Codable, Equatable, Sendable {
    public let alertId: String?
    public let camera: AlertBookmarkEndpoint?
    public let archive: AlertBookmarkEndpoint?
    public let guid: String?
    public let groupId: String?
    public let isProtected: Bool?
    public let message: String?
    public let range: AlertTimeRange?
    public let timestamp: String?
    public let user: String?

    public init(
        alertId: String? = nil,
        camera: AlertBookmarkEndpoint? = nil,
        archive: AlertBookmarkEndpoint? = nil,
        guid: String? = nil,
        groupId: String? = nil,
        isProtected: Bool? = nil,
        message: String? = nil,
        range: AlertTimeRange? = nil,
        timestamp: String? = nil,
        user: String? = nil
    ) {
        self.alertId = alertId
        self.camera = camera
        self.archive = archive
        self.guid = guid
        self.groupId = groupId
        self.isProtected = isProtected
        self.message = message
        self.range = range
        self.timestamp = timestamp
        self.user = user
    }

    public static let empty = AlertBookmark()

    private enum CodingKeys: String, CodingKey {
        case alertId = "alert_id"
        case camera
        case archive
        case guid
        case groupId = "group_id"
        case isProtected = "is_protected"
        case message
        case range
        case timestamp
        case user
    }
}

public struct AlertRectangle: Decodable, Equatable, Sendable {
    public let x: Double
    public let y: Double
    public let w: Double
    public let h: Double
    public let index: Int
}

public struct DetectorDetail: Decodable, Equatable, Sendable {
    public let rectangle: AlertRectangle
}
