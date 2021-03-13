//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupElementTextField: View {

    @Binding var textFieldInput: String
    let textFieldPlaceholderText: String
    let textColor: Color
    let keyboardType: UIKeyboardType
    
    let onChangeState: (Bool) -> Void   // Called when editing state is changed
    let onChangeText: () -> Void        // Called when input text is changed
    let onCommitText: () -> Void        // Called when input text is committed
    
    // MARK: View
    var body: some View {
        VStack(spacing: 5) {
            
            TextField(textFieldPlaceholderText,
                text: $textFieldInput,
                onEditingChanged: { state in
                    self.onChangeState(state)
                },
                onCommit: {
                    self.onCommitText()
                }
            )
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .keyboardType(keyboardType)
            .foregroundColor(textColor)
            .onChange(of: textFieldInput, perform: { value in
                self.onChangeText()
            })

            PopupElementDividerLine()
            
        }
    }
    
}
