import Foundation

public struct MacroConfig: Codable, Equatable, Identifiable, Sendable {
    public let guid: String
    public let name: String
    public let mode: MacroMode
    
    public var id: String { guid }
}

public struct ListMacrosResponse: Decodable, Equatable, Sendable {
    public let items: [MacroConfig]
    public let nextPageToken: String

    private enum CodingKeys: String, CodingKey {
        case items
        case nextPageToken = "next_page_token"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decodeIfPresent([MacroConfig].self, forKey: .items) ?? []
        nextPageToken = try container.decodeIfPresent(String.self, forKey: .nextPageToken) ?? ""
    }
}

public struct LaunchMacroRequest: Encodable, Equatable, Sendable {
    public let macroId: String

    public init(macroId: String) {
        self.macroId = macroId
    }

    private enum CodingKeys: String, CodingKey {
        case macroId = "macro_id"
    }
}
