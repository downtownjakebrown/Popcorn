//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// <#Description#>
@_functionBuilder public struct PopcornBuilder {

    /// ...
    public static func buildBlock<C0,C1,C2>(
        _ c0:C0, _ c1:C1, _ c2:C2
    ) -> PopcornPopups where C0:View,C1:View,C2:View {
        PopcornPopups(
            names: [C0.self,      C1.self,      C2.self     ],
            types: [C0.Body.self, C1.Body.self, C2.Body.self],
            views: [AnyView(c0),  AnyView(c1),  AnyView(c2) ]
        )
    }
    
    /// ...
    public static func buildBlock<C0,C1,C2,C3>(
        _ c0:C0, _ c1:C1, _ c2:C2, _ c3:C3
    ) -> PopcornPopups where C0:View,C1:View,C2:View,C3:View{
        PopcornPopups(
            names: [C0.self, C1.self, C2.self, C3.self],
            types: [C0.Body.self, C1.Body.self, C2.Body.self, C3.Body.self],
            views: [AnyView(c0), AnyView(c1), AnyView(c2), AnyView(c3)]
        )
    }

}
