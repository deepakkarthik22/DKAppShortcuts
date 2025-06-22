import AppIntents

struct DKAppEntity: AppEntity, Identifiable {
    var model: DKAppIntentModel
    var id: UUID { model.id }

    static var defaultQuery = DKDefaultEntityQuery()

    static var typeDisplayRepresentation: TypeDisplayRepresentation = "DKAppEntity"

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: "\(model.name)",
            image: .init(named: model.imageIdentifier)
        )
    }
}

struct DKDefaultEntityQuery: EntityQuery {
    func entities(for identifiers: [UUID]) async throws -> [DKAppEntity] {
        identifiers.compactMap {
            guard let model = DKAppEntityManager.shared.findIntent(with: $0) else { return nil }
            return DKAppEntity(model: model)
        }
    }

    func suggestedEntities() async throws -> [DKAppEntity] {
        DKAppEntityManager.shared.appIntentModels.map {
            DKAppEntity(model: $0)
        }
    }
}
