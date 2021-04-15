//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

extension CGFloat {
    
    /// A helper to non-uniformly change the value of a CGFloat, based on it's current value.
    /// - Parameter slowedIncrease: Sets the direction of decay.
    /// - Returns: A decayed value.
    func asymmetricallySlowed(slowedIncrease: Bool) -> CGFloat {
        var offset: CGFloat = 0.0
        if slowedIncrease {
            if self <= 0 {
                offset = self
            } else {
                offset = atan(0.01*self) * 35
            }
        } else {
            if self >= 0 {
                offset = self
            } else {
                offset = atan(0.01*self) * 35
            }
        }
        return offset
    }
    
}
