//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementHeadline: View {
    
    let headlineText: String
    let headlineTextColor: Color
    
    private let headlineTextFont = Font.system(size: 14, weight: .bold)
    
    var body: some View {
        HStack {
            Text(headlineText)
            .font(headlineTextFont)
            .foregroundColor(headlineTextColor)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            Spacer()
        }
    }
}
