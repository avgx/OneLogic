import Foundation
import Testing
@testable import OneLogic

@Suite("Macro decoding")
struct MacroDecodingTests {
    private let decoder = JSONDecoder()

    @Test("decode list macros response")
    func decode_list() throws {
        let json = """
        {
          "items": [
            {
              "guid": "3303abb2-181e-4e83-8987-8a06c309a741",
              "name": "Raise alert",
              "mode": {
                "enabled": true,
                "user_role": "operator",
                "is_add_to_menu": true,
                "common": {}
              }
            }
          ],
          "next_page_token": ""
        }
        """
        let response = try decoder.decode(ListMacrosResponse.self, from: Data(json.utf8))
        #expect(response.items.count == 1)
        #expect(response.items[0].mode.enabled == true)
        #expect(response.items[0].mode.common != nil)
        #expect(response.nextPageToken == "")
    }
}
