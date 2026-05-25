import Foundation

extension Alert {
    /// Parsed ``timestamp`` (`Timestamp.utc`).
    public var date: Date? {
        WireTimestamp.date(from: timestamp)
    }
}

extension AlertState {
    /// Parsed ``timestamp`` (`Timestamp.utc`).
    public var date: Date? {
        WireTimestamp.date(from: timestamp)
    }
}

extension AlertStateBookmark {
    /// Parsed ``timestamp`` (`Timestamp.utc`).
    public var date: Date? {
        WireTimestamp.date(from: timestamp)
    }
}

extension AlertBookmark {
    /// Parsed ``timestamp`` (`Timestamp.utc`).
    public var date: Date? {
        WireTimestamp.date(from: timestamp)
    }
}

extension MacroEventInfo {
    /// Parsed ``timestamp`` (`Timestamp.utc`).
    public var date: Date? {
        WireTimestamp.date(from: timestamp)
    }
}

extension DetectorEventInfo {
    /// Parsed ``timestamp`` (`Timestamp.utc`).
    public var date: Date? {
        WireTimestamp.date(from: timestamp)
    }
}
