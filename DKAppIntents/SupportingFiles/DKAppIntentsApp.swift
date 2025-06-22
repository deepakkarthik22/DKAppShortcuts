import SwiftUI
import CoreSpotlight
import AppIntents
import Intents

@main
struct DKAppIntentsApp: App {
    init() {
        let handler = DKShortcutsHandler(entityManager: DKAppEntityManager.shared)
        handler.initializeShortcuts()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
