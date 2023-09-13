import SwiftUI
import RealmSwift

/// View a list of all Items in the realm. User can swipe to delete Items.
struct ItemList: View {
    // ObservedResults is a collection of all Item objects in the realm.
    // Deleting objects from the observed collection
    // deletes them from the realm.
    @ObservedResults(Item.self, sortDescriptor: SortDescriptor(keyPath: "_id", ascending: true)) var items
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    ItemRow(item: item)
                }
                .onDelete(perform: $items.remove)
            }
            .listStyle(InsetListStyle())
            Spacer()
            Text("Log in or create a different account on another device or simulator to see your list sync in real time")
                .frame(maxWidth: 300, alignment: .center)
            Spacer()
            if let atlasUrl = atlasUrl {
                Link("Tap here to view your data in Atlas.", destination: URL(string: atlasUrl)!)
                    .font(.body)
                    .frame(maxWidth: 300, alignment: .center)
                    .foregroundColor(Color.blue)
            }
        }
        .navigationBarTitle("Items", displayMode: .inline)
    }
}
