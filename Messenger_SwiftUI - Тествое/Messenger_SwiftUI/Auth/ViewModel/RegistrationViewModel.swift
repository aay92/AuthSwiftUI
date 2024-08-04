import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password : String = ""
    @Published var fullName = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(with: email, password: password, fullname: fullName)
    }
}
