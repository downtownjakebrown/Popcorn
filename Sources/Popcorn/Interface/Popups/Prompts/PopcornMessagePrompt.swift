//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A popup prompt for displaying a short message.
public struct PopcornMessagePrompt<HeaderImage, ButtonFill, BackgroundFill>: View where HeaderImage: View, ButtonFill: ShapeStyle, BackgroundFill: ShapeStyle {
    
    // Environmental view model
    @EnvironmentObject var popcorn: Popcorn
    
    // Header
    private let headerImage: HeaderImage
    private let headerText: String
    private let headerTextColor: Color
    
    // Body
    private let bodyText: String
    private let bodyTextColor: Color
    
    // Button
    private let buttonText: String
    private let buttonTextColor: Color
    private let buttonFill: ButtonFill
    private let buttonLoading: Bool
    private let buttonAction: () -> Void
    
    // Drag Gesture
    private let dragEnabled: Bool
    private let dragDismissAction: () -> Void
    
    // Background
    private let backgroundFill: BackgroundFill
    private let backgroundTapAction: () -> Void
    
    /// A popup prompt for displaying a short message.
    /// - Parameters:
    ///   - headerImage: The illustrated content at the top of the prompt.
    ///   - headerText: The header message text.
    ///   - headerTextColor: The color of the header message text.
    ///
    ///   - bodyText: The body message text.
    ///   - bodyTextColor: The color of the body message text.
    ///
    ///   - buttonText: The button label text.
    ///   - buttonTextColor: The color of the button label text.
    ///   - buttonFill: The button's fill style.
    ///   - buttonLoading: The loading state of the button. If true, the button is disabled and an activity icon is shown.
    ///   - buttonAction: A closure exectued when the button is tapped.
    ///
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
    ///
    ///   - backgroundFill: The background fill style.
    ///   - backgroundTapAction: A closure executed when the background surrounding the popup is tapped.
    public init(
        
        headerImage: HeaderImage,
        headerText: String,
        headerTextColor: Color,
        
        bodyText: String,
        bodyTextColor: Color,
        
        buttonText: String,
        buttonTextColor: Color,
        buttonFill: ButtonFill,
        buttonLoading: Bool,
        buttonAction: @escaping () -> Void,
        
        dragEnabled: Bool,
        dragDismissAction: @escaping () -> Void,
        
        backgroundFill: BackgroundFill,
        backgroundTapAction: @escaping () -> Void
        
    ) {
        
        self.headerImage = headerImage
        self.headerText = headerText
        self.headerTextColor = headerTextColor
        
        self.bodyText = bodyText
        self.bodyTextColor = bodyTextColor
        
        self.buttonText = buttonText
        self.buttonTextColor = buttonTextColor
        self.buttonFill = buttonFill
        self.buttonLoading = buttonLoading
        self.buttonAction = buttonAction
        
        self.dragEnabled = dragEnabled
        self.dragDismissAction = dragDismissAction
        
        self.backgroundFill = backgroundFill
        self.backgroundTapAction = backgroundTapAction
        
    }
    
    // View Body
    public var body: some View {
        PopupContainer(
            backgroundFill: backgroundFill,
            dragEnabled: dragEnabled,
            dragDismissAction: dragDismissAction,
            backgroundTapAction: backgroundTapAction
        ) {
            popupContentBuilder
        }
    }
    
    // Convenience Content Builder
    private var popupContentBuilder: some View {
        
        VStack(spacing: 25) {

            headerImage.frame(height: 90)
            
            VStack(spacing: 15) {
                
                PopupElementHeadlineText(
                    text: headerText,
                    color: headerTextColor,
                    lineLimit: 4
                )
                
                PopupElementBodyText(
                    text: bodyText,
                    color: bodyTextColor,
                    lineLimit: 4
                )
                
            }
            
            PopupElementButton(
                buttonText: buttonText,
                buttonActive: buttonLoading,
                buttonFill: buttonFill,
                buttonTextColor: buttonTextColor,
                buttonAction: buttonAction
            )
            
        }.padding(35)
        
    }
    
}
