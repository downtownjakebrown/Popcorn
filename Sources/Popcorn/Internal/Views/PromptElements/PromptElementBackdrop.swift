//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupElementBackdrop<BackgroundFill>: View where BackgroundFill: ShapeStyle {

    @EnvironmentObject var popcorn: Popcorn
    
    let backgroundFill: BackgroundFill
    let cornerStyle: PopcornCornerStyle
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: cornerRadius,
            style: .continuous
        )
        .fill(backgroundFill)
        .shadow(radius: 5)
    }
    
    var cornerRadius: CGFloat {
        switch cornerStyle {
            case .squared: return 0
            case .rounded: return 10
            case .capsule: return 30
        }
    }
    
}
