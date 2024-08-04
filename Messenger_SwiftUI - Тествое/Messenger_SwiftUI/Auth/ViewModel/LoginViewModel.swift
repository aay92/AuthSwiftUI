import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password: String = ""
//    @Published var fullName = ""

    func login() async throws {
        try await AuthService.shared.login(with: email, password: password)
    }
}

