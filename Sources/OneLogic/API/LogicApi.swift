import Foundation
import RequestResponse

/// Logic Service API (Native BL `v1/logic_service/*`).
///
/// Source: `LogicService.proto` (`LogicService`).
public enum LogicApi {
    // MARK: - Macros

    /// Endpoint: `GET /v1/logic_service/macros`
    ///
    /// Loads the full macro catalog (no server-side `query` filter). Paginate with `pageToken` until `next_page_token` is empty.
    public static func listMacros(
        view: MacroViewMode = .stripped,
        pageToken: String? = nil,
        pageSize: Int? = nil
    ) -> Request<ListMacrosResponse> {
        var query: [(String, String?)] = [("view", view.rawValue)]
        if let pageToken, !pageToken.isEmpty {
            query.append(("page_token", pageToken))
        }
        if let pageSize {
            query.append(("page_size", String(pageSize)))
        }
        return Request(
            path: "v1/logic_service/macros",
            method: .get,
            query: query
        )
    }

    /// Endpoint: `POST /v1/logic_service/macros:launch`
    public static func launchMacro(_ body: LaunchMacroRequest) -> Request<Void> {
        Request(
            path: "v1/logic_service/macros:launch",
            method: .post,
            body: body
        )
    }

    // MARK: - Arm state

    /// Endpoint: `POST /v1/logic_service/armstate`
    public static func changeArmState(_ body: ChangeArmStateRequest) -> Request<Void> {
        Request(
            path: "v1/logic_service/armstate",
            method: .post,
            body: body
        )
    }

    // MARK: - Config

    /// Endpoint: `GET /v1/logic_service/config`
    public static func getConfig() -> Request<ConfigResponse> {
        Request(path: "v1/logic_service/config", method: .get)
    }

    // MARK: - Active alerts

    /// Endpoint: `POST /v1/logic_service/getactivealerts`
    public static func getActiveAlerts(_ body: ActiveAlertsRequest) -> Request<ActiveAlertsResponse> {
        Request(
            path: "v1/logic_service/getactivealerts",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/batchgetactivealerts`
    ///
    /// Response is SSE (`text/event-stream`) or legacy `multipart/related`. Use `HTTPClient.pages`, not `send`.
    public static func batchGetActiveAlerts(
        _ body: BatchGetActiveAlertsRequest = BatchGetActiveAlertsRequest()
    ) -> Request<PagedResponse<BatchGetActiveAlertsResponse>> {
        Request(
            path: "v1/logic_service/batchgetactivealerts",
            method: .post,
            body: body
        )
    }

    // MARK: - Batch alert review

    /// Endpoint: `POST /v1/logic_service/batchbeginalertsreview`
    public static func batchBeginAlertsReview(
        _ body: BatchBeginAlertsReviewRequest
    ) -> Request<PagedResponse<BatchBeginAlertsReviewResponse>> {
        Request(
            path: "v1/logic_service/batchbeginalertsreview",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/batchcontinuealertsreview`
    public static func batchContinueAlertsReview(
        _ body: BatchContinueAlertsReviewRequest
    ) -> Request<PagedResponse<BatchContinueAlertsReviewResponse>> {
        Request(
            path: "v1/logic_service/batchcontinuealertsreview",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/batchcancelalertsreview`
    public static func batchCancelAlertsReview(
        _ body: BatchCancelAlertsReviewRequest
    ) -> Request<PagedResponse<BatchCancelAlertsReviewResponse>> {
        Request(
            path: "v1/logic_service/batchcancelalertsreview",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/batchcompletealertsreview`
    public static func batchCompleteAlertsReview(
        _ body: BatchCompleteAlertsReviewRequest
    ) -> Request<PagedResponse<BatchCompleteAlertsReviewResponse>> {
        Request(
            path: "v1/logic_service/batchcompletealertsreview",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/batchescalatealerts`
    public static func batchEscalateAlerts(
        _ body: BatchEscalateAlertsRequest
    ) -> Request<PagedResponse<BatchEscalateAlertsResponse>> {
        Request(
            path: "v1/logic_service/batchescalatealerts",
            method: .post,
            body: body
        )
    }

    // MARK: - Single alert review

    /// Endpoint: `POST /v1/logic_service/raisealert`
    public static func raiseAlert(_ body: RaiseAlertRequest) -> Request<RaiseAlertResponse> {
        Request(
            path: "v1/logic_service/raisealert",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/beginalert`
    public static func beginAlertReview(_ body: BeginAlertReviewRequest) -> Request<AlertReviewResultResponse> {
        Request(
            path: "v1/logic_service/beginalert",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/cancelalert`
    public static func cancelAlertReview(_ body: CancelAlertReviewRequest) -> Request<AlertReviewResultResponse> {
        Request(
            path: "v1/logic_service/cancelalert",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/continuealert`
    public static func continueAlertReview(_ body: ContinueAlertReviewRequest) -> Request<AlertReviewResultResponse> {
        Request(
            path: "v1/logic_service/continuealert",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/completealert`
    public static func completeAlertReview(_ body: CompleteAlertReviewRequest) -> Request<AlertReviewResultResponse> {
        Request(
            path: "v1/logic_service/completealert",
            method: .post,
            body: body
        )
    }

    /// Endpoint: `POST /v1/logic_service/escalatealert`
    public static func escalateAlert(_ body: EscalateAlertRequest) -> Request<AlertReviewResultResponse> {
        Request(
            path: "v1/logic_service/escalatealert",
            method: .post,
            body: body
        )
    }
}
