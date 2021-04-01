//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementBackdrop<BannerFill>: View where BannerFill: ShapeStyle {

    @EnvironmentObject var popcorn: Popcorn
    
    let bannerFill: BannerFill
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: 15,
            style: .continuous
        )
        .fill(bannerFill)
        .shadow(radius: 5)
    }
    
}
