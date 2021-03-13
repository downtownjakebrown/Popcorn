//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A container for your popup, including a popup view and a name used to reference the popup.
public struct PopcornPopup: PopupProtocol {
    
    /// The name used to reference the popup
    var name: AnyHashable?
    
    /// The popup view
    var view: AnyView?
    
    /// The format of the popup (e.g., prompt, banner, etc.)
    var popupFormat: PopupFormat?
    
    /// A container for your popup, including a popup view and a name used to reference the popup.
    /// - Parameters:
    ///   - name: The name used to reference the popup
    ///   - view: The popup view
    public init<Name: Hashable, Content: View>(name: Name, view: Content) {
        
        switch Content.Body.self {
        
            case is PopcornButtonsPrompt.Type: self.popupFormat = .prompt
            case is PopcornGetTextPrompt.Type: self.popupFormat = .prompt
            case is PopcornMessagePrompt.Type: self.popupFormat = .prompt
            case is PopcornBannerToast.Type:   self.popupFormat = .banner
                
            default: print(
                "Could not add popcorn popup \"\(Content.self)\" " +
                "because its body type does not match a valid " +
                "popcorn popup type."
            )
            return
                
        }
    
        self.name = name
        self.view = AnyView(view)
        
    }
    
}
