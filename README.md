# OneLogic

Swift package with **hand-written `Codable` models** and **typed HTTP request builders** for the Native BL **Logic Service** API (`v1/logic_service/*`), aligned with [`LogicService.proto`](https://github.com/jerrygergov/axxon-telegram-vms/blob/main/support/protos/axxonsoft/bl/logic/LogicService.proto).

The package does **not** use protobuf code generation.

**Platforms:** iOS 15+, macOS 13+, tvOS 17+, visionOS 1+  
**Swift tools:** 6.2+

## Dependencies

| Package | Role |
|---------|------|
| [RequestResponse](https://github.com/avgx/RequestResponse) | `LogicApi` returns `Request<T>` / `Request<PagedResponse<T>>` |
| [OneWireFormat](https://github.com/avgx/OneWireFormat) | `AccessPoint` typealias |
| [SafeEnum](https://github.com/avgx/SafeEnum) | Forward-compatible enum decoding on alerts |
| [EncodeDecode](https://github.com/avgx/EncodeDecode) | **Tests only** — `decodeSse`, `decodeMultipartRelated` |

## API surface (`LogicApi`)

| Method | HTTP | Response |
|--------|------|----------|
| `listMacros(view:pageToken:pageSize:)` | `GET /v1/logic_service/macros` | `ListMacrosResponse` |
| `launchMacro(_:)` | `POST /v1/logic_service/macros:launch` | `Void` |
| `changeArmState(_:)` | `POST /v1/logic_service/armstate` | `Void` |
| `getConfig()` | `GET /v1/logic_service/config` | `ConfigResponse` |
| `getActiveAlerts(_:)` | `POST /v1/logic_service/getactivealerts` | `ActiveAlertsResponse` |
| `batchGetActiveAlerts(_:)` | `POST /v1/logic_service/batchgetactivealerts` | stream → `PagedResponse<BatchGetActiveAlertsResponse>` |
| `batchBeginAlertsReview(_:)` | `POST /v1/logic_service/batchbeginalertsreview` | stream |
| `batchContinueAlertsReview(_:)` | `POST /v1/logic_service/batchcontinuealertsreview` | stream |
| `batchCancelAlertsReview(_:)` | `POST /v1/logic_service/batchcancelalertsreview` | stream |
| `batchCompleteAlertsReview(_:)` | `POST /v1/logic_service/batchcompletealertsreview` | stream |
| `batchEscalateAlerts(_:)` | `POST /v1/logic_service/batchescalatealerts` | stream |
| `raiseAlert(_:)` | `POST /v1/logic_service/raisealert` | `RaiseAlertResponse` |
| `beginAlertReview(_:)` | `POST /v1/logic_service/beginalert` | `AlertReviewResultResponse` |
| `cancelAlertReview(_:)` | `POST /v1/logic_service/cancelalert` | `AlertReviewResultResponse` |
| `continueAlertReview(_:)` | `POST /v1/logic_service/continuealert` | `AlertReviewResultResponse` |
| `completeAlertReview(_:)` | `POST /v1/logic_service/completealert` | `AlertReviewResultResponse` |
| `escalateAlert(_:)` | `POST /v1/logic_service/escalatealert` | `AlertReviewResultResponse` |

### Stream responses (SSE and legacy multipart)

Server-stream endpoints return many JSON documents in one HTTP body (`text/event-stream` on newer BL, `multipart/related` on older).

```swift
import OneLogic
import RequestResponse
import HTTP

let chunks: [BatchGetActiveAlertsResponse] = try await http.pages(
    LogicApi.batchGetActiveAlerts(),
    with: builder
)
let alerts = chunks.flatMap(\.alerts)
```

Use `pages`, not `send`, for `Request<PagedResponse<…>>`.

### Macros (mobile)

Load the **full** catalog (no server `query` filter), then filter on device (`enabled`, `isAddToMenu`, role):

```swift
var all: [MacroConfig] = []
var token: String? = nil
repeat {
    let page = try await http.send(LogicApi.listMacros(pageToken: token), with: builder).value
    all.append(contentsOf: page.items)
    token = page.nextPageToken.isEmpty ? nil : page.nextPageToken
} while token != nil
```

### Unary example

```swift
let active = try await http.send(
    LogicApi.getActiveAlerts(ActiveAlertsRequest(cameraAp: cameraAp)),
    with: builder
).value
```

## Module layout

```
Sources/OneLogic/
├── API/LogicApi.swift
├── Macro/
├── Alert/
├── ArmState/
└── Config/
```

## Tests

```bash
swift test
```

Capture fixtures from a lab server:

```bash
# Config
curl -sS -u user:pass 'https://HOST/asip-api/v1/logic_service/config'

# Active alerts (camera)
curl -sS -u user:pass -X POST 'https://HOST/asip-api/v1/logic_service/getactivealerts' \
  -H 'Content-Type: application/json' \
  -d '{"camera_ap":"hosts/SERVER/DeviceIpint.1/SourceEndpoint.video:0:0"}'

# Batch active (save Content-Type: .sse or .multipart)
curl -sS -u user:pass -X POST 'https://HOST/asip-api/v1/logic_service/batchgetactivealerts' \
  -H 'Content-Type: application/json' -d '{}'

# Macros list
curl -sS -u user:pass 'https://HOST/asip-api/v1/logic_service/macros?view=VIEW_MODE_STRIPPED'
```
