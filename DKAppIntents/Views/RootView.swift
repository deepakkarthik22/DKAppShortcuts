import SwiftUI

struct RootView: View {
    @StateObject private var deepLinkManager = DeepLinkManager.shared
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ContentView()
                .navigationDestination(for: DeepLinkDestination.self) { destination in
                    ColorView(
                        color: destination == .red ? .red :
                               destination == .blue ? .blue : .green,
                        title: "\(destination.rawValue.capitalized) View"
                    )
                }
        }
        .environmentObject(deepLinkManager)
        .onChange(of: deepLinkManager.destination) { newValue in
            if let dest = newValue {
                path.append(dest)
            }
        }
        .onAppear {
            deepLinkManager.loadPendingDeepLink()
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
