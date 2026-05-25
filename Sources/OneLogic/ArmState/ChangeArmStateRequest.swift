import Foundation

/// Request for `POST /v1/logic_service/armstate`.
public struct ChangeArmStateRequest: Encodable, Equatable, Sendable {
    public let cameraAp: AccessPoint
    public let state: CameraArmState
    public let timeout: LogicDuration?

    public init(cameraAp: AccessPoint, state: CameraArmState, timeout: LogicDuration? = nil) {
        self.cameraAp = cameraAp
        self.state = state
        self.timeout = timeout
    }

    private enum CodingKeys: String, CodingKey {
        case cameraAp = "camera_ap"
        case state
        case timeout
    }
}
