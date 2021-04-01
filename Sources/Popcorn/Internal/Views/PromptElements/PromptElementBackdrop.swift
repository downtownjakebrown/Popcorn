//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupElementBackdrop<BackgroundFill>: View where BackgroundFill: ShapeStyle {

    @EnvironmentObject var popcorn: Popcorn
    
    let backgroundFill: BackgroundFill
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: 25,
            style: .continuous
        )
        .fill(backgroundFill)
        .shadow(radius: 5)
    }
    
}
