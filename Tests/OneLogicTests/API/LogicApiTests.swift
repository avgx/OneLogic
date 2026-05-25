import Foundation
import RequestResponse
import Testing
@testable import OneLogic

@Suite("LogicApi request builders")
struct LogicApiTests {
    private let cameraAp = "hosts/DEMOSERVER/DeviceIpint.5/SourceEndpoint.video:0:0"
    private let macroId = "3303abb2-181e-4e83-8987-8a06c309a741"
    private let alertId = "8be277c9-6a9d-4aec-aa9a-2a97b330b76c"

    @Test("listMacros default stripped view")
    func listMacros_query() {
        let request = LogicApi.listMacros()
        #expect(request.path == "v1/logic_service/macros")
        #expect(request.method == .get)
        #expect(request.query?.contains(where: { $0.0 == "view" && $0.1 == MacroViewMode.stripped.rawValue }) == true)
    }

    @Test("listMacros supports pagination query")
    func listMacros_pagination() {
        let request = LogicApi.listMacros(pageToken: "tok", pageSize: 50)
        #expect(request.query?.contains(where: { $0.0 == "page_token" && $0.1 == "tok" }) == true)
        #expect(request.query?.contains(where: { $0.0 == "page_size" && $0.1 == "50" }) == true)
    }

    @Test("launchMacro posts body")
    func launchMacro_body() {
        let body = LaunchMacroRequest(macroId: macroId)
        let request = LogicApi.launchMacro(body)
        #expect(request.path == "v1/logic_service/macros:launch")
        #expect(request.method == .post)
        #expect(request.body as? LaunchMacroRequest == body)
    }

    @Test("changeArmState posts body")
    func changeArmState_body() {
        let body = ChangeArmStateRequest(cameraAp: cameraAp, state: .arm)
        let request = LogicApi.changeArmState(body)
        #expect(request.path == "v1/logic_service/armstate")
        #expect(request.method == .post)
        #expect(request.body as? ChangeArmStateRequest == body)
    }

    @Test("getConfig is GET")
    func getConfig_get() {
        let request = LogicApi.getConfig()
        #expect(request.path == "v1/logic_service/config")
        #expect(request.method == .get)
    }

    @Test("getActiveAlerts posts camera_ap")
    func getActiveAlerts_body() {
        let body = ActiveAlertsRequest(cameraAp: cameraAp)
        let request = LogicApi.getActiveAlerts(body)
        #expect(request.path == "v1/logic_service/getactivealerts")
        #expect(request.method == .post)
        #expect(request.body as? ActiveAlertsRequest == body)
    }

    @Test("batchGetActiveAlerts default empty nodes")
    func batchGetActiveAlerts_body() {
        let request = LogicApi.batchGetActiveAlerts()
        #expect(request.path == "v1/logic_service/batchgetactivealerts")
        #expect(request.method == .post)
        #expect((request.body as? BatchGetActiveAlertsRequest)?.nodes.isEmpty == true)
    }

    @Test("raiseAlert path and body")
    func raiseAlert_request() {
        let body = RaiseAlertRequest(cameraAp: cameraAp)
        let request = LogicApi.raiseAlert(body)
        #expect(request.path == "v1/logic_service/raisealert")
        #expect(request.method == .post)
    }

    @Test("beginAlertReview path")
    func beginAlertReview_path() {
        let request = LogicApi.beginAlertReview(
            BeginAlertReviewRequest(cameraAp: cameraAp, alertId: alertId)
        )
        #expect(request.path == "v1/logic_service/beginalert")
        #expect(request.method == .post)
    }

    @Test("batch review stream endpoints")
    func batchReview_paths() {
        let filter = AlertFilter()
        let nodes = ["node1"]

        #expect(LogicApi.batchBeginAlertsReview(BatchBeginAlertsReviewRequest(nodes: nodes, filter: filter)).path
            == "v1/logic_service/batchbeginalertsreview")
        #expect(LogicApi.batchContinueAlertsReview(BatchContinueAlertsReviewRequest(nodes: nodes, filter: filter)).path
            == "v1/logic_service/batchcontinuealertsreview")
        #expect(LogicApi.batchCancelAlertsReview(BatchCancelAlertsReviewRequest(nodes: nodes, filter: filter)).path
            == "v1/logic_service/batchcancelalertsreview")
        #expect(LogicApi.batchCompleteAlertsReview(
            BatchCompleteAlertsReviewRequest(nodes: nodes, filter: filter, severity: .alarm)
        ).path == "v1/logic_service/batchcompletealertsreview")
        #expect(LogicApi.batchEscalateAlerts(
            BatchEscalateAlertsRequest(nodes: nodes, filter: filter, priority: .medium)
        ).path == "v1/logic_service/batchescalatealerts")
    }

    @Test("typed Request response markers")
    func typed_markers() {
        let _: Request<ListMacrosResponse> = LogicApi.listMacros()
        let _: Request<Void> = LogicApi.launchMacro(LaunchMacroRequest(macroId: macroId))
        let _: Request<ConfigResponse> = LogicApi.getConfig()
        let _: Request<ActiveAlertsResponse> = LogicApi.getActiveAlerts(
            ActiveAlertsRequest(cameraAp: cameraAp)
        )
        let _: Request<PagedResponse<BatchGetActiveAlertsResponse>> = LogicApi.batchGetActiveAlerts()
        let _: Request<RaiseAlertResponse> = LogicApi.raiseAlert(RaiseAlertRequest(cameraAp: cameraAp))
        let _: Request<AlertReviewResultResponse> = LogicApi.completeAlertReview(
            CompleteAlertReviewRequest(cameraAp: cameraAp, alertId: alertId, severity: .falseAlarm)
        )
    }
}
