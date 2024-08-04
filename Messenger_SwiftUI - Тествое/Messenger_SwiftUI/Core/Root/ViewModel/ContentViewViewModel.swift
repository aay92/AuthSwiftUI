import Firebase
import FirebaseAuth
import Combine


class ContentViewViewModel: ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        setupSubscribe()
    }
    private func setupSubscribe(){
        AuthService.shared.$userSession.sink {[weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellable)

    }
}
