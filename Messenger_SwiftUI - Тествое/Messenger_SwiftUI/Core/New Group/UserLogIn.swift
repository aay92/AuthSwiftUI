import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct UserLogIn: View {
    @State var signOut = false
    
    var body: some View {
            VStack(spacing: 20) {
                Text("Вы вошли 😀")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(.textColorMainTitle))
            
                Button {
                    signOutMethod()
                } label: {
                    Text("Покинуть страницу 👋")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.textSingOut))
                .foregroundColor(.white)
                .bold()
                .fullScreenCover(isPresented: self.$signOut, content: {
                    loginView()
                })
                .clipShape(.rect(cornerRadius: 20))
            }
            .padding(.horizontal)
    }
   //MARK: - Methods
    private func signOutMethod(){
        do {
            try Auth.auth().signOut()
            self.signOut.toggle()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

#Preview {
    UserLogIn()
}
