import Foundation

final class HSShortcutsHandler {
    private let entityManager: DKAppEntityManagerProtocol

    init(entityManager: DKAppEntityManagerProtocol) {
        self.entityManager = entityManager
    }

    func initializeShortcuts() {
        if let saved = UserDefaults.standard.array(forKey: DKConstants.shortcutsKey) as? [[String: Any]], !saved.isEmpty {
            entityManager.update(models: DKAppEntityManager.decodeModels(from: saved))
        } else {
            let models = DKConstants.defaultShortcutNames.map {
                DKAppIntentModel(name: $0, imageIdentifier: $0.lowercased())
            }
            entityManager.update(models: models)
        }
    }
}
