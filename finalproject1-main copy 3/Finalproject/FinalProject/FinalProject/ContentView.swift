import SwiftUI
import ParseSwift

struct ContentView: View {
    @State private var isLoggedIn = User.current != nil
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        Group {
            if isLoggedIn {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    
                    ExploreView()
                        .tabItem {
                            Image(systemName: "magnifyingglass.circle.fill")
                            Text("Explore")
                        }
                    
                    EventsView()
                        .tabItem {
                            Image(systemName: "calendar.circle.fill")
                            Text("Events")
                        }
                    
                    DiscoverEventsView()
                        .tabItem {
                            Image(systemName: "ticket.fill")
                            Text("Discover")
                        }
                    
                    MessagesView()
                        .tabItem {
                            Image(systemName: "message.fill")
                            Text("Messages")
                        }
                    
                    ProfileView(isLoggedIn: $isLoggedIn)
                        .tabItem {
                            Image(systemName: "person.crop.circle.fill")
                            Text("Profile")
                        }
                }
                .accentColor(isDarkMode ? .white : .black)
            } else {
                AuthenticationView()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .onAppear {
            checkLoginStatus()
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("UserLoggedIn"))) { _ in
            checkLoginStatus()
        }
    }
    
    func checkLoginStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let loggedIn = User.current != nil
            self.isLoggedIn = loggedIn
        }
    }
}

#Preview {
    ContentView()
}
