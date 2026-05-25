import Foundation

/// `ListMacrosRequest.EViewMode` in `LogicService.proto`.
public enum MacroViewMode: String, Sendable {
    /// Server response includes only basic Macros info, with no conditions and rules.
    case stripped = "VIEW_MODE_STRIPPED"
    /// Full representation.
    case full = "VIEW_MODE_FULL"
}
