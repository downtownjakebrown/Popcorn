//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

protocol PopupFormatProtocol {
    static var presentationStyle: PopupFormat { get }
}

/// A popup prompt with two buttons.
public struct PopcornButtonsPrompt<HeaderImage, Button1Fill, Button2Fill, BackgroundFill>: View where HeaderImage: View, Button1Fill: ShapeStyle, Button2Fill: ShapeStyle, BackgroundFill: ShapeStyle {
    
    // Environment
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
                color: popcorn.popupStyle.colors.textColor,
                lineLimit: 4
            )
            
            VStack(spacing: 7) {
                PopupElementButton(
                    buttonText: self.button1Text,
                    buttonActive: self.button1Loading,
                    buttonFill: button1Fill,
                    buttonTextColor: popcorn.popupStyle.colors.buttonTextColor,
                    buttonAction: self.button1Action
                )
                
                PopupElementButton(
                    buttonText: self.button2Text,
                    buttonActive: self.button2Loading,
                    buttonFill: button2Fill,
                    buttonTextColor: popcorn.popupStyle.colors.buttonTextColor,
                    buttonAction: self.button2Action
                )
            }
            
        }
        .padding(20)
        
    }
    
}


/// A popup prompt with two buttons.
/// - Parameters:
///   - headerView: A view for displaying illustrated content at the top of the prompt.
///   - headlineText: The headline message on the prompt.
///   - button1Text: The text label of the top-most button.
///   - button2Text: The text label of the bottom-most button.
///   - button1Loading: The state of the top-most button. When true, an activity indicator is shown and the button is disabled.
///   - button2Loading: The state of the bottom-most button. When true, an activity indicator is shown and the button is disabled.
///   - dragEnabled: Whether or not the popup may be dragged.
///   - button1Action: A closure exectued when the top-most button is tapped.
///   - button2Action: A closure exectued when the bottom-most button is tapped.
///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
///   - backgroundTapAction: A closure executed when the background surrounding the popup is tapped.
