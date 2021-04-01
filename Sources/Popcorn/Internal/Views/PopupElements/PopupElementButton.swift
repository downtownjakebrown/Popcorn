//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupElementButton<ButtonFill>: View where ButtonFill: ShapeStyle {
    
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
                
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
                .fill(buttonFill)
                .opacity(!buttonActive ? 1.0 : 0.7)
                .shadow(color: Color.gray.opacity(0.2), radius: 5)
                
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
    
    var cornerRadius: CGFloat {
        switch popcorn.popupStyle.corners {
            case .square:  return 0
            case .rounded: return 10
            case .capsule: return 25
        }
    }
    
}
