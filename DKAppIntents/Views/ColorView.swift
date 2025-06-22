import SwiftUI

struct ColorView: View {
    let color: Color
    let title: String

    var body: some View {
        color
            .ignoresSafeArea(edges: .bottom)
            .overlay(
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            )
    }
}
