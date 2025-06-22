import SwiftUI
import CoreSpotlight
import AppIntents
import Intents

@main
struct DKAppIntentsApp: App {
    init() {
        let handler = HSShortcutsHandler(entityManager: DKAppEntityManager.shared)
        handler.initializeShortcuts()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
