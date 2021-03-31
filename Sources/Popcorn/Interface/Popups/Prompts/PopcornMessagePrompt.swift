//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A popup prompt for displaying a short message.
public struct PopcornMessagePrompt<HeaderImage, ButtonFill, BackgroundFill>: View where HeaderImage: View, ButtonFill: ShapeStyle, BackgroundFill: ShapeStyle {
    
    // Environment
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
    
    // Dragging
    private let dragEnabled: Bool
    private let dragDismissAction: () -> Void
    
    // Background
    private let backgroundFill: BackgroundFill
    private let backgroundTapAction: () -> Void
    
    // ...
    public init(
        
        headerImage: HeaderImage,
        headerText: String,
        headerTextColor: Color = .black,
        
        bodyText: String,
        bodyTextColor: Color = .black,
        
        buttonText: String,
        buttonTextColor: Color = .white,
        buttonFill: ButtonFill,
        buttonLoading: Bool = false,
        buttonAction: @escaping () -> Void,
        
        dragEnabled: Bool = true,
        dragDismissAction: @escaping () -> Void = {},
        
        backgroundFill: BackgroundFill,
        backgroundTapAction: @escaping () -> Void = {}
        
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
            dragEnabled: dragEnabled,
            dragDismissAction: dragDismissAction,
            backgroundTapAction: backgroundTapAction
        ) {
            popupContentBuilder
        }
    }
    
    // Convenience Content Builder
    private var popupContentBuilder: some View {

        VStack(spacing: 20) {

            headerImage.frame(height: 80)
            
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

            PopupElementButton(
                buttonText: buttonText,
                buttonActive: buttonLoading,
                buttonFill: buttonFill,
                buttonTextColor: buttonTextColor,
                buttonAction: buttonAction
            )

        }
        .padding(40)

    }
    
}
