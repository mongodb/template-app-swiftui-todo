import SwiftUI
import RealmSwift

/// Log in or register users using email/password authentication
struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @State private var isLoggingIn = false
    @State var error: Error?
    
    var body: some View {
        VStack {
            if isLoggingIn {
                ProgressView()
            }
            if let error = error {
                Text("Error: \(error.localizedDescription)")
            }
            Text("My Sync App")
                .font(.title)
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("Log In") {
                // Button pressed, so log in
                isLoggingIn = true
                Task.init {
                    await login(email: email, password: password)
                    isLoggingIn = false
                }
            }
            .disabled(isLoggingIn)
            .frame(width: 150, height: 50)
            .background(Color.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())
            Button("Create Account") {
                // Button pressed, so create account and then log in
                isLoggingIn = true
                Task {
                    await signUp(email: email, password: password)
                    isLoggingIn = false
                }
            }
            .disabled(isLoggingIn)
            .frame(width: 150, height: 50)
            .background(Color.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
        
    /// Logs in with an existing user.
    func login(email: String, password: String) async {
        do {
            let user = try await realmApp.login(credentials: Credentials.emailPassword(email: email, password: password))
            print("Successfully logged in user: \(user)")
        } catch {
            print("Failed to log in user: \(error.localizedDescription)")
            self.error = error
        }
    }
    
    /// Registers a new user with the email/password authentication provider.
    func signUp(email: String, password: String) async {
        do {
            try await realmApp.emailPasswordAuth.registerUser(email: email, password: password)
            print("Successfully registered user")
            await login(email: email, password: password)
        } catch {
            print("Failed to register user: \(error.localizedDescription)")
            self.error = error
        }
    }
}
