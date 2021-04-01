//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A container for popcorn popups.
public struct PopcornBucket: PopcornProtocol {

    /// The names (their types) used to reference the popups
    public let names: [Any.Type]
    /// The underlying types of each popup view body
    public let types: [Any.Type]
    /// The popup views, converted to AnyViews
    public let views: [AnyView]
    
    /// A container for popcorn popups.
    /// - Parameters:
    ///   - names: The names (their types) used to reference the popups
    ///   - types: The underlying types of each popup view body
    ///   - views: The popup views, converted to AnyViews
    init(
        names: [Any.Type],
        types: [Any.Type],
        views: [AnyView]
    ) {
        self.names = names
        self.types = types
        self.views = views
    }

}
