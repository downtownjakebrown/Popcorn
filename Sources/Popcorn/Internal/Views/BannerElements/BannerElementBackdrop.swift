//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementBackdrop<BannerFill>: View where BannerFill: ShapeStyle {

    @EnvironmentObject var popcorn: Popcorn
    
    let bannerFill: BannerFill
    let cornerStyle: PopcornCornerStyle
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: cornerRadius,
            style: .continuous
        )
        .fill(bannerFill)
        .shadow(radius: 5)
    }
    
    var cornerRadius: CGFloat {
        switch cornerStyle {
            case .squared: return 0
            case .rounded: return 8
            case .capsule: return 15
        }
    }
    
}
