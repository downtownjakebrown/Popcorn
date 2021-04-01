//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

extension View {
    
    /// Adds a clipping mask to your view, with optionally rounded corners.
    /// - Parameters:
    ///   - radius: The radius of the corner.
    ///   - corners: The corners to be rounded.
    /// - Returns: The modified view.
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(
            content: self,
            modifier: CornerRadiusStyle(radius: radius, corners: corners)
        )
    }
    
}
