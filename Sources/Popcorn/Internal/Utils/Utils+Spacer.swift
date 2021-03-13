//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

extension View {
    ///
    /// Adds a spacer to a specified edge of a view.
    ///
    /// This view-modifying function adds a spacer *extending from* the specified edge of the view. For example, an edge parameter of .bottom moves the view toward the top edge of the parent view, and an edge parameter of .leading moves the view toward the trailing edge of the parent view. This function is for convenience, and simply wraps the view in either an HStack or VStack with a Spacer. See the below example, where blocks 1 and 2 are equivalent.
    ///
    /// ```
    /// // 1.
    /// HStack {
    ///     Text("Hello World")
    ///     Spacer()
    /// }
    ///
    /// // 2.
    /// Text("Hello World").addSpacer(.trailing)
    /// ```
    ///
    /// - Parameters:
    ///   - edge: The edge from which the spacer will extend.
    ///   - minLength: The minimum length of the spacer.
    ///
    /// - Returns: A view with a spacer extending from the specified edge.
    ///
    func addSpacer(_ edge: Edge, _ minLength: CGFloat? = nil) -> some View {
        self.modifier(AddSpacerModifier(edge: edge, minLength: minLength))
    }
}

fileprivate struct AddSpacerModifier: ViewModifier {
    let edge: Edge
    let minLength: CGFloat?
    func body(content: Content) -> some View {
        Group {
            switch edge {
                case .top:
                VStack(spacing: 0) {
                    Spacer(minLength: minLength)
                    content
                }
                case .leading:
                HStack(spacing: 0) {
                    Spacer(minLength: minLength)
                    content
                }
                case .bottom:
                VStack(spacing: 0) {
                    content
                    Spacer(minLength: minLength)
                }
                case .trailing:
                HStack(spacing: 0) {
                    content
                    Spacer(minLength: minLength)
                }
            }
        }
    }
}
