import SwiftUI
import RealmSwift

/// This method loads app config details from a Realm.plist we generate
/// for the template apps.
/// When you create your own Realm app, use your preferred method
/// to store and access app configuration details.
let theAppConfig = loadAppConfig()

let realmApp = App(id: theAppConfig.appId, configuration: AppConfiguration(baseURL: theAppConfig.baseUrl, transport: nil, localAppName: nil, localAppVersion: nil))

@main
struct realmSwiftUIApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView(app: realmApp)
        }
    }
}
