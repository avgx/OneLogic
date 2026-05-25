import Foundation
import Testing

enum FixtureLoader {
    static func loadData(resource: String, ext: String) throws -> Data {
        let url = try #require(Bundle.module.url(forResource: resource, withExtension: ext))
        return try Data(contentsOf: url)
    }
}
