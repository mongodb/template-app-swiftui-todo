import SwiftUI
import RealmSwift

/// Instantiate a new Item object, let the user input a ``summary``, and then
/// append it to the ``items`` collection to add it to the Item list.
struct CreateItemView: View {
    // The ``items`` ObservedResults collection is the
    // entire list of Item objects in the realm.
    @ObservedResults(Item.self) var items
    // Create a new Realm Item object.
    @State private var newItem = Item()
    // We've passed in the ``creatingNewItem`` variable
    // from the ItemsView to know when the user is done
    // with the new Item and we should return to the ItemsView.
    @Binding var isInCreateItemView: Bool
    @State var user: User
    @State var itemSummary = ""

    var body: some View {
        Form {
            Section(header: Text("Item Name")) {
                // When using Atlas Device Sync, binding directly to the
                // synced property can cause performance issues. Instead,
                // we'll bind to a `@State` variable and then assign to the
                // synced property when the user presses `Save`
                TextField("New item", text: $itemSummary)
            }
            Section {
                Button(action: {
                    newItem.owner_id = user.id
                    // To avoid updating too many times and causing Sync-related
                    // performance issues, we only assign to the `newItem.summary`
                    // once when the user presses `Save`.
                    newItem.summary = itemSummary
                    // Appending the new Item object to the ``items``
                    // ObservedResults collection adds it to the
                    // realm in an implicit write.
                    $items.append(newItem)
                    // Now we're done with this view, so set the
                    // ``isInCreateItemView`` variable to false to
                    // return to the ItemsView.
                    isInCreateItemView = false
                }) {
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }
                Button(action: {
                    // If the user cancels, we don't want to
                    // append the new object we created to the
                    // task list, so we set the ``isInCreateItemView``
                    // value to false to return to the ItemsView.
                    isInCreateItemView = false
                }) {
                    HStack {
                        Spacer()
                        Text("Cancel")
                        Spacer()
                    }
                }
            }
        }
        .navigationBarTitle("Add Item")
    }
}
