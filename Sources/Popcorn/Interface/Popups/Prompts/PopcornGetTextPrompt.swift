//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A popup prompt for getting user-input text.
public struct PopcornGetTextPrompt<HeaderImage, ButtonFill, BackgroundFill>: View where HeaderImage: View, ButtonFill: ShapeStyle, BackgroundFill: ShapeStyle  {
    
    // Environmental view model
    @EnvironmentObject var popcorn: Popcorn
    
    // Header
    private let headerImage: HeaderImage
    private let headerText: String
    private let headerTextColor: Color
    
    // Text Data
    @Binding var textFieldInput: String
    private let textFieldPlaceholderText: String
    private let textFieldTextColor: Color
    private let textFieldOnChangeState: (Bool) -> Void
    private let textFieldOnChangeText: () -> Void
    private let textFieldOnCommitText: () -> Void
    private let textFieldKeyboardType: UIKeyboardType
    
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
    ///   - textFieldInput: The user-input text.
    ///   - textFieldPlaceholderText: The placeholder text.
    ///   - textFieldTextColor: The color of the textField text.
    ///   - textFieldOnChangeState: A closure exectued when the state of the textField changes.
    ///   - textFieldOnChangeText: A closure exectued when the textField text changes.
    ///   - textFieldOnCommitText: A closure exectued when the textField text is committed.
    ///   - textFieldKeyboardType: The type of software keyboard shown while the textField is edited.
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
        
        textFieldInput: Binding<String>,
        textFieldPlaceholderText: String,
        textFieldTextColor: Color,
        textFieldOnChangeState: @escaping (_ newState: Bool) -> Void,
        textFieldOnChangeText: @escaping () -> Void,
        textFieldOnCommitText: @escaping () -> Void,
        textFieldKeyboardType: UIKeyboardType,
        
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
        
        self._textFieldInput = textFieldInput
        self.textFieldPlaceholderText = textFieldPlaceholderText
        self.textFieldTextColor = textFieldTextColor
        self.textFieldOnChangeState = textFieldOnChangeState
        self.textFieldOnChangeText = textFieldOnChangeText
        self.textFieldOnCommitText = textFieldOnCommitText
        self.textFieldKeyboardType = textFieldKeyboardType
        
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
            backgroundTapAction: backgroundTapAction,
            isKeyboardObserving: true
        ) {
            popupContentBuilder
        }
    }
    
    // Convenience Content Builder
    private var popupContentBuilder: some View {
        
        VStack(spacing: 25) {
            
            headerImage.frame(height: 90)
            
            PopupElementHeadlineText(
                text: headerText,
                color: headerTextColor,
                lineLimit: 4
            )
            
            PopupElementTextField(
                textFieldInput: $textFieldInput,
                textFieldPlaceholderText: textFieldPlaceholderText,
                textColor: textFieldTextColor,
                keyboardType: textFieldKeyboardType,
                onChangeState: textFieldOnChangeState,
                onChangeText: textFieldOnChangeText,
                onCommitText: textFieldOnCommitText
            ).padding([.horizontal, .bottom], 10)
            
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
