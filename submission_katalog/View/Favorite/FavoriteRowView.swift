

import SwiftUI

struct FavoriteRowView: View {
    var favorite: LocalDataViewModel
    var body: some View {
        HStack {
            ImageWithURL(favorite.gameBackgroundImage, width: 70, height: 90, cornerRadius: 5)
            VStack(alignment: .leading, spacing: 0) {
                Text(favorite.gameName)
                    .font(.system(size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack {
                    Text(favorite.gameRelease)
                        .font(.system(size: 14))
                        .lineLimit(3)
                    Spacer()
                    Text("Rating: \(favorite.gameRating.formatFloat())")
                        .font(.system(size: 14))
                        .lineLimit(3)

                }
            } .padding(.leading, 8)
            
        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

    }
}
