//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

extension View {
    
    /// Helper to hide software keyboard if shown on screen.
    func hideKeyboard() {
        
        UIApplication.shared
        .sendAction(#selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
        
    }

    /// A view modifier for responding to keyboard show and hide events.
    /// - Parameters:
    ///   - onShow: A closure executed when the keyboard shows
    ///   - onHide: A closure executed when the keyboard hides
    /// - Returns: The modified view
    func keyboardObserver(
        onShow: @escaping (Notification) -> Void,
        onHide: @escaping (Notification) -> Void
    ) -> some View {
        
        self.onAppear(perform: {
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillShowNotification,
                object: nil, queue: .main
            ) { key in
                onShow(key)
            }
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillHideNotification,
                object: nil, queue: .main
            ) { key in
                onHide(key)
            }
        })
        
    }
    
}
