import Foundation

protocol DKAppEntityManagerProtocol {
    var appIntentModels: [DKAppIntentModel] { get }
    func update(models: [DKAppIntentModel])
    func findIntent(with id: UUID) -> DKAppIntentModel?
}
