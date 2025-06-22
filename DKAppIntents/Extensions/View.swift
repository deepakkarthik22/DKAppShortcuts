import SwiftUI

// MARK: - Reusable Button Style
extension View {
    func buttonStyle() -> some View {
        self
            .frame(width: 200, height: 50)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .foregroundColor(.black)
            .font(.headline)
    }
}

