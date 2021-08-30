import SwiftUI

struct Profile : View {
    var body: some View {
        VStack {
            Image("rezki")
                .resizable()
                .clipShape(Circle())
                .foregroundColor(.gray)
                .scaledToFit()
                .frame(width: 200, height: 130.0)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 10, trailing: 0))
            VStack(alignment: .leading) {
                Text("Rezki Pratama")
                    .font(Font.system(size:20 , weight: .heavy))
                    .bold()
                Text("rezki.pratama7777@gmail.com")
                    .font(Font.system(size:20 , weight: .heavy))
                    .bold().padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                Text("About App")
                    .font(Font.system(size:20 , weight: .heavy))
                    .bold()
                Text("This is a game and developer list application that shows exactly the details of each publisher, as well as a list of each game.")
                    .foregroundColor(.gray)
                    .font(Font.system(size:20 , weight: .heavy))
                    .padding(EdgeInsets(top: 5, leading: 30, bottom: 10, trailing: 30))
                
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
            Spacer()
        }.navigationTitle(Text("Profile")).font(.system(size: 18))
        
    }
}
