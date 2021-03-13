//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementHeader: View {
    
    let headerImage: AnyView?
    let headerTextLeft: String
    let headerTextRight: String
    let headerTextColor: Color
    
    private let headerTextFont = Font.system(size: 12, weight: .medium)

    var body: some View {
        HStack {
            if headerImage != nil {
                headerImage
                .frame(width: 20, height: 20)
            }
            if headerTextLeft != "" {
                Text(headerTextLeft)
                .font(headerTextFont)
                .foregroundColor(headerTextColor)
            }
            Spacer()
            if headerTextRight != "" {
                Text(headerTextRight)
                .font(headerTextFont)
                .foregroundColor(headerTextColor)
            }
        }
        
    }
}


