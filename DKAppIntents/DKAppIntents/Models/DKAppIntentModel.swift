import Foundation

final class DKAppIntentModel: Identifiable, Equatable, Hashable, Sendable {
    let id: UUID
    let name: String
    let imageIdentifier: String

    init(id: UUID = UUID(), name: String, imageIdentifier: String) {
        self.id = id
        self.name = name
        self.imageIdentifier = imageIdentifier
    }

    static func == (lhs: DKAppIntentModel, rhs: DKAppIntentModel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
