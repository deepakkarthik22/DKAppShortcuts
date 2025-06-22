import AppIntents

struct DKAppIntent: AppIntent {
    static let title: LocalizedStringResource = "DKAppIntents"
    static let openAppWhenRun = true

    @Parameter(title: "Navigate to page")
    var appEntity: DKAppEntity?

    func perform() async throws -> some IntentResult {
        if let name = appEntity?.model.name {
            await MainActor.run {
                DeepLinkManager.shared.handleIdentifier(name)
            }
        }
        return .result()
    }
}
