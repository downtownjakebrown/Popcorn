//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupElementBackdrop: View {

    @EnvironmentObject var popcorn: Popcorn
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: cornerRadius,
            style: .continuous
        )
        .fill(popcorn.popupStyle.colors.fillColor)
        .shadow(radius: 5)
    }
    
    var cornerRadius: CGFloat {
        switch popcorn.popupStyle.corners {
            case .square:  return 0
            case .rounded: return 10
            case .capsule: return 25
        }
    }
    
}
