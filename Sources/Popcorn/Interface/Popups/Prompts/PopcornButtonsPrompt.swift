//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A popup prompt with two buttons.
public struct PopcornButtonsPrompt<HeaderImage, Button1Fill, Button2Fill, BackgroundFill>: View where HeaderImage: View, Button1Fill: ShapeStyle, Button2Fill: ShapeStyle, BackgroundFill: ShapeStyle {
    
    // Environmental view model
    @EnvironmentObject var popcorn: Popcorn
    
    // Header
    private let headerImage: HeaderImage
    private let headerText: String
    private let headerTextColor: Color
    
    // Button 1
    private let button1Text: String
    private let button1TextColor: Color
    private let button1Fill: Button1Fill
    private let button1Loading: Bool
    private let button1Action: () -> Void
    
    // Button 2
    private let button2Text: String
    private let button2TextColor: Color
    private let button2Fill: Button2Fill
    private let button2Loading: Bool
    private let button2Action: () -> Void
    
    // Button Style
    private let buttonStyle: ButtonArrangement
    
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
    ///   - button1Text: The button label text.
    ///   - button1TextColor: The color of the button label text.
    ///   - button1Fill: The button's fill style.
    ///   - button1Loading: The loading state of the button. If true, the button is disabled and an activity icon is shown.
    ///   - button1Action: A closure exectued when the button is tapped.
    ///
    ///   - button2Text: The button label text.
    ///   - button2TextColor: The color of the button label text.
    ///   - button2Fill: The button's fill style.
    ///   - button2Loading: The loading state of the button. If true, the button is disabled and an activity icon is shown.
    ///   - button2Action: A closure exectued when the button is tapped.
    ///
    ///   - buttonStyle: The style and arrangement of the buttons.
    ///
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
    ///
    ///   - backgroundFill: The background fill style.
    ///   - backgroundTapAction: A closure executed when the background surrounding the popup is tapped.
    public init(
        
        headerImage: HeaderImage,
        headerText: String,
        headerTextColor: Color = .black,
        
        button1Text: String,
        button1TextColor: Color = .white,
        button1Fill: Button1Fill,
        button1Loading: Bool = false,
        button1Action: @escaping () -> Void,
        
        button2Text: String,
        button2TextColor: Color = .white,
        button2Fill: Button2Fill,
        button2Loading: Bool = false,
        button2Action: @escaping () -> Void,
        
        buttonStyle: ButtonArrangement,
        
        dragEnabled: Bool = true,
        dragDismissAction: @escaping () -> Void = {},
        
        backgroundFill: BackgroundFill,
        backgroundTapAction: @escaping () -> Void = {}
        
    ) {
        
        self.headerImage = headerImage
        self.headerText = headerText
        self.headerTextColor = headerTextColor
        
        self.button1Text = button1Text
        self.button1TextColor = button1TextColor
        self.button1Fill = button1Fill
        self.button1Loading = button1Loading
        self.button1Action = button1Action
        
        self.button2Text = button2Text
        self.button2TextColor = button2TextColor
        self.button2Fill = button2Fill
        self.button2Loading = button2Loading
        self.button2Action = button2Action
        
        self.buttonStyle = buttonStyle
        
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
        
        VStack(spacing: 25) {

            headerImage.frame(height: 110)
                
            PopupElementHeadlineText(
                text: headerText,
                color: headerTextColor,
                lineLimit: 4
            )
             
            VStack(spacing: 15) {
                
                PopupElementButton(
                    buttonText: button1Text,
                    buttonActive: button1Loading,
                    buttonFill: button1Fill,
                    buttonTextColor: button1TextColor,
                    buttonAction: button1Action
                )
                
                PopupElementButton(
                    buttonText: button2Text,
                    buttonActive: button2Loading,
                    buttonFill: button2Fill,
                    buttonTextColor: button2TextColor,
                    buttonAction: button2Action
                )
                
            }
            
        }.padding(35)
        
    }
    
    public enum ButtonArrangement {
        case verticalStack
        case horizontalStack
        case bottom
    }
    
}
