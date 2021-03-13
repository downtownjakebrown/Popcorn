//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct BannerContainer<BannerContent>: View where BannerContent: View {
    
    private let dragEnabled: Bool
    private let dragDismissAction: () -> Void
    private let tapAction: () -> Void
    private let content: () -> BannerContent
    
    private let maxBannerWidth: CGFloat = 400
    private let minHorizontalPadding: CGFloat = 10

    @State private var translation: CGSize = .zero
    private let dragDismissThreshold: CGFloat = 60

    init(
        dragEnabled: Bool = true,
        dragDismissAction: @escaping () -> Void = {},
        tapAction: @escaping () -> Void = {},
        content: @escaping () -> BannerContent
    ){
        self.dragEnabled = dragEnabled
        self.dragDismissAction = dragDismissAction
        self.tapAction = tapAction
        self.content = content
    }

    var body: some View {
        content()
        .background(
            BannerElementBackdrop()
        )
        .frame(maxWidth: maxBannerWidth)
        .padding(.horizontal, minHorizontalPadding)
        .offset(y: self.translation.height.asymmetricallySlowed(slowedIncrease: true))
        .gesture(TapGesture()
            .onEnded { _ in
                tapAction()
            }
        )
        .highPriorityGesture(!self.dragEnabled ? nil : DragGesture(minimumDistance: 10, coordinateSpace: .global)
            .onChanged { value in
                withAnimation(.interactiveSpring()) {
                    self.translation = value.translation
                }
            }
            .onEnded { value in
                if value.translation.height < -dragDismissThreshold {
                    self.dragDismissAction()
                    withAnimation(.interactiveSpring()) {
                        self.translation = .zero
                    }
                } else {
                    withAnimation(.interactiveSpring()) {
                        self.translation = .zero
                    }
                }
            }
        )
    }
    
}
