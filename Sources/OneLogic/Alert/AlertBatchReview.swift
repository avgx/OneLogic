import Foundation

public struct AlertParent: Codable, Equatable, Sendable {
    public let macro: String?
    public let user: String?

    public init(macro: String? = nil, user: String? = nil) {
        self.macro = macro
        self.user = user
    }
}

public struct AlertFilter: Encodable, Equatable, Sendable {
    public let groups: [String]
    public let parents: [AlertParent]

    public init(groups: [String] = [], parents: [AlertParent] = []) {
        self.groups = groups
        self.parents = parents
    }
}

public struct BatchBeginAlertsReviewRequest: Encodable, Equatable, Sendable {
    public let nodes: [String]
    public let filter: AlertFilter

    public init(nodes: [String], filter: AlertFilter = AlertFilter()) {
        self.nodes = nodes
        self.filter = filter
    }
}

public struct BatchContinueAlertsReviewRequest: Encodable, Equatable, Sendable {
    public let nodes: [String]
    public let filter: AlertFilter

    public init(nodes: [String], filter: AlertFilter = AlertFilter()) {
        self.nodes = nodes
        self.filter = filter
    }
}

public struct BatchCancelAlertsReviewRequest: Encodable, Equatable, Sendable {
    public let nodes: [String]
    public let filter: AlertFilter

    public init(nodes: [String], filter: AlertFilter = AlertFilter()) {
        self.nodes = nodes
        self.filter = filter
    }
}

public struct BatchCompleteAlertsReviewRequest: Encodable, Equatable, Sendable {
    public let nodes: [String]
    public let filter: AlertFilter
    public let severity: AlertReviewSeverity
    public let bookmark: AlertBookmark

    public init(
        nodes: [String],
        filter: AlertFilter = AlertFilter(),
        severity: AlertReviewSeverity,
        bookmark: AlertBookmark = .empty
    ) {
        self.nodes = nodes
        self.filter = filter
        self.severity = severity
        self.bookmark = bookmark
    }
}

public struct BatchEscalateAlertsRequest: Encodable, Equatable, Sendable {
    public let nodes: [String]
    public let filter: AlertFilter
    public let priority: AlertPriority
    public let userRoles: [String]
    public let comment: String

    public init(
        nodes: [String],
        filter: AlertFilter = AlertFilter(),
        priority: AlertPriority,
        userRoles: [String] = [],
        comment: String = ""
    ) {
        self.nodes = nodes
        self.filter = filter
        self.priority = priority
        self.userRoles = userRoles
        self.comment = comment
    }

    private enum CodingKeys: String, CodingKey {
        case nodes
        case filter
        case priority
        case userRoles = "user_roles"
        case comment
    }
}

public struct BatchAlertsReviewResultResponse: Decodable, Equatable, Sendable {
    public let success: [String]
    public let failure: [String]
    public let unreachableNodes: [String]

    private enum CodingKeys: String, CodingKey {
        case success
        case failure
        case unreachableNodes = "unreachable_nodes"
    }
}

public typealias BatchBeginAlertsReviewResponse = BatchAlertsReviewResultResponse
public typealias BatchContinueAlertsReviewResponse = BatchAlertsReviewResultResponse
public typealias BatchCancelAlertsReviewResponse = BatchAlertsReviewResultResponse
public typealias BatchCompleteAlertsReviewResponse = BatchAlertsReviewResultResponse
public typealias BatchEscalateAlertsResponse = BatchAlertsReviewResultResponse
