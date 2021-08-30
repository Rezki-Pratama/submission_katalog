import SwiftUI

struct DeveloperRowView: View {
    var developer: DeveloperResult
    
    var body: some View {
        HStack {
            ImageWithURL(developer.imageBackground, width: 70, height: 90, cornerRadius: 5)
            VStack(alignment: .leading, spacing: 0) {
                Text(developer.name)
                    .font(.system(size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(developer.slug)
                    .font(.system(size: 14))
                    .lineLimit(3)
            } .padding(.leading, 8)
            
        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        
    }
}
