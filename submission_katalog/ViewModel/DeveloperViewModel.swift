
import Combine

class DeveloperViewModel: ObservableObject {
    @Published var developer = Developer(results: [])
    @Published var loading: Bool = false
    
    let service: ServiceRepo
    init(service: ServiceRepo = APIService()) {
        self.service = service
    }
    
    func loadDeveloper(){
        self.loading = true
        service.getDeveloper{developer in
            self.loading = false
            guard let developer = developer else{
                return
            }
            self.developer.results = developer
        }
    }
}
