//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

public struct PopcornBannerToast: View {
    
    @EnvironmentObject var popcorn: Popcorn
    
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
    
    public var body: some View {
        VStack(spacing: 0) {
            BannerElementTopSpacer()
            BannerContainer(
                dragEnabled: dragEnabled,
                dragDismissAction: dragDismissAction,
                tapAction: tapAction
            ) {
                bannerContentBuilder
            }
        }.offset(y: -Device.topSafeArea)
    }
    
    // Convenience Content Builder
    private var bannerContentBuilder: some View {
        VStack(spacing: 7) {
            BannerElementHeader(
                headerImage: headerImage,
                headerTextLeft: headerTextLeft,
                headerTextRight: headerTextRight,
                headerTextColor: .gray
            )
            VStack(spacing: 2) {
                BannerElementHeadline(
                    headlineText: headlineText,
                    headlineTextColor: popcorn.popupStyle.colors.textColor
                )
                BannerElementMessage(
                    expandBanner: $expandBanner,
                    messageText: messageText,
                    messageTextColor: popcorn.popupStyle.colors.textColor
                )
            }
        }.padding(10)
    }
    
}
