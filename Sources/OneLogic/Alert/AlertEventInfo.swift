import Foundation

public struct MacroEventInfo: Decodable, Equatable, Sendable {
    public let guid: String
    public let timestamp: String
    public let nodeInfo: NodeRef
    public let camera: ComponentRef
    public let macro: MacroEventDetail
    public let initiatorType: String?
    public let actionType: String?
    public let phase: String?
    public let eventId: String?

    private enum CodingKeys: String, CodingKey {
        case guid
        case timestamp
        case nodeInfo = "node_info"
        case camera
        case macro
        case initiatorType = "initiator_type"
        case actionType = "action_type"
        case phase
        case eventId = "event_id"
    }
}

public struct MacroEventDetail: Decodable, Equatable, Sendable {
    public let guid: String
    public let friendlyName: String

    private enum CodingKeys: String, CodingKey {
        case guid
        case friendlyName = "friendly_name"
    }
}

public struct DetectorEventInfo: Decodable, Equatable, Sendable {
    public let guid: String?
    public let timestamp: String?
    public let state: String?
    public let originDeprecated: String?
    public let originExt: ComponentRef?
    public let offlineAnalyticsSource: String?
    public let detectorDeprecated: String?
    public let detectorExt: ComponentRef?
    public let nodeInfo: NodeRef?
    public let eventType: String?
    public let multiPhaseId: String?
    public let detectorsGroup: [String]?
    public let details: [DetectorDetail]?
    public let params: [String]?

    private enum CodingKeys: String, CodingKey {
        case guid
        case timestamp
        case state
        case originDeprecated = "origin_deprecated"
        case originExt = "origin_ext"
        case offlineAnalyticsSource = "offline_analytics_source"
        case detectorDeprecated = "detector_deprecated"
        case detectorExt = "detector_ext"
        case nodeInfo = "node_info"
        case eventType = "event_type"
        case multiPhaseId = "multi_phase_id"
        case detectorsGroup = "detectors_group"
        case details
        case params
    }
}
