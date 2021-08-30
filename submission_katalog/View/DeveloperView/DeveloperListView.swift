
import SwiftUI

struct DeveloperListView: View {
    @ObservedObject var developerViewModel = DeveloperViewModel()
    var body: some View {
        VStack(alignment: .center) {
            if developerViewModel.loading {
                ProgressIndicator(color: Color.gray, size: 50)
            } else if developerViewModel.developer.results.count > 0 {
                List(developerViewModel.developer.results) { developer in
                    ZStack(alignment: .leading) {
                        DeveloperRowView(developer: developer)
                        NavigationLink(destination: DeveloperDetailView(developer: developer)) {
                            EmptyView()
                        }
                    }
                }.navigationTitle(Text("Developer")).font(.system(size: 18))
            } else {
                ErrorView(text: "Error Data")
            }
        }.onAppear {
            self.developerViewModel.loadDeveloper()

        }
        
    }
}

struct DeveloperListView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperListView()
    }
}

