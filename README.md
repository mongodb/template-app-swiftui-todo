# SwiftUI Template App

A todo list application built with the [Realm Swift SDK](https://www.mongodb.com/docs/realm/sdk/swift/) and [Atlas Device Sync](https://www.mongodb.com/docs/atlas/app-services/sync/).

You can follow along with the [SwiftUI Tutorial](https://www.mongodb.com/docs/atlas/app-services/tutorial/swiftui/) to see how to build, modify, and 
run this template app.

This project uses Swift Package Manager (SPM) to load dependencies.

## Configuration

For this template app to work, you must ensure that `App/atlasConfig.plist` exists and contains the following properties:

- **appId:** your Atlas App Services App ID.
- **baseUrl:** the App Services backend URL. This should be https://realm.mongodb.com in most cases.

### Using the Atlas App Services UI

The easiest way to use this template app is to log on to [Atlas App Services](https://realm.mongodb.com/) and click the **Create App From Template** button. Choose 
**Real Time Sync**, and then follow the prompts. While the backend app is being 
created, you can download this SwiftUI template app pre-configured for your new 
app.

### Cloning from GitHub

If you have cloned this repository from the GitHub
[mongodb/template-app-swiftui-todo](https://github.com/mongodb/template-app-swiftui-todo.git)
repository, you must create a separate App Services App with Device Sync
enabled to use this client. You can find information about how to do this
in the Atlas App Services documentation page:
[Template Apps -> Create a Template App](https://www.mongodb.com/docs/atlas/app-services/reference/template-apps/)

Once you have created the App Services App, replace any value in this client's
`appId` field with your App Services App ID. For help finding this ID, refer
to: [Find Your Project or App Id](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/)

### Download the Client as a Zip File

If you have downloaded this client as a .zip file from the Atlas App Services
UI, it does not contain the App Services App ID. You must replace any value
in this client's `appId` field in `App/atlasConfig.plist` with your App Services
App ID. For help finding this ID, refer to:
[Find Your Project or App Id](https://www.mongodb.com/docs/atlas/app-services/reference/find-your-project-or-app-id/)

If you did not replace the App ID, you may see an `Error: unsupported URL` message.

## Run the app

- Open App.xcodeproj in Xcode.
- Wait for SPM to download dependencies.
- Press "Run".

## Issues

Please report issues with the template at https://github.com/mongodb-university/realm-template-apps/issues/new
