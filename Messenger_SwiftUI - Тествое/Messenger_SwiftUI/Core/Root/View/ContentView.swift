import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                UserLogIn()
                ///Если пользователь вошел
            } else {
                loginView()
                ///Если пользователь НЕ вошел, то нужно зайти
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
