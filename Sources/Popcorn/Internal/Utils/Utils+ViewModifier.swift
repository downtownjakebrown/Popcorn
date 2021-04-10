//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

// MARK: - PopcornPopupsModifier
struct PopcornPopupsModifier: ViewModifier {
    
    var popcorn: Popcorn
    
    func body(content: Content) -> some View {
        ZStack {
            content.zIndex(0)
            PopupViewBuilder().zIndex(1)
            BannerViewBuilder().zIndex(2)
        }.environmentObject(popcorn)
    }
    
    private struct PopupViewBuilder: View {
        
        @EnvironmentObject var popcorn: Popcorn
        
        var body: some View {
            ZStack {
                // Popup Background
                ZStack {
                    if popcorn.currentPrompt != nil {
                        PopupBackground().transition(.popupBackgroundStyle)
                    }
                }.zIndex(0)
                // Popup Content
                ZStack {
                    if popcorn.popupShouldShow {
                        ForEach(0..<popcorn.promptViews.count, id: \.self) { i in
                            if popcorn.currentPrompt == popcorn.promptNames[i] {
                                popcorn.promptViews[i].transition(.promptStyle)
                            }
                        }
                    }
                }.zIndex(1)
            }.ignoresSafeArea(.keyboard)
        }
        
    }
    
    private struct BannerViewBuilder: View {
        
        @EnvironmentObject var popcorn: Popcorn
        
        var body: some View {
            // Popup Content
            VStack {
                if popcorn.bannerShouldShow {
                    ForEach(0..<popcorn.bannerViews.count, id: \.self) { i in
                        if popcorn.currentBanner == popcorn.bannerNames[i] {
                            popcorn.bannerViews[i].transition(.bannerStyle)
                            Spacer()
                        }
                    }
                }
                
            }
            .ignoresSafeArea(.keyboard)
        }
        
    }
    
}

// MARK: - CornerRadiusStyle
struct CornerRadiusStyle: ViewModifier {
    
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content.clipShape(
            CornerRadiusShape(
                radius: radius,
                corners: corners
            )
        )
    }
    
    private struct CornerRadiusShape: Shape {
        
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
        
    }
    
}
