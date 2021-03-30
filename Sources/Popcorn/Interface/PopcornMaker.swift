//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

public extension View {

    /// A view modifier to add your popcorn popups to your view hierarchy.
    /// - Parameter popcornBucket: A container for your app's popups.
    /// - Returns: A view modified to include your apps popups.
    func popcornMaker<Content>(
        _ packet: PopcornPacket<Content>,
        with seasoning: PopcornSeasoning = PopcornSeasoning()
    ) -> some View {
        self.modifier(PopcornPopupsModifier(
            popcorn: Popcorn(packet, seasoning)
        ))
    }
    
}
