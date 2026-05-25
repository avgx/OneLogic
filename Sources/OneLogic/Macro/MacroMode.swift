import Foundation

public struct MacroModeCommon: Decodable, Equatable, Sendable {}

public struct MacroModeTimeZone: Decodable, Equatable, Sendable {
    public let timezoneId: String

    private enum CodingKeys: String, CodingKey {
        case timezoneId = "timezone_id"
    }
}

public struct MacroModeAutorule: Decodable, Equatable, Sendable {
    public let zoneAp: AccessPoint
    public let onlyIfArmed: Bool?
    public let timezoneId: String?

    private enum CodingKeys: String, CodingKey {
        case zoneAp = "zone_ap"
        case onlyIfArmed = "only_if_armed"
        case timezoneId = "timezone_id"
    }
}

public struct MacroModeContinuous: Decodable, Equatable, Sendable {
    public let server: String?
    public let timezoneId: String?
    public let heartbeatMs: Int?
    public let random: Bool?

    private enum CodingKeys: String, CodingKey {
        case server
        case timezoneId = "timezone_id"
        case heartbeatMs = "heartbeat_ms"
        case random
    }
}

/// Stripped macro mode (`MacroMode` in `Macro.proto`).
public struct MacroMode: Decodable, Equatable, Sendable {
    public let enabled: Bool
    public let userRole: String?
    public let isAddToMenu: Bool?
    public let common: MacroModeCommon?
    public let timeZone: MacroModeTimeZone?
    public let autorule: MacroModeAutorule?
    public let continuous: MacroModeContinuous?

    private enum CodingKeys: String, CodingKey {
        case enabled
        case userRole = "user_role"
        case isAddToMenu = "is_add_to_menu"
        case common
        case timeZone = "time_zone"
        case autorule
        case continuous
    }
}
