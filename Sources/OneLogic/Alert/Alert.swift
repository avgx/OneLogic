import Foundation
import SafeEnum

/// Active alert (`events.Alert` on wire).
public struct Alert: Decodable, Equatable, Sendable {
    public let guid: String
    public let timestamp: String
    public let nodeInfo: NodeRef
    public let camera: ComponentRef
    public let archive: ComponentRef
    public let requiredComment: MandatoryComment?
    public let initiatorType: SafeEnum<AlertInitiatorType>
    public let reasonMask: Int?
    public let initiator: String
    public let states: [AlertState]
    public let macro: MacroEventInfo?
    public let detector: DetectorEventInfo?

    private enum CodingKeys: String, CodingKey {
        case guid
        case timestamp
        case nodeInfo = "node_info"
        case camera
        case archive
        case requiredComment = "required_comment"
        case initiatorType = "initiator_type"
        case reasonMask = "reason_mask"
        case initiator
        case states
        case macro
        case detector
    }
}
