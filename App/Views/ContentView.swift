import SwiftUI
import RealmSwift

struct ContentView: View {
    @ObservedObject var app: RealmSwift.App
    @EnvironmentObject var errorHandler: ErrorHandler

    var body: some View {
        if let user = app.currentUser {
            // Setup configuraton so user initially subscribes to their own tasks
            let config = user.flexibleSyncConfiguration(initialSubscriptions: { subs in
                subs.remove(named: Constants.allItems)
                if let _ = subs.first(named: Constants.myItems) {
                    // Existing subscription found - do nothing
                    return
                } else {
                    // No subscription - create it
                    subs.append(QuerySubscription<Item>(name: Constants.myItems) {
                        $0.owner_id == user.id
                    })
                }
            })
            OpenRealmView(user: user)
                // Store configuration in the environment to be opened in next view
                .environment(\.realmConfiguration, config)
        } else {
            // If there is no user logged in, show the login view.
            LoginView()
        }
    }
}
