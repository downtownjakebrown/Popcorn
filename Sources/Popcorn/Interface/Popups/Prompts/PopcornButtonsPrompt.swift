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
    
    // Corners
    private let cornerStyle: PopcornCornerStyle
    
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
    ///
    ///   - cornerStyle: The style of the popup's corners.
    public init(
        
        headerImage: HeaderImage,
        headerText: String,
        headerTextColor: Color,
        
        button1Text: String,
        button1TextColor: Color,
        button1Fill: Button1Fill,
        button1Loading: Bool,
        button1Action: @escaping () -> Void,
        
        button2Text: String,
        button2TextColor: Color,
        button2Fill: Button2Fill,
        button2Loading: Bool,
        button2Action: @escaping () -> Void,
        
        buttonStyle: ButtonArrangement,
        
        dragEnabled: Bool,
        dragDismissAction: @escaping () -> Void,
        
        backgroundFill: BackgroundFill,
        backgroundTapAction: @escaping () -> Void,
        
        cornerStyle: PopcornCornerStyle
        
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
        
        self.cornerStyle = cornerStyle
        
    }
    
    // View Body
    public var body: some View {
        PopupContainer(
            backgroundFill: backgroundFill,
            dragEnabled: dragEnabled,
            dragDismissAction: dragDismissAction,
            backgroundTapAction: backgroundTapAction,
            cornerStyle: cornerStyle
        ) {
            popupContentBuilder
        }
    }
    
    // Convenience Content Builder
    private var popupContentBuilder: some View {
        
        VStack(spacing: 25) {

            headerImage
            .frame(height: 90)
            .padding(.horizontal, 35)
            
            PopupElementHeadlineText(
                text: headerText,
                color: headerTextColor,
                lineLimit: 4
            ).padding(.horizontal, 35)
            
            if buttonStyle == .verticalStack {
                
                VStack(spacing: 10) {
                    PopupElementButton(
                        buttonText: button1Text,
                        buttonActive: button1Loading,
                        buttonFill: button1Fill,
                        buttonTextColor: button1TextColor,
                        buttonAction: button1Action,
                        cornerStyle: cornerStyle
                    )
                    PopupElementButton(
                        buttonText: button2Text,
                        buttonActive: button2Loading,
                        buttonFill: button2Fill,
                        buttonTextColor: button2TextColor,
                        buttonAction: button2Action,
                        cornerStyle: cornerStyle
                    )
                }.padding([.horizontal, .bottom], 35)
                
            } else if buttonStyle == .bottomBar {
                
                PopupElementButtonBar(
                    button1Text: button1Text,
                    button1TextColor: button1TextColor,
                    button1Fill: button1Fill,
                    button1Loading: button1Loading,
                    button1Action: button1Action,
                    button2Text: button2Text,
                    button2TextColor: button2TextColor,
                    button2Fill: button2Fill,
                    button2Loading: button2Loading,
                    button2Action: button2Action
                )
                
            }
            
        }.padding(.top, 35)
        
    }
    
    public enum ButtonArrangement {
        case verticalStack
        case bottomBar
    }
    
}

struct PopupElementButtonBar<Button1Fill, Button2Fill>: View where Button1Fill: ShapeStyle, Button2Fill: ShapeStyle {
    
    // Button 1
    let button1Text: String
    let button1TextColor: Color
    let button1Fill: Button1Fill
    let button1Loading: Bool
    let button1Action: () -> Void
    
    // Button 2
    let button2Text: String
    let button2TextColor: Color
    let button2Fill: Button2Fill
    let button2Loading: Bool
    let button2Action: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            PopupElementButtonBarHalf(
                leftSide: true,
                buttonText: button1Text,
                buttonActive: button1Loading,
                buttonFill: button1Fill,
                buttonTextColor: button1TextColor,
                buttonAction: button1Action
            )
            PopupElementButtonBarHalf(
                leftSide: false,
                buttonText: button2Text,
                buttonActive: button2Loading,
                buttonFill: button2Fill,
                buttonTextColor: button2TextColor,
                buttonAction: button2Action
            )
        }
    }
    
}

struct PopupElementButtonBarHalf<ButtonFill>: View where ButtonFill: ShapeStyle {
    
    let leftSide: Bool
    let buttonText: String
    let buttonActive: Bool
    let buttonFill: ButtonFill
    let buttonTextColor: Color
    let buttonAction: () -> Void
    
    @EnvironmentObject var popcorn: Popcorn
    
    var body: some View {
        Button(action: {
            self.buttonAction()
        }) {
            ZStack {
                
                Rectangle()
                .fill(buttonFill)
                .opacity(!buttonActive ? 1.0 : 0.7)
                .cornerRadius(radius: 25, corners: leftSide ? [.bottomLeft] : [.bottomRight])
                
                if self.buttonActive {
                    PopupElementLoadingIndicator(color: .white)
                    .transition(AnyTransition.opacity.animation(.default))
                } else {
                    Text(self.buttonText)
                    .font(.popcornButton)
                    .bold()
                    .foregroundColor(buttonTextColor)
                    .transition(AnyTransition.opacity.animation(.default))
                }
                
            }
        }
        .disabled(buttonActive)
        .frame(height: 50)
    }
    
}
