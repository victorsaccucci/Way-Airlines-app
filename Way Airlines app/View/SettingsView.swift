import SwiftUI

struct SettingsView: View {
    @State private var isShowingSplashScreen = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.grayBackground1, .grayBackground2]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                Button(action: {
                    //Simulando o usuário se desconectando e voltando para a SplashScreenView
                    isShowingSplashScreen = true
                }) {
                    Text("Sair")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isShowingSplashScreen) {
            SplashScreenView()
        }
    }
}

#Preview {
    SettingsView()
}
