import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import Combine

///Класс для получение информации о пользователе
class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    private init(){}
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("DEBUG: CurrentUser \(String(describing: currentUser))")
    }
    
    static func fetchAllUser(limit: Int? = nil) async throws -> [User] {
        let query = FirebaseConstants.userCollection
        if let limit { query.limit(to: limit) } ///Лимит для загрузки юзеров
        let snapshot = try await query.getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users
    }
    
    static func fetchUser(with uid: String, completion: @escaping (User)-> Void){
        FirebaseConstants.userCollection.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
    
}
