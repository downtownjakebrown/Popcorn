//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

extension AnyTransition {
    
    /// A transition the popup background.
    static let popupBackgroundStyle = AnyTransition.opacity
    /// A transition for prompts.
    static let promptStyle = AnyTransition.slideToEdge(insertion: .bottom, removal: .bottom)
    /// A transition for banners.
    static let bannerStyle = AnyTransition.slideToEdge(insertion: .top, removal: .top)
    
    private enum MoveDirection {
        case leading
        case trailing
        case top
        case bottom
    }
    
    private static func slideToEdge(
        insertion: MoveDirection? = .leading,
        removal: MoveDirection? = .trailing
    ) -> AnyTransition {
        return AnyTransition.asymmetric(
            insertion: createMoveTransition(insertion!),
            removal: createMoveTransition(removal!)
        )
    }

    private static func createMoveTransition(
        _ direction: MoveDirection
    ) -> AnyTransition {
        switch direction {
            case .leading:  return AnyTransition.move(edge: .leading)
            case .trailing: return AnyTransition.move(edge: .trailing)
            case .top:      return AnyTransition.move(edge: .top)
            case .bottom:   return AnyTransition.move(edge: .bottom)
        }
    }
    
}
