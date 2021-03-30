//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// <#Description#>
public struct PopcornPopups: PopcornProtocol {

    /// <#Description#>
    public let names: [Any.Type]
    /// <#Description#>
    public let types: [Any.Type]
    /// <#Description#>
    public let views: [AnyView]
    
    /// <#Description#>
    /// - Parameters:
    ///   - names: <#names description#>
    ///   - types: <#types description#>
    ///   - views: <#views description#>
    public init(
        names: [Any.Type],
        types: [Any.Type],
        views: [AnyView]
    ) {
        self.names = names
        self.types = types
        self.views = views
    }

}
