//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

protocol PopupProtocol {
    
    associatedtype PopupID: Hashable
    var name: Self.PopupID { get }
    
    associatedtype PopupView: View
    var view: Self.PopupView { get set }
    
}
