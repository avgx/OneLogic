import EncodeDecode
import Foundation
import Testing
@testable import OneLogic

@Suite("BatchGetActiveAlerts stream decoding")
struct BatchGetActiveAlertsDecodingTests {
    private let decoder = JSONDecoder()

    @Test("decode batch chunk from multipart fixture")
    func decode_multipart() throws {
        let raw = try FixtureLoader.loadData(resource: "v1_logic_service_batchgetactivealerts", ext: "multipart")
        let chunks = try decodeMultipartRelated(
            BatchGetActiveAlertsResponse.self,
            contentType: "multipart/related; boundary=ngpboundary",
            from: raw,
            using: decoder
        )
        #expect(chunks.count == 1)
        #expect(chunks[0].alerts.isEmpty)
        #expect(chunks[0].unreachableNodes.isEmpty)
    }

    @Test("decode batch chunk from SSE fixture")
    func decode_sse() throws {
        let raw = try FixtureLoader.loadData(resource: "v1_logic_service_batchgetactivealerts", ext: "sse")
        let chunks = try decodeSse(BatchGetActiveAlertsResponse.self, from: raw, using: decoder)
        #expect(chunks.count == 1)
        #expect(chunks[0].alerts.isEmpty)
    }
}
