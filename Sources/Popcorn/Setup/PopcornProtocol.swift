//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A helper protocol for popcorn setup.
public protocol PopcornProtocol {
    var names: [Any.Type] { get }
    var types: [Any.Type] { get }
    var views: [AnyView]  { get }
}
