//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementTopSpacer: View {
    var body: some View {
        Rectangle()
        .fill(Color.clear)
        .frame(height: Device.topSafeArea)
    }
}
