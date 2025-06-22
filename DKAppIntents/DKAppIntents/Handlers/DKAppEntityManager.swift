import Foundation

final class DKAppEntityManager: DKAppEntityManagerProtocol {
    static let shared = DKAppEntityManager()

    private(set) var appIntentModels: [DKAppIntentModel] = [] {
        didSet {
            persistModels()
            DKAppShortcutsProvider.updateAppShortcutParameters()
        }
    }

    private init() {
        loadPersistedModels()
    }

    func update(models: [DKAppIntentModel]) {
        self.appIntentModels = models
    }

    func findIntent(with id: UUID) -> DKAppIntentModel? {
        appIntentModels.first { $0.id == id }
    }

    private func persistModels() {
        let encoded = appIntentModels.map {
            [
                DKConstants.identifierKey: $0.id.uuidString,
                DKConstants.nameKey: $0.name,
                DKConstants.imageKey: $0.imageIdentifier
            ]
        }
        UserDefaults.standard.set(encoded, forKey: DKConstants.shortcutsKey)
    }

    private func loadPersistedModels() {
        guard let saved = UserDefaults.standard.array(forKey: DKConstants.shortcutsKey) as? [[String: Any]] else { return }
        self.appIntentModels = Self.decodeModels(from: saved)
    }

    static func decodeModels(from array: [[String: Any]]) -> [DKAppIntentModel] {
        array.compactMap { dict in
            guard
                let idString = dict[DKConstants.identifierKey] as? String,
                let id = UUID(uuidString: idString),
                let name = dict[DKConstants.nameKey] as? String,
                let imageIdentifier = dict[DKConstants.imageKey] as? String
            else { return nil }
            return DKAppIntentModel(id: id, name: name, imageIdentifier: imageIdentifier)
        }
    }
}
