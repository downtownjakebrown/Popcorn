//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupElementDividerLine: View {
    
    private let color: Color
    
    init(_ color: Color? = .gray) {
        self.color = color!
    }
    
    var body: some View {
        Divider().overlay(color)
    }
    
}
