import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Red") {
                DeepLinkManager.shared.handleDeepLink(.red)
            }
            .buttonStyle()

            Button("Green") {
                DeepLinkManager.shared.handleDeepLink(.green)
            }
            .buttonStyle()

            Button("Blue") {
                DeepLinkManager.shared.handleDeepLink(.blue)
            }
            .buttonStyle()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationTitle("Select Color")
    }
}
