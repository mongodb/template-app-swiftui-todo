import SwiftUI
import RealmSwift

/// Show a detail view of a task Item. User can edit the summary or mark the Item complete.
struct ItemDetail: View {
    // This property wrapper observes the Item object and
    // invalidates the view when the Item object changes.
    @ObservedRealmObject var item: Item
    
    var body: some View {
        Form {
            Section(header: Text("Edit Item Summary")) {
                // Accessing the observed item object lets us update the live object
                // No need to explicitly update the object in a write transaction
                TextField("Summary", text: $item.summary)
            }
            Section {
                Toggle(isOn: $item.isComplete) {
                    Text("Complete")
                }
            }
        }
        .navigationBarTitle("Update Item", displayMode: .inline)
    }
}
