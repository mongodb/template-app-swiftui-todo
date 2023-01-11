# SwiftUI Template App

This project uses Swift Package Manager (SPM) to load dependencies.

## Configuration

Ensure `App/Realm.plist` exists and contains the following properties:

- **appId:** your Atlas App Services App ID.
- **baseUrl:** the App Services backend URL. This should be https://realm.mongodb.com in most cases.

### Cloning from GitHub

If you have cloned this repository from the GitHub
[mongodb/template-app-swiftui-todo](https://github.com/mongodb/template-app-swiftui-todo.git)
repository, you must create a separate App Services App with Device Sync
enabled to use this client. You can find information about how to do this
in the Atlas App Services documentation page:
[Template Apps -> Create a Template App](https://www.mongodb.com/docs/atlas/app-services/reference/template-apps/#create-a-template-app)

Once you have created the App Services App, replace any value in this client's
`appId` field with your App Services App ID. For help finding this ID, refer
to: [Find Your Project or App Id](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/)

### Download the Client as a Zip File

If you have downloaded this client as a .zip file from the Atlas App Services
UI, it does not contain the App Services App ID. You must replace any value 
in this client's `appId` field in `App/Realm.plist` with your App Services 
App ID. For help finding this ID, refer to: 
[Find Your Project or App Id](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/)

If you did not replace the App ID, you may see an `Error: unsupported URL` message.

## Run the app

- Open App.xcodeproj in Xcode.
- Wait for SPM to download dependencies.
- Press "Run".

## Issues

Please report issues with the template at https://github.com/mongodb-university/realm-template-apps/issues/new .
