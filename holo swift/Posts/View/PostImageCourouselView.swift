import SwiftUI
import WebKit

struct PostImageCarouselView: View {
    let post: Post
    
    var body: some View {
        GeometryReader { geometry in
            if post.isGIF {
                WebView(url: URL(string: post.imageURLs)!)
                    .frame(width: 510)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .tabViewStyle(.page)
                    .position(x: geometry.size.width / 1.9, y: geometry.size.height / 2)
            } else {
                Image(post.imageURLs)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
        }
    }
}

// A simple WebView to display GIFs
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false // Disable scrolling
        webView.isOpaque = false // Make background transparent
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

// Preview code
#Preview {
    PostImageCarouselView(post: DeveloperPreview.shared.posts[0])
}

