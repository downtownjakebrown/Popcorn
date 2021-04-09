//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

public extension View {

    /// A view modifier to add your popcorn popups to your view hierarchy.
    /// - Parameter packet: A container for your app's popups.
    /// - Returns: A view modified to include your apps popups.
    func popcornMaker<Content>(_ packet: PopcornPacket<Content>) -> some View {
        self.modifier(PopcornPopupsModifier(popcorn: Popcorn(packet)))
    }
    
    func popcornStyle(fillColor: Color) -> some View {
        self.modifier(PopcornStyleModifier(fillColor: fillColor))
    }
    
}

struct PopcornStyleModifier: ViewModifier {
    
    let fillColor: Color
    
    @EnvironmentObject var popcorn: Popcorn
    
    func body(content: Content) -> some View {
        content.environmentObject(PopcornStyle(fillColor: fillColor))
    }
    
}

class PopcornStyle: ObservableObject {
    
    let fillColor: Color
    
    init(fillColor: Color) {
        self.fillColor = fillColor
    }
    
}
