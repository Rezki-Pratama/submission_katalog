import SwiftUI
import Foundation

struct ImageWithURL: View {
    @ObservedObject var imageLoader: ImageLoaderAndCache
    private let width: CGFloat
    private let height: CGFloat
    private let cornerRadius: CGFloat

    init(_ url: String, width: CGFloat, height: CGFloat, cornerRadius: CGFloat) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }

    var body: some View {
          Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .cornerRadius(cornerRadius)
            .shadow(radius: 5)
    }
}
class ImageLoaderAndCache: ObservableObject {
    
    @Published var imageData = Data()
    
    init(imageURL: String) {
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        if let data = cache.cachedResponse(for: request)?.data {
            print("got image from cache")
            self.imageData = data
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response {
                let cachedData = CachedURLResponse(response: response, data: data)
                                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        print("downloaded from internet")
                        self.imageData = data
                    }
                }
            }).resume()
        }
    }
}

