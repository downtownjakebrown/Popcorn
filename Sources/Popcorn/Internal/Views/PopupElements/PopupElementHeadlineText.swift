//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupElementHeadlineText: View {
    
    let text: String
    let color: Color
    let lineLimit: Int
    
    var body: some View {
        Text(text)
        .font(.headline)
        .multilineTextAlignment(.center)
        .lineLimit(lineLimit)
        .foregroundColor(color)
    }
    
}
