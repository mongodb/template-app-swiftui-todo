import SwiftUI

struct ErrorView: View {
    @State var error: Error
        
    var body: some View {
        Text("Error: \(error.localizedDescription)")
    }
}
