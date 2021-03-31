//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A popup prompt for getting user-input text.
public struct PopcornGetTextPrompt: View {
    
    // Environment
    @EnvironmentObject var popcorn: Popcorn
    
    // Header View
    private let headerView: AnyView?
    
    // Text Data
    @Binding var textFieldInput: String
    private let headlineText: String
    private let textFieldPlaceholderText: String
    private let buttonText: String
    private let keyboardType: UIKeyboardType
    
    // Popup State
    private let buttonActive: Bool
    private let dragEnabled: Bool
    
    // Action Closures
    private let textFieldOnChangeState: (Bool) -> Void
    private let textFieldOnChangeText: () -> Void
    private let textFieldOnCommitText: () -> Void
    private let buttonAction: () -> Void
    private let dragDismissAction: () -> Void
    private let backgroundTapAction: () -> Void
    
    /// A popup prompt for getting user-input text.
    /// - Parameters:
    ///   - headlineText: The headline message on the prompt.
    ///   - textFieldPlaceholderText: The placeholder text shown in the text field.
    ///   - textFieldInput: The user-input text from the text field.
    ///   - keyboardType: The keyboard type shown when the text field is edited
    ///   - buttonText: The text label of the button.
    ///   - buttonLoading: The state of the button. When true, an activity indicator is shown and the button is disabled.
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - textFieldOnChangeState: A closure exectued when the text field changes editing state.
    ///   - textFieldOnChangeText: A closure exectued when the user-input text of the text field changes.
    ///   - textFieldOnCommitText: A closure exectued when the user commits the text of the text field.
    ///   - buttonAction: A closure exectued when the button is tapped.
    ///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
    ///   - backgroundTapAction: A closure executed when the background surrounding the popup is tapped.
    public init(
        headlineText: String,
        textFieldPlaceholderText: String,
        textFieldInput: Binding<String>,
        keyboardType: UIKeyboardType? = .default,
        buttonText: String,
        buttonLoading: Bool? = false,
        dragEnabled: Bool? = true,
        textFieldOnChangeState: ((Bool) -> Void)? = { _ in },
        textFieldOnChangeText: (() -> Void)? = {},
        textFieldOnCommitText: (() -> Void)? = {},
        buttonAction: @escaping () -> Void,
        dragDismissAction: (() -> Void)? = {},
        backgroundTapAction: (() -> Void)? = {}
    ) {
        self.headerView = nil
        self._textFieldInput = textFieldInput
        self.headlineText = headlineText
        self.textFieldPlaceholderText = textFieldPlaceholderText
        self.keyboardType = keyboardType!
        self.buttonText = buttonText
        self.buttonActive = buttonLoading!
        self.textFieldOnChangeState = textFieldOnChangeState!
        self.textFieldOnChangeText = textFieldOnChangeText!
        self.textFieldOnCommitText = textFieldOnCommitText!
        self.buttonAction = buttonAction
        self.dragEnabled = dragEnabled!
        self.dragDismissAction = dragDismissAction!
        self.backgroundTapAction = backgroundTapAction!
    }
    
    /// A popup prompt for getting user-input text.
    /// 
    /// - Parameters:
    ///   - headerView: A view for displaying illustrated content at the top of the prompt.
    ///   - headlineText: The headline message on the prompt.
    ///   - textFieldPlaceholderText: The placeholder text shown in the text field.
    ///   - textFieldInput: The user-input text from the text field.
    ///   - keyboardType: The keyboard type shown when the text field is edited
    ///   - buttonText: The text label of the button.
    ///   - buttonLoading: The state of the button. When true, an activity indicator is shown and the button is disabled.
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - textFieldOnChangeState: A closure exectued when the text field changes editing state.
    ///   - textFieldOnChangeText: A closure exectued when the user-input text of the text field changes.
    ///   - textFieldOnCommitText: A closure exectued when the user commits the text of the text field.
    ///   - buttonAction: A closure exectued when the button is tapped.
    ///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
    ///   - backgroundTapAction: A closure executed when the background surrounding the popup is tapped.
    public init<Content: View>(
        headerView: Content,
        headlineText: String,
        textFieldPlaceholderText: String,
        textFieldInput: Binding<String>,
        keyboardType: UIKeyboardType? = .default,
        buttonText: String,
        buttonLoading: Bool? = false,
        dragEnabled: Bool? = true,
        textFieldOnChangeState: Optional<(_ newState: Bool) -> Void> = { _ in },
        textFieldOnChangeText: (() -> Void)? = {},
        textFieldOnCommitText: (() -> Void)? = {},
        buttonAction: @escaping () -> Void,
        dragDismissAction: (() -> Void)? = {},
        backgroundTapAction: (() -> Void)? = {}
    ) {
        self.headerView = AnyView(headerView)
        self._textFieldInput = textFieldInput
        self.headlineText = headlineText
        self.textFieldPlaceholderText = textFieldPlaceholderText
        self.keyboardType = keyboardType!
        self.buttonText = buttonText
        self.buttonActive = buttonLoading!
        self.textFieldOnChangeState = textFieldOnChangeState!
        self.textFieldOnChangeText = textFieldOnChangeText!
        self.textFieldOnCommitText = textFieldOnCommitText!
        self.buttonAction = buttonAction
        self.dragEnabled = dragEnabled!
        self.dragDismissAction = dragDismissAction!
        self.backgroundTapAction = backgroundTapAction!
    }
    
    // View Body
    public var body: some View {
        PopupContainer(
            dragEnabled: dragEnabled,
            dragDismissAction: dragDismissAction,
            backgroundTapAction: backgroundTapAction,
            isKeyboardObserving: true
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
            
            PopupElementTextField(
                textFieldInput: $textFieldInput,
                textFieldPlaceholderText: textFieldPlaceholderText,
                textColor: popcorn.popupStyle.colors.textColor,
                keyboardType: keyboardType,
                onChangeState: textFieldOnChangeState,
                onChangeText: textFieldOnChangeText,
                onCommitText: textFieldOnCommitText
            )
            .padding([.horizontal, .bottom], 10)
            
            PopupElementButton(
                buttonText: buttonText,
                buttonActive: self.buttonActive,
                buttonFill: popcorn.popupStyle.colors.buttonColorPrimary,
                buttonTextColor: popcorn.popupStyle.colors.buttonTextColor,
                buttonAction: self.buttonAction
            )
            
        }
        .padding(20)
        
    }
    
}
