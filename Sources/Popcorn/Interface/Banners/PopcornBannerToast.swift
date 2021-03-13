//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

public struct PopcornBannerToast: View {
    
    private let headerImage: AnyView?
    private let headerTextLeft: String
    private let headerTextRight: String
    
    private let headlineText: String
    private let messageText: String
    
    @Binding var expandBanner: Bool
    private let dragEnabled: Bool
    private let dragDismissAction: () -> Void
    private let tapAction: () -> Void
    
    public init<Content: View>(
        headerImage: Content,
        headerTextLeft: String = "",
        headerTextRight: String = "",
        headlineText: String,
        messageText: String,
        expandBanner: Binding<Bool>,
        dragEnabled: Bool = true,
        dragDismissAction: @escaping () -> Void = {},
        tapAction: @escaping () -> Void = {}
    ) {
        self.headerImage = AnyView(headerImage)
        self.headerTextLeft = headerTextLeft
        self.headerTextRight = headerTextRight
        self.headlineText = headlineText
        self.messageText = messageText
        self._expandBanner = expandBanner
        self.dragEnabled = dragEnabled
        self.dragDismissAction = dragDismissAction
        self.tapAction = tapAction
    }
    
    @EnvironmentObject var popcorn: Popcorn
    
    private let headerTextFont = Font.system(size: 12, weight: .medium)
    private let headlineTextFont = Font.system(size: 14, weight: .bold)
    
    
    private var headerTextColor: Color {
        Color.gray
    }
    private var headlineTextColor: Color {
        popcorn.popupStyle.colors.textColor
    }
    
    private var topSafeArea: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            topSpacer
            BannerContainer(
                dragEnabled: dragEnabled,
                dragDismissAction: dragDismissAction,
                tapAction: tapAction
            ) {
                VStack(spacing: 7) {
                    header
                    VStack(spacing: 2) {
                        headline
                        BannerElementMessage(
                            expandBanner: $expandBanner,
                            messageText: messageText,
                            messageTextColor: popcorn.popupStyle.colors.textColor
                        )
                    }
                }.padding(10)
            }
        }.offset(y: -topSafeArea)
    }
    
    private var topSpacer: some View {
        Rectangle().fill(Color.clear).frame(height: topSafeArea)
    }
    
    private var header: some View {
        HStack {
            if headerImage != nil {
                headerImage
                .frame(width: 20, height: 20)
            }
            if headerTextLeft != "" {
                Text(headerTextLeft)
                .font(headerTextFont)
                .foregroundColor(headerTextColor)
            }
            Spacer()
            if headerTextRight != "" {
                Text(headerTextRight)
                .font(headerTextFont)
                .foregroundColor(headerTextColor)
            }
        }
    }
    
    private var headline: some View {
        HStack {
            Text(headlineText)
            .font(headlineTextFont)
            .foregroundColor(headlineTextColor)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            Spacer()
        }
    }
    
    
    
    
    
}
