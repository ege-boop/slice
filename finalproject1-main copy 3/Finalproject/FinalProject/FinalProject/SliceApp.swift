import SwiftUI
import ParseSwift

@main
struct SliceApp: App {
    
    init() {
        // Initialize Parse with Back4app
        ParseSwift.initialize(
            applicationId: "XOgpDsZeJI8d19dyWSKXoZlk5JtnjLwMVoCTcMAP",
            clientKey: "m7PXRTiPQh9m1UOIQW85KJNvP3xMGBx161Z6IuqZ",
            serverURL: URL(string: "https://parseapi.back4app.com")!
        )
        
        print("✅ Parse initialized successfully!")
        
        // Test ClubMessage type is available
        _ = ClubMessage()
        print("✅ ClubMessage type available!")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
