//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

/// A drop down banner for displaying a message.
public struct PopcornMessageBanner<HeaderImage, BannerFill>: View where HeaderImage: View, BannerFill: ShapeStyle {
    
    // Environmental view model
    @EnvironmentObject var popcorn: Popcorn
    
    // Header
    private let headerImage: HeaderImage
    private let headerTextLeft: String
    private let headerTextRight: String
    private let headerTextColor: Color
    
    // Headline
    private let headlineText: String
    private let headlineTextColor: Color
    
    // Body
    private let bodyText: String
    private let bodyTextColor: Color

    // Drag Gesture
    private let dragEnabled: Bool
    private let dragDismissAction: () -> Void
    
    // Background
    private let bannerFill: BannerFill
    private let bannerExpanded: Bool
    private let bannerTapAction: () -> Void

    /// A banner for displaying a short message.
    /// - Parameters:
    ///   - headerImage: A view for displaying illustrated content in the header.
    ///   - headerTextLeft: The left-aligned text of the header.
    ///   - headerTextRight: The right-aligned text of the header.
    ///   - headerTextColor: The color of the header text.
    ///
    ///   - headlineText: The headline message text.
    ///   - headlineTextColor: The color of the headline text.
    ///
    ///   - bodyText: The body message text.
    ///   - bodyTextColor: The color of the body text.
    ///
    ///   - dragEnabled: Whether or not the popup may be dragged.
    ///   - dragDismissAction: A closure executed when the popup is dragged upward past a threshold.
    ///
    ///   - bannerFill: The background fill style.
    ///   - bannerExpanded: Whether or not the popup is expanded.
    ///   - bannerTapAction: A closure executed when the banner is tapped.
    public init(
        
        headerImage: HeaderImage,
        headerTextLeft: String,
        headerTextRight: String,
        headerTextColor: Color,
            
        headlineText: String,
        headlineTextColor: Color,
        
        bodyText: String,
        bodyTextColor: Color,

        dragEnabled: Bool,
        dragDismissAction: @escaping () -> Void,
        
        bannerFill: BannerFill,
        bannerExpanded: Bool,
        bannerTapAction: @escaping () -> Void
        
    ) {
        
        self.headerImage = headerImage
        self.headerTextLeft = headerTextLeft
        self.headerTextRight = headerTextRight
        self.headerTextColor = headerTextColor
        
        self.headlineText = headlineText
        self.headlineTextColor = headlineTextColor
        
        self.bodyText = bodyText
        self.bodyTextColor = bodyTextColor
        
        self.dragEnabled = dragEnabled
        self.dragDismissAction = dragDismissAction
        
        self.bannerFill = bannerFill
        self.bannerExpanded = bannerExpanded
        self.bannerTapAction = bannerTapAction
        
    }
    
    // View Body
    public var body: some View {
        VStack(spacing: 0) {
            BannerElementTopSpacer()
            BannerContainer(
                bannerFill: bannerFill,
                dragEnabled: dragEnabled,
                dragDismissAction: dragDismissAction,
                tapAction: bannerTapAction
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
                headerTextColor: headerTextColor
            )
            VStack(spacing: 2) {
                BannerElementHeadline(
                    headlineText: headlineText,
                    headlineTextColor: headlineTextColor
                )
                BannerElementMessage(
                    bannerExpanded: bannerExpanded,
                    bodyText: bodyText,
                    bodyTextColor: bodyTextColor
                )
            }
        }.padding(10)
    }
    
}
