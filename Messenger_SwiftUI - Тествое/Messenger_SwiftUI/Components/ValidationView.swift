import SwiftUI

struct ValidationView: View {
    
    var email: String
    var password: String
     
    var body: some View {
        VStack(spacing: 20){
            
            if(!email.isEmpty) {
                Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(email.isValidEmail() ? .green : .red)
                email.isValidEmail()
                ? VStack(alignment:.leading) { Text("Email подходит по параметрам").foregroundColor(.green )
                    Text("")
                }
                : VStack(alignment:.leading) {
                    Text("Email должен быть в формате:").foregroundColor(email.isValidEmail() ? .green : .red)
                    Text("\n test@email.ru") .foregroundColor(email.isValidEmail() ? .green : .red)
                }
            }
            
            if(password.count != 0) {
                
                Image(systemName: password.isValidPassword(password) ? "checkmark" : "xmark")
                    .fontWeight(.bold)
                    .foregroundColor(password.isValidPassword(password) ? .green : .red)
                password.isValidPassword(password)
                ? VStack(alignment:.leading) {
                    Text("Пароль подходит по параметрам") .foregroundColor(.green)
                    Text("")}
                : VStack(alignment:.leading) {
                    Text("Пароль должен быть в формате:")
                        .foregroundColor(.red)
                    Text("\n 6 символов минимум,\n 1  специальный символ,\n 1  Заглавная буква")
                        .foregroundColor(.red)
                }
            }
        }.padding()
    }
}

#Preview {
    ValidationView(email: "s",password: "A121")
}
