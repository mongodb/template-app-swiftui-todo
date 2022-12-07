import Foundation
import RealmSwift

/// Store the Realm app details to use when instantiating the app and
/// when using the `@AsyncOpen` property wrapper to open the realm.
struct AppConfig {
    var appId: String
    var baseUrl: String
}


/// Read the Realm.plist file and store the app ID and baseUrl to use elsewhere.
func loadAppConfig() -> AppConfig {
    guard let path = Bundle.main.path(forResource: "Realm", ofType: "plist") else {
        fatalError("Could not load Realm.plist file!")
    }
    // Any errors here indicate that the Realm.plist file has not been formatted properly.
    // Expected key/values:
    //      "appId": "your Realm app ID"
    let data = NSData(contentsOfFile: path)! as Data
    let realmPropertyList = try! PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
    let appId = realmPropertyList["appId"]! as! String
    let baseUrl = realmPropertyList["baseUrl"]! as! String
    return AppConfig(appId: appId, baseUrl: baseUrl)
}
