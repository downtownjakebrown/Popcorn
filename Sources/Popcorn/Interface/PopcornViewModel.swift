//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI
import Combine

/// Popcorn's main view model, which stores your apps popups, and coordinates their presentation.
public class Popcorn: ObservableObject {
    
    /// The popup views
    let popupViews: [AnyView]
    /// The names for reference to the popup views
    let popupNames: [AnyHashable]
    /// The banner views
    let bannerViews: [AnyView]
    /// The names for reference to the banner views
    let bannerNames: [AnyHashable]
    
    /// Delay time between sequential popups
    let delayAmount: TimeInterval = 0.5
    /// The style of the app's popups
    let popupStyle: PopcornStyle
    
    /// Popcorn's main view model, which stores your apps popups, and coordinates their presentation.
    /// - Parameters:
    ///   - popups: Your apps popups.
    ///   - style: The style of the app's popups.
    public init(
        with popups: [PopcornPopup],
        style: PopcornStyle = PopcornStyle()
    ) {
        
        // Loop thru popups, extract name and view, add to self
        var popupViews = [AnyView]()
        var popupNames = [AnyHashable]()
        var bannerViews = [AnyView]()
        var bannerNames = [AnyHashable]()
        
        for i in 0..<popups.count {
            
            if  let view = popups[i].view,
                let name = popups[i].name,
                let format = popups[i].popupFormat
            {
                if format == .prompt {
                    popupViews.append(view)
                    popupNames.append(name)
                } else if format == .banner {
                    bannerViews.append(view)
                    bannerNames.append(name)
                }
            }
            
        }
        
        self.popupViews = popupViews
        self.popupNames = popupNames
        self.bannerViews = bannerViews
        self.bannerNames = bannerNames
        
        // Handle app popups styling
        self.popupStyle = style
        
    }
    
    /// Notifies subscribers of changes
    public let objectWillChange = PassthroughSubject<Popcorn,Never>()

    /// Holds value of the current popup to be shown
    public var currentPopup: AnyHashable? = nil {
        willSet(newValue) {
            if currentPopup != nil && newValue != nil {
                // If transitioning between two popups,
                // delay the second one
                popupShouldShow = false
            } else {
                // If transition to or from none popups,
                // show immediately
                popupShouldShow = true
            }
            // Send an update to hide current popup
            // regardless of popupShouldShow value
            withAnimation(.spring()) {
                self.objectWillChange.send(self)
            }
        }
    }

    /// If the current popup should be shown or not (used internally for sequence timing)
    var popupShouldShow: Bool = true {
        didSet {
            if popupShouldShow == false {
                // If we're showing sequential popups,
                // add a delay between when the first
                // is hidden and the second is shown
                DispatchQueue.main.asyncAfter(deadline: .now() + delayAmount, execute: {
                    self.popupShouldShow = true
                })
            } else {
                // Send an update to show next popup
                withAnimation(.spring()) {
                    self.objectWillChange.send(self)
                }
            }
        }
    }
    
    /// To handle background tap events
    let backgroundWasTapped = ObservableObjectPublisher()
    
    /// Dismisses the current popup, if one is shown
    public func dismissCurrentPopup() {
        if currentPopup != nil {
            currentPopup = nil
        }
    }
    
    /// Holds value of the current banner to be shown
    public var currentBanner: AnyHashable? = nil {
        willSet(newValue) {
            if currentBanner != nil && newValue != nil {
                // If transitioning between two banners,
                // delay the second one
                bannerShouldShow = false
            } else {
                // If transition to or from no banner,
                // show immediately
                bannerShouldShow = true
            }
            // Send an update to hide current banner
            // regardless of popupShouldShow value
            withAnimation(.spring()) {
                self.objectWillChange.send(self)
            }
        }
    }
    
    /// If the current banner should be shown or not (used internally for sequence timing)
    var bannerShouldShow: Bool = true {
        didSet {
            if bannerShouldShow == false {
                // If we're showing sequential banners,
                // add a delay between when the first
                // is hidden and the second is shown
                DispatchQueue.main.asyncAfter(deadline: .now() + delayAmount, execute: {
                    self.bannerShouldShow = true
                })
            } else {
                // Send an update to show next banner
                withAnimation(.spring()) {
                    self.objectWillChange.send(self)
                }
            }
        }
    }
    
}
