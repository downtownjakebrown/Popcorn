//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A popup prompt with two buttons.
public struct PopcornButtonsPrompt: View {
    
    // Environment
    @EnvironmentObject var popcorn: Popcorn
    
    // Header View
    private let headerView: AnyView?
    
    // Text Data
    private let headlineText: String
    private let button1Text: String
    private let button2Text: String
    
    // Popup State
    private let button1Active: Bool
    private let button2Active: Bool
    private let dragEnabled: Bool
    
    // Action Closures
    private let button1Action: () -> Void
    private let button2Action: () -> Void
    private let dragDismissAction: () -> Void
    private let backgroundTapAction: () -> Void
    
    /// A popup prompt with two buttons.
    /// - Parameters:
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
    public init(
        headlineText: String,
        button1Text: String,
        button2Text: String,
        button1Loading: Bool? = false,
        button2Loading: Bool? = false,
        dragEnabled: Bool? = true,
        button1Action: @escaping () -> Void,
        button2Action: @escaping () -> Void,
        dragDismissAction: (() -> Void)? = {},
        backgroundTapAction: (() -> Void)? = {}
    ) {
        self.headerView = nil
        self.headlineText = headlineText
        self.button1Text = button1Text
        self.button2Text = button2Text
        self.button1Active = button1Loading!
        self.button2Active = button2Loading!
        self.dragEnabled = dragEnabled!
        self.button1Action = button1Action
        self.button2Action = button2Action
        self.dragDismissAction = dragDismissAction!
        self.backgroundTapAction = backgroundTapAction!
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
    public init<Content: View>(
        headerView: Content,
        headlineText: String,
        button1Text: String,
        button2Text: String,
        button1Loading: Bool? = false,
        button2Loading: Bool? = false,
        dragEnabled: Bool? = true,
        button1Action: @escaping () -> Void,
        button2Action: @escaping () -> Void,
        dragDismissAction: (() -> Void)? = {},
        backgroundTapAction: (() -> Void)? = {}
    ) {
        self.headerView = AnyView(headerView)
        self.headlineText = headlineText
        self.button1Text = button1Text
        self.button2Text = button2Text
        self.button1Active = button1Loading!
        self.button2Active = button2Loading!
        self.dragEnabled = dragEnabled!
        self.button1Action = button1Action
        self.button2Action = button2Action
        self.dragDismissAction = dragDismissAction!
        self.backgroundTapAction = backgroundTapAction!
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
            
            if headerView != nil {
                ZStack {
                    headerView
                }
                .frame(height: 80)
            }
            
            PopupElementHeadlineText(
                text: headlineText,
                color: popcorn.popupStyle.colors.textColor,
                lineLimit: 4
            )
            
            VStack(spacing: 7) {
                PopupElementButton(
                    buttonText: self.button1Text,
                    buttonActive: self.button1Active,
                    buttonColor: popcorn.popupStyle.colors.buttonColorPrimary,
                    buttonTextColor: popcorn.popupStyle.colors.buttonTextColor,
                    buttonAction: self.button1Action
                )
                
                PopupElementButton(
                    buttonText: self.button2Text,
                    buttonActive: self.button2Active,
                    buttonColor: popcorn.popupStyle.colors.buttonColorSecondary,
                    buttonTextColor: popcorn.popupStyle.colors.buttonTextColor,
                    buttonAction: self.button2Action
                )
            }
            
        }
        .padding(20)
        
    }
    
}
