//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerElementMessage: View {
    
    @Binding var expandBanner: Bool
    let messageText: String
    let messageTextColor: Color
    
    @State private var messageAreaWidth: CGFloat = 0
    private let collapsedLineLimit: Int = 3
    private let expandedLineLimit: Int = 100
    
    private let fontSize: CGFloat = 14
    private var messageTextFont: Font {
        Font.system(size: fontSize, weight: .regular)
    }
    private var messageTextUIFont: UIFont {
        UIFont.systemFont(ofSize: fontSize, weight: .regular)
    }
    
    var body: some View {
        HStack() {
            Text(messageText + "\n")
            .fixedSize(horizontal: false, vertical: true)
            .font(messageTextFont)
            .foregroundColor(messageTextColor)
            .multilineTextAlignment(.leading)
            .lineLimit((expandBanner ? expandedLineLimit : collapsedLineLimit + 1))
            .border(Color.black)
                
            Spacer(minLength: 0)
        }
        .background(WidthGetter(width: $messageAreaWidth))
        .frame(height: getHeight(for: (expandBanner ? expandedLineLimit : collapsedLineLimit)), alignment: .top)
        .border(Color.red)
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
        label.font = messageTextUIFont
        label.text = messageText
        label.sizeToFit()
        return label.frame.height
   }
    
}


