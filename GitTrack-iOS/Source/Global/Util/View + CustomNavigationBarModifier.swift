import SwiftUI

extension View {
    func setCustomNavigationBarTitle(
        _ title: String
    ) -> some View {
        modifier(
            CustomNavigationBarViewModifier(title: title)
        )
    }
}
