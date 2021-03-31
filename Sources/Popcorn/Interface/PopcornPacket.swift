//
// See LICENSE file for this package’s licensing information.
//

import Foundation

/// A container for popcorn popups.
public struct PopcornPacket<Content: PopcornProtocol> {
    
    /// The app's popups.
    let popups: Content
    
    /// A container for popcorn popups.
    /// - Parameters:
    ///   - popups: The app's popups.
    public init(@PopcornBuilder popups: () -> Content) {
        self.popups = popups()
    }
    
}
