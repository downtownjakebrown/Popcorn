//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementBackdrop: View {

    @EnvironmentObject var popcorn: Popcorn
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: 15,
            style: .continuous
        )
        .fill(Color.white)
        .shadow(radius: 5)
    }
    
}
