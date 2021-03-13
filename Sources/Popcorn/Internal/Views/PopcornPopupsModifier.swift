//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopcornPopupsModifier: ViewModifier {
    
    var popcorn: Popcorn
    
    func body(content: Content) -> some View {
        ZStack {
            content.zIndex(0)
            PopupViewBuilder().zIndex(1)
            BannerViewBuilder().zIndex(2)
        }.environmentObject(popcorn)
    }
    
}

fileprivate struct PopupViewBuilder: View {
    
    @EnvironmentObject var popcorn: Popcorn
    
    var body: some View {
        ZStack {
            // Popup Background
            ZStack {
                if popcorn.currentPopup != nil {
                    PopupBackground().transition(.popupBackgroundStyle)
                }
            }.zIndex(0)
            // Popup Content
            ZStack {
                if popcorn.popupShouldShow {
                    ForEach(0..<popcorn.popupViews.count, id: \.self) { i in
                        if popcorn.currentPopup == popcorn.popupNames[i] {
                            popcorn.popupViews[i].transition(.popupStyle)
                        }
                    }
                }
            }.zIndex(1)
        }.ignoresSafeArea(.keyboard)
    }
    
}

fileprivate struct BannerViewBuilder: View {
    
    @EnvironmentObject var popcorn: Popcorn
    
    var body: some View {
        // Popup Content
        VStack {
            if popcorn.bannerShouldShow {
                ForEach(0..<popcorn.bannerViews.count, id: \.self) { i in
                    if popcorn.currentBanner == popcorn.bannerNames[i] {
                        popcorn.bannerViews[i]
                            .transition(.bannerStyle)
                        Spacer()
                    }
                }
            }
            
        }
        .ignoresSafeArea(.keyboard)
    }
    
}

