import SwiftUI
import RealmSwift

/// Use views to see a list of all Items, add or delete Items, or logout.
struct ItemsView: View {
    var leadingBarButton: AnyView?
    // ObservedResults is a mutable collection; here it's
    // all of the Item objects in the realm.
    // You can append or delete todos directly from the collection.
    @ObservedResults(Item.self) var item
    @State var isInCreateItemView = false
    @State var itemSummary = ""
    @State var user: User
    
    var body: some View {
        NavigationView {
            VStack {
                if isInCreateItemView {
                    CreateItemView(isInCreateItemView: $isInCreateItemView, user: user)
                }
                else {
                    ItemList()
                }
            }
            .navigationBarItems(leading: self.leadingBarButton,
                trailing: HStack {
                    Button {
                        isInCreateItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
            })
        }
    }
}
