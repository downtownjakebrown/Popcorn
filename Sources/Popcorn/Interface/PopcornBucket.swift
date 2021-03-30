//
// See LICENSE file for this package’s licensing information.
//

import Foundation

/// <#Description#>
public struct PopcornBucket<Content: PopcornProtocol> {
    
    /// <#Description#>
    let popups: Content
    
    /// <#Description#>
    /// - Parameter popups: <#popups description#>
    public init(@PopcornBuilder popups: () -> Content) {
        self.popups = popups()
    }
    
}
