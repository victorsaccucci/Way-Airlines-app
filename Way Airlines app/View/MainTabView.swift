import SwiftUI

struct MainTabView: View {
    
    init() {
        //Aparência da tab bar
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            AirplanesView()
                .tabItem {
                    Label("Aeronaves", systemImage: "airplane")
                }
            SettingsView()
                .tabItem {
                    Label("Configurações", systemImage: "gear")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    MainTabView()
}
