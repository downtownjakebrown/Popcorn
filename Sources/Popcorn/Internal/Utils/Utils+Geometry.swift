//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct WidthGetter: View {
    @Binding var width: CGFloat
    var body: some View {
        GeometryReader { geometry in
            Path().onAppear {
                self.width = geometry.size.width
            }
        }.frame(height: 1)
    }
}

struct Device {
    static var topSafeArea: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0
    }
}


