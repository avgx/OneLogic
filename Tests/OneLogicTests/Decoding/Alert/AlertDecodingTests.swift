import Foundation
import Testing
@testable import OneLogic

@Suite("Alert decoding")
struct AlertDecodingTests {
    private let decoder = JSONDecoder()

    @Test("decode raise alert response")
    func decode_raise() throws {
        let json = #"{"result":true,"alert_id":"8be277c9-6a9d-4aec-aa9a-2a97b330b76c"}"#
        let response = try decoder.decode(RaiseAlertResponse.self, from: Data(json.utf8))
        #expect(response.result == true)
        #expect(response.alertId == "8be277c9-6a9d-4aec-aa9a-2a97b330b76c")
    }

    @Test("decode get active alerts empty")
    func decode_get_active_empty() throws {
        let json = #"{"alerts":[]}"#
        let response = try decoder.decode(ActiveAlertsResponse.self, from: Data(json.utf8))
        #expect(response.alerts.isEmpty)
    }

    @Test("decode batch review result")
    func decode_batch_review() throws {
        let json = """
        {
          "success": ["a1", "a2"],
          "failure": [],
          "unreachable_nodes": ["node-x"]
        }
        """
        let response = try decoder.decode(BatchBeginAlertsReviewResponse.self, from: Data(json.utf8))
        #expect(response.success.count == 2)
        #expect(response.unreachableNodes == ["node-x"])
    }

    @Test("decode minimal active alert")
    func decode_minimal_alert() throws {
        let json = """
        {
          "guid": "171aac22-0f8b-49b0-be46-1241882bcb62",
          "timestamp": "20240821T105325.464866",
          "node_info": { "name": "DEMOSERVER", "friendly_name": "DEMOSERVER" },
          "camera": {
            "access_point": "hosts/DEMOSERVER/DeviceIpint.5/SourceEndpoint.video:0:0",
            "friendly_name": "5.Street"
          },
          "archive": {
            "access_point": "hosts/DEMOSERVER/MultimediaStorage.AliceBlue/MultimediaStorage",
            "friendly_name": "Archive"
          },
          "initiator_type": "AIT_MACRO",
          "reason_mask": 1,
          "initiator": "9ffabb81-eae4-45d8-a2d0-356ce4e7aaf5",
          "states": [
            {
              "guid": "bb328fbd-3a27-4eed-bc1b-97fd7a437908",
              "timestamp": "20240821T105325.464866",
              "node_info": { "name": "DEMOSERVER", "friendly_name": "DEMOSERVER" },
              "camera": {
                "access_point": "hosts/DEMOSERVER/DeviceIpint.5/SourceEndpoint.video:0:0",
                "friendly_name": "5.Street"
              },
              "alert_id": "7775f06-bd74-4a5f-be6c-3c6647c4554f",
              "offset": "0",
              "state": "ST_WANT_REACTION",
              "severity": "SV_UNCLASSIFIED",
              "reviewer_type": "RT_SYSTEM",
              "reviewer": ""
            }
          ]
        }
        """
        let alert = try decoder.decode(Alert.self, from: Data(json.utf8))
        #expect(alert.guid == "171aac22-0f8b-49b0-be46-1241882bcb62")
        #expect(alert.states.count == 1)
        #expect(alert.states[0].state.value == .wantReaction)
    }

    @Test("parse alert wire timestamp as Date")
    func decode_alert_date() throws {
        let json = """
        {
          "guid": "171aac22-0f8b-49b0-be46-1241882bcb62",
          "timestamp": "20240821T105325.464866",
          "node_info": { "name": "DEMOSERVER", "friendly_name": "DEMOSERVER" },
          "camera": {
            "access_point": "hosts/DEMOSERVER/DeviceIpint.5/SourceEndpoint.video:0:0",
            "friendly_name": "5.Street"
          },
          "archive": {
            "access_point": "hosts/DEMOSERVER/MultimediaStorage.AliceBlue/MultimediaStorage",
            "friendly_name": "Archive"
          },
          "initiator_type": "AIT_MACRO",
          "initiator": "macro-id",
          "states": []
        }
        """
        let alert = try decoder.decode(Alert.self, from: Data(json.utf8))
        let date = try #require(alert.date)
        var calendar = Calendar(identifier: .iso8601)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        #expect(components.year == 2024)
        #expect(components.month == 8)
        #expect(components.day == 21)
        #expect(components.hour == 10)
        #expect(components.minute == 53)
        #expect(components.second == 25)
    }
}
