import Foundation
import Combine

import SwiftUI

@MainActor
final class DeepLinkManager: ObservableObject {
    static let shared = DeepLinkManager()

    @Published var destination: DeepLinkDestination?

    @AppStorage("pendingDeepLink") private var pendingDeepLink: String?

    func handleDeepLink(_ link: DeepLinkDestination) {
        destination = link
        pendingDeepLink = link.rawValue.lowercased()
    }

    func handleIdentifier(_ identifier: String) {
        guard let destination = DeepLinkDestination(rawValue: identifier.lowercased()) else { return }
        handleDeepLink(destination)
    }

    func loadPendingDeepLink() {
        if let raw = pendingDeepLink,
           let destination = DeepLinkDestination(rawValue: raw.lowercased()) {
            self.destination = destination
            pendingDeepLink = nil
        }
    }

    func clear() {
        destination = nil
        pendingDeepLink = nil
    }
}
