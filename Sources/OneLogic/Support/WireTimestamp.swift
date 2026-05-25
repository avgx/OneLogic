import Foundation
import OneWireFormat

enum WireTimestamp {
    static func date(from wire: String?) -> Date? {
        guard let wire, !wire.isEmpty else { return nil }
        return Timestamp.utc.date(from: wire)
    }
}
