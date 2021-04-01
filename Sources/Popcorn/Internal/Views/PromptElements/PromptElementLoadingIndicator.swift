//
// See LICENSE file for this package’s licensing information.
//

import SwiftUI

struct PopupElementLoadingIndicator: View {
    
    let color: Color
    
    @State private var animate: Bool = true
    
    var body: some View {
        ActivityIndicatorUIView(
            animate: $animate,
            color: color
        )
        .frame(
            width: 50,
            height: 50
        )
    }
}

fileprivate struct ActivityIndicatorUIView: UIViewRepresentable {
    
    @Binding var animate: Bool
    
    let color: Color
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.style = .medium
        activityIndicatorView.color = UIColor(color)
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if self.animate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
    
}
