//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// The style of the app's popups
public struct PopcornStyle {
    
    let corners: PopcornCornerStyle
    let colors: PopcornColorScheme
    
    /// The style of the app's popups
    /// - Parameters:
    ///   - corners: The corner style of the app's popups
    ///   - colors: The colors used by the app's popups
    public init(
        corners: PopcornCornerStyle = .rounded,
        colors: PopcornColorScheme = PopcornColorScheme()
    ) {
        self.corners = corners
        self.colors = colors
    }
    
}

/// The corner style of the app's popup
public enum PopcornCornerStyle {
    case square
    case rounded
    case capsule
}

/// The colors used by the app's popups
public struct PopcornColorScheme {
    
    let fillColor: Color
    let backgroundColor: Color
    let buttonColorPrimary: Color
    let buttonColorSecondary: Color
    let textColor: Color
    let buttonTextColor: Color
    
    /// The colors used by the app's popups
    /// - Parameters:
    ///   - fillColor: The color of the popup sheet
    ///   - backgroundColor: The color of the background behind the popup
    ///   - buttonColorPrimary: The color of the primary button
    ///   - buttonColorSecondary: The color of the secondary button
    ///   - textColor: The color of both the headline text and body text (if used)
    ///   - buttonTextColor: The color of the label text of any buttons
    public init(
        fillColor: Color = .white,
        textColor: Color = .black,
        buttonColorPrimary: Color = .blue,
        buttonColorSecondary: Color = .red,
        buttonTextColor: Color = .white,
        backgroundColor: Color = Color.black.opacity(0.3)
    ) {
        self.fillColor = fillColor
        self.backgroundColor = backgroundColor
        self.buttonColorPrimary = buttonColorPrimary
        self.buttonColorSecondary = buttonColorSecondary
        self.textColor = textColor
        self.buttonTextColor = buttonTextColor
    }
    
}
