import Foundation

/// Camera arming state (`CameraArmStateEvent.ECameraArmState` in `Events.proto`).
///
/// Keep in sync with [OneEvents](https://github.com/avgx/OneEvents) `CameraArmState` wire values.
public enum CameraArmState: String, Codable, CaseIterable, Sendable {
    case disarm = "CS_Disarm"
    case arm = "CS_Arm"
    case armPrivate = "CS_ArmPrivate"
}
