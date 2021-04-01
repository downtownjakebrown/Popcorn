//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementHeader<HeaderImage>: View where HeaderImage: View {
    
    let headerImage: HeaderImage
    let headerTextLeft: String
    let headerTextRight: String
    let headerTextColor: Color

    var body: some View {
        HStack {
            
            headerImage.frame(width: 15, height: 15)
            
            if headerTextLeft != "" {
                Text(headerTextLeft)
                .font(Font.system(size: 12, weight: .medium))
                .foregroundColor(headerTextColor)
                .offset(y: 2)
            }
            Spacer()
            if headerTextRight != "" {
                Text(headerTextRight)
                .font(Font.system(size: 12, weight: .medium))
                .foregroundColor(headerTextColor)
                .offset(y: 2)
            }
        }
        
    }
}


