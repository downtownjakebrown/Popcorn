//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupBackground: View {
    
    @EnvironmentObject var popcorn: Popcorn
    
    @State private var keyboardIsShown = false
    
    var body: some View {
        Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3))
        .edgesIgnoringSafeArea(.all)
        .transition(.opacity)
        .keyboardObserver(
            onShow: { _ in
                self.keyboardIsShown = true
            },
            onHide: { _ in
                self.keyboardIsShown = false
            }
        )
        .onTapGesture {
            if self.keyboardIsShown {
                self.hideKeyboard()
            } else {
                self.popcorn.backgroundWasTapped.send()
            }
        }
    }
    
}
