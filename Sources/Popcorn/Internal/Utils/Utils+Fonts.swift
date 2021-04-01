//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

extension Font {
    
    static let popcornHeader = Font.system(
        size: 21,
        weight: .bold,
        design: .rounded
    )
    
    static let popcornBodyBold = Font.system(
        size: 15,
        weight: .bold,
        design: .rounded
    )
    
    static let popcornBody = Font.system(
        size: 15,
        weight: .regular,
        design: .rounded
    )
    
    static var popcornBodyUIFont: UIFont {
        let systemFont = UIFont.systemFont(ofSize: 15, weight: .regular)
        let font: UIFont
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: 15)
        } else {
            font = systemFont
        }
        return font
    }

    static let popcornButton = Font.system(
        size: 18,
        weight: .bold,
        design: .rounded
    )
    
}
