//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementMessage: View {
    
    let bannerExpanded: Bool
    let bodyText: String
    let bodyTextColor: Color
    
    @State private var messageAreaWidth: CGFloat = 0
    private let collapsedLineLimit: Int = 3
    private let expandedLineLimit: Int = 10
    
    var body: some View {
        HStack() {
            Text(bodyText + "\n")
            .fixedSize(horizontal: false, vertical: true)
            .font(.popcornBody)
            .foregroundColor(bodyTextColor)
            .multilineTextAlignment(.leading)
            .lineLimit((bannerExpanded ? expandedLineLimit : collapsedLineLimit + 1))
                
            Spacer(minLength: 0)
        }
        .background(WidthGetter(width: $messageAreaWidth))
        .frame(height: getHeight(for: (bannerExpanded ? expandedLineLimit : collapsedLineLimit)), alignment: .top)
        .clipped()
    }
    
    private func getHeight(for lines: Int) -> CGFloat {
        let frame = CGRect(
            x: 0, y: 0,
            width: messageAreaWidth,
            height: CGFloat.greatestFiniteMagnitude
        )
        let label: UILabel = UILabel(frame: frame)
        label.numberOfLines = lines
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = Font.popcornBodyUIFont
        label.text = bodyText
        label.sizeToFit()
        return label.frame.height
   }
    
}


