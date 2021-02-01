import SwiftUI

struct LoginViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        // For better and clean code
        return content
            .padding()
            .padding(.bottom,25)
            .background(Color.white)
            .cornerRadius(25)
            .padding(.vertical)
            .padding(.bottom)
            .padding(.horizontal,25)
    }
}
