import Foundation
import Testing
@testable import OneLogic

@Suite("ConfigResponse decoding")
struct ConfigDecodingTests {
    private let decoder = JSONDecoder()

    @Test("decode config TTL and required_comment")
    func decode_config() throws {
        let json = """
        {
          "user_alert_ttl": { "seconds": "300" },
          "rule_alert_ttl": { "seconds": "300" },
          "conditional_ttl": { "seconds": "0" },
          "required_comment": {
            "confirmed_alarm": false,
            "suspicious_situation": true,
            "false_alarm": false
          }
        }
        """
        let config = try decoder.decode(ConfigResponse.self, from: Data(json.utf8))
        #expect(config.userAlertTtl.seconds == "300")
        #expect(config.requiredComment.suspiciousSituation == true)
    }
}
