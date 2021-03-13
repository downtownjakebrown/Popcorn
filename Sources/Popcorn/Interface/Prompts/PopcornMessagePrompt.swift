//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A popup prompt for displaying a short message.
public struct PopcornMessagePrompt: View {
    
    // Environment
    @EnvironmentObject var popcorn: Popcorn
    
    // Header View
    private let headerView: AnyView?
    
    // Text Data
    private let headlineText: String
    private let bodyText: String
    private let buttonText: String
    
    // Popup State
    private let buttonActive: Bool
    private let dragEnabled: Bool
    
    // Action Closures
    private let buttonAction: () -> Void
    private let dragDismissAction: () -> Void
    private let backgroundTapAction: () -> Void
    
    /// A popup prompt for displaying a short message.
    /// - Parameters:
    ///   - headlineText: The headline message on the prompt.
    ///   - bodyText: The body message on the prompt.
    ///   - buttonText: The text label of the button.
    ///   - buttonLoading: The state of the button. When true, an activity indicator is shown and the button is disabled.
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - buttonAction: A closure exectued when the button is tapped.
    ///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
    ///   - backgroundTapAction: A closure executed when the background surrounding the popup is tapped.
    public init(
        headlineText: String,
        bodyText: String,
        buttonText: String,
        buttonLoading: Bool? = false,
        dragEnabled: Bool? = true,
        buttonAction: @escaping () -> Void,
        dragDismissAction: (() -> Void)? = {},
        backgroundTapAction: (() -> Void)? = {}
    ) {
        self.headerView = nil
        self.headlineText = headlineText
        self.bodyText  = bodyText
        self.buttonText = buttonText
        self.buttonActive = buttonLoading!
        self.dragEnabled = dragEnabled!
        self.buttonAction = buttonAction
        self.dragDismissAction = dragDismissAction!
        self.backgroundTapAction = backgroundTapAction!
    }
    
    /// A popup prompt for displaying a short message.
    /// - Parameters:
    ///   - headerImage: A view for displaying illustrated content at the top of the prompt.
    ///   - headlineText: The headline message on the prompt.
    ///   - bodyText: The body message on the prompt.
    ///   - buttonText: The text label of the button.
    ///   - buttonLoading: The state of the button. When true, an activity indicator is shown and the button is disabled.
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - buttonAction: A closure exectued when the button is tapped.
    ///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
    ///   - backgroundTapAction: A closure executed when the background surrounding the popup is tapped.
    public init<Content: View>(
        headerView: Content,
        headlineText: String,
        bodyText: String,
        buttonText: String,
        buttonLoading: Bool? = false,
        dragEnabled: Bool? = true,
        buttonAction: @escaping () -> Void,
        dragDismissAction: (() -> Void)? = {},
        backgroundTapAction: (() -> Void)? = {}
    ) {
        self.headerView = AnyView(headerView)
        self.headlineText = headlineText
        self.bodyText  = bodyText
        self.buttonText = buttonText
        self.buttonActive = buttonLoading!
        self.dragEnabled = dragEnabled!
        self.buttonAction = buttonAction
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

            PopupElementBodyText(
                text: bodyText,
                color: popcorn.popupStyle.colors.textColor,
                lineLimit: 4
            )

            PopupElementButton(
                buttonText: buttonText,
                buttonActive: buttonActive,
                buttonColor: popcorn.popupStyle.colors.buttonColorPrimary,
                buttonTextColor: popcorn.popupStyle.colors.buttonTextColor,
                buttonAction: buttonAction
            )

        }
        .padding(20)

    }
    
}
