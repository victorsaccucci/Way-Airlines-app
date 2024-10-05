import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.grayBackground1, .grayBackground2]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            if isActive {
                //Navegar após 3 segundos
                ManagerInfoView()
            } else {
                VStack {
                    Image("wayArlinesLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Way Airlines")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    
                    if !isActive {
                        ProgressView()
                            .frame(width: 50, height: 50)
                            .padding(.top, 20)
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
