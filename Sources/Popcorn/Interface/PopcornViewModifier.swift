//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

public extension View {

    /// A view modifier to add your popcorn popups to your view hierarchy.
    /// - Parameter popcorn: Popcorn's main view model, which stores your apps popups, and coordinates their presentation.
    /// - Returns: A view modified to include your apps popups.
    func popcornObserver(_ popcorn: Popcorn) -> some View {
        self.modifier(PopcornPopupsModifier(popcorn: popcorn))
    }
    
}
