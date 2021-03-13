//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupContainer<PopupContent>: View where PopupContent: View {
    
    @EnvironmentObject var popcorn: Popcorn
    
    private var content: () -> PopupContent
    
    private let maxPopupWidth: CGFloat = 400
    private let minHorizontalPadding: CGFloat = 30

    @State private var translation: CGSize = .zero
    private let dragEnabled: Bool
    private let dragDismissThreshold: CGFloat = 0.3
    
    private let isKeyboardObserving: Bool
    @State private var keyboardIsShown: Bool = false
    @State private var keyboardHeight: CGFloat = 0
    @State private var popupHeight: CGFloat = 0
    
    var dragDismissAction: () -> Void
    var backgroundTapAction: () -> Void
    
    init(
        dragEnabled: Bool? = true,
        dragDismissAction: (() -> Void)? = {},
        backgroundTapAction: (() -> Void)? = {},
        isKeyboardObserving: Bool? = false,
        content: @escaping () -> PopupContent
    ){
        self.dragEnabled = dragEnabled!
        self.dragDismissAction = dragDismissAction!
        self.backgroundTapAction = backgroundTapAction!
        self.isKeyboardObserving = isKeyboardObserving!
        self.content = content
    }
    
    var body: some View {
        GeometryReader { viewArea in
            ZStack {
                content()
                .frame(width: getFrameWidth(viewArea.size.width))
                .background(
                    PopupElementBackdrop()
                    .background(
                        Group {
                            if isKeyboardObserving {
                                GeometryReader { popupArea in
                                    Rectangle().fill(Color.clear)
                                    .onAppear {
                                        self.popupHeight = popupArea.size.height
                                    }
                                }
                            }
                        }
                    )
                )
                .offset(
                    x: 0,
                    y: self.translation.height.asymmetricallySlowed(slowedIncrease: false) + (isKeyboardObserving ? offsetForKeyboard(viewArea) : 0.0)
                )
                .gesture(self.keyboardIsShown || !self.dragEnabled ? nil : DragGesture()
                    .onChanged { value in
                        withAnimation(.interactiveSpring()) {
                            self.translation = value.translation
                        }
                    }
                    .onEnded { value in
                        if self.getGesturePercentage(viewArea, from: value) > self.dragDismissThreshold {
                            withAnimation(.interactiveSpring()) {
                                self.translation = .zero
                            }
                            self.dragDismissAction()
                        } else {
                            withAnimation(.interactiveSpring()) {
                                self.translation = .zero
                            }
                        }
                    }
                )
                .onReceive(self.popcorn.backgroundWasTapped) {
                    self.backgroundTapAction()
                }
                .keyboardObserver(
                    onShow: { key in
                        let value = key.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        withAnimation(.spring()) {
                            self.keyboardHeight = value.height
                        }
                        self.keyboardIsShown = true
                    },
                    onHide: { _ in
                        withAnimation(.spring()) {
                            self.keyboardHeight = 0
                        }
                        self.keyboardIsShown = false
                    }
                )
            }
            .frame(
                width: viewArea.size.width,
                height: viewArea.size.height
            )
        }
        .ignoresSafeArea(.keyboard)
    }
    
    private func getFrameWidth(_ viewWidth: CGFloat) -> CGFloat {
        let maxWidth = viewWidth - 2*minHorizontalPadding
        if maxWidth > maxPopupWidth {
            return maxPopupWidth
        } else {
            return maxWidth
        }
    }
    
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.height / geometry.size.height
    }
    
    private func offsetForKeyboard(_ viewArea: GeometryProxy) -> CGFloat {
        // Relevant geometry
        let popupBottomToBottomEdge = ((viewArea.size.height - popupHeight) / 2) + viewArea.safeAreaInsets.bottom
        let popupToKeyboardPadding: CGFloat = 20
        // If popup needs to make room for keyboard, do so
        if (self.keyboardHeight + popupToKeyboardPadding) > popupBottomToBottomEdge {
            return -((self.keyboardHeight + popupToKeyboardPadding) - popupBottomToBottomEdge)
        } else {
            return 0
        }
    }
    
}
