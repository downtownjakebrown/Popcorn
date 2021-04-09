//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI
import Combine

/// Popcorn's main view model, which stores your apps popups and coordinates their presentation.
public class Popcorn: ObservableObject {
    
    /// The prompt views
    var promptViews = [AnyView]()
    /// The names (the view name/type) for reference to the prompt views
    var promptNames = [Any.Type]()
    
    /// The banner views
    var bannerViews = [AnyView]()
    /// The names (the view name/type) for reference to the banner views
    var bannerNames = [Any.Type]()
    
    /// Delay time between sequential popups
    let delayAmount: TimeInterval = 0.5
    
    /// Popcorn's main view model, which stores your apps popups and coordinates their presentation.
    /// - Parameter popups: The app's popups.
    init<Content>(
        _ popups: PopcornPacket<Content>
    ){
        
        // Holders for any prompts
        var promptViews = [AnyView]()
        var promptNames = [Any.Type]()
        
        // Holders for any banners
        var bannerViews = [AnyView]()
        var bannerNames = [Any.Type]()
        
        for i in 0..<popups.popups.views.count {

            let popupFormat: PopupFormat

            let typeString = String(describing: popups.popups.types[i])
            
            if typeString.hasPrefix("PopcornButtonsPrompt<") {
                popupFormat = .prompt
            } else if typeString.hasPrefix("PopcornGetTextPrompt<") {
                popupFormat = .prompt
            } else if typeString.hasPrefix("PopcornMessagePrompt<") {
                popupFormat = .prompt
            } else if typeString.hasPrefix("PopcornMessageBanner<") {
                popupFormat = .banner
            } else {
                print("Could not add popcorn popup \"\(popups.popups.names[i])\" because its body type does not match a valid popcorn popup type.")
                continue
            }

            if popupFormat == .prompt {
                promptViews.append(popups.popups.views[i])
                promptNames.append(popups.popups.names[i])
            } else if popupFormat == .banner {
                bannerViews.append(popups.popups.views[i])
                bannerNames.append(popups.popups.names[i])
            }

        }

        self.promptViews = promptViews
        self.promptNames = promptNames

        self.bannerViews = bannerViews
        self.bannerNames = bannerNames
        
    }
    
    /// Notifies subscribers of changes
    public let objectWillChange = PassthroughSubject<Popcorn,Never>()

    /// Holds value of the current popup to be shown
    public var currentPopup: Any.Type? = nil {
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
    public var currentBanner: Any.Type? = nil {
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

