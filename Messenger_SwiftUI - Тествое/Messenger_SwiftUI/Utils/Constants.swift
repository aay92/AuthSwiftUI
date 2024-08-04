import Foundation
import Firebase

struct FirebaseConstants {
    static let userCollection = Firestore.firestore().collection("users")
    static let messageCollection = Firestore.firestore().collection("messages")
}
