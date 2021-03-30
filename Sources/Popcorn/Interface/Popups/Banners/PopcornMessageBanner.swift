//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A banner for displaying a short message.
public struct PopcornMessageBanner: View {
    
    // Environment
    @EnvironmentObject var popcorn: Popcorn
    
    // Header View
    private let headerImage: AnyView?
    
    // Text Data
    private let headerTextLeft: String
    private let headerTextRight: String
    private let headlineText: String
    private let messageText: String
    
    // Banner State
    private let expandBanner: Bool
    private let dragEnabled: Bool
    
    // Action Closures
    private let dragDismissAction: () -> Void
    private let tapAction: () -> Void
    
    /// A banner for displaying a short message.
    /// - Parameters:
    ///   - headerTextLeft: The left-aligned text of the header.
    ///   - headerTextRight: The right-aligned text of the header.
    ///   - headlineText: The headline message on the prompt.
    ///   - messageText: The body message on the prompt.
    ///   - expandBanner: Whether or not the popup is expanded.
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
    ///   - tapAction: A closure executed when the banner is tapped.
    public init(
        headerTextLeft: String = "",
        headerTextRight: String = "",
        headlineText: String,
        messageText: String,
        expandBanner: Bool = false,
        dragEnabled: Bool = true,
        dragDismissAction: @escaping () -> Void = {},
        tapAction: @escaping () -> Void = {}
    ) {
        self.headerImage = nil
        self.headerTextLeft = headerTextLeft
        self.headerTextRight = headerTextRight
        self.headlineText = headlineText
        self.messageText = messageText
        self.expandBanner = expandBanner
        self.dragEnabled = dragEnabled
        self.dragDismissAction = dragDismissAction
        self.tapAction = tapAction
    }
    
    /// A banner for displaying a short message.
    /// - Parameters:
    ///   - headerImage: A view for displaying illustrated content in the header.
    ///   - headerTextLeft: The left-aligned text of the header.
    ///   - headerTextRight: The right-aligned text of the header.
    ///   - headlineText: The headline message on the prompt.
    ///   - messageText: The body message on the prompt.
    ///   - expandBanner: Whether or not the popup is expanded.
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - dragDismissAction: A closure executed when the popup is dragged down past a threshold.
    ///   - tapAction: A closure executed when the banner is tapped.
    public init<Content: View>(
        headerImage: Content,
        headerTextLeft: String = "",
        headerTextRight: String = "",
        headlineText: String,
        messageText: String,
        expandBanner: Bool = false,
        dragEnabled: Bool = true,
        dragDismissAction: @escaping () -> Void = {},
        tapAction: @escaping () -> Void = {}
    ) {
        self.headerImage = AnyView(headerImage)
        self.headerTextLeft = headerTextLeft
        self.headerTextRight = headerTextRight
        self.headlineText = headlineText
        self.messageText = messageText
        self.expandBanner = expandBanner
        self.dragEnabled = dragEnabled
        self.dragDismissAction = dragDismissAction
        self.tapAction = tapAction
    }
    
    // View Body
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
                    expandBanner: expandBanner,
                    messageText: messageText,
                    messageTextColor: popcorn.popupStyle.colors.textColor
                )
            }
        }.padding(10)
    }
    
}
