
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                DeveloperListView()
                navigationTitle(Text("Developer"))
            }.tabItem { Image(systemName: "folder.badge.person.crop")
                Text("Developer")
            }
            NavigationView {
                GamesListView()
                    .navigationTitle(Text("Game"))
            }.tabItem {
                Image(systemName: "gamecontroller.fill")
                Text("Game")
            }
            NavigationView {
                FavoriteListView()
                    .navigationTitle(Text("Favorite"))
                
            }.tabItem {
                Image(systemName: "heart")
                Text("Favorite")
            }
            NavigationView {
                Profile()
                    .navigationTitle(Text("Profile"))
                
            }.tabItem { Image(systemName: "person.crop.circle")
                Text("Profile")
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
