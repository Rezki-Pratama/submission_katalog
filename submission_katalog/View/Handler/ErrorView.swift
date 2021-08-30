import SwiftUI

struct ErrorView: View {
    var text : String
    var body: some View {
        VStack{
            Image(systemName: "gamecontroller.fill")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 200, height: 130.0)
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
            
            Text(text)
                .foregroundColor(.gray)
                .lineLimit(2)
                .font(Font.system(size:26 , weight: .heavy))
                .padding(.top,16)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(text:"Error Data")
    }
}

