//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupBackground: View {
    
    @EnvironmentObject var popcorn: Popcorn
    
    @State private var keyboardIsShown = false
    
    var body: some View {
        popcorn.popupStyle.colors.backgroundColor
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
