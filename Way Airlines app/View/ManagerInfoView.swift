import SwiftUI

struct ManagerInfoView: View {
    
    @State private var currentPage = 0
    @State private var showingLoginView = false
    
    var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
                FirstInfoView()
                    .tag(0)
                SecondInfoView()
                    .tag(1)
            }
            .edgesIgnoringSafeArea(.all)
            .tabViewStyle(PageTabViewStyle())
            
            VStack {
                Spacer()
                getTextForPage(currentPage)
                
                if currentPage != 1 && currentPage != 4 {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 18))
                        .foregroundStyle(Color.black)
                        .padding(.bottom, 60)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .fullScreenCover(isPresented: $showingLoginView) {
            MainTabView()
        }
    }
    
    private func getTextForPage(_ page: Int) -> AnyView {
        switch page {
        case 0:
            return AnyView(Text("Conheça nossa empresa")
                .frame(width: 200)
                .padding(.bottom, 28)
                .foregroundColor(Color.black)
                .fontWeight(.light)
                .multilineTextAlignment(.center))
        case 1:
            return AnyView(
                VStack {
                    Text("Consulte nosso histórico de voos")
                        .frame(width: 220)
                        .padding(.bottom, 28)
                        .foregroundColor(Color.black)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                    
                    buttonView
                }
            )
        default:
            return AnyView(EmptyView())
        }
    }
    
    private var buttonView: some View {
        VStack {
            Button(action: {
                showingLoginView = true
            }) {
                HStack {
                    Text("Vamos lá!")
                        .padding()
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(Capsule())
            }
        }
        .padding(.horizontal, 60)
        .padding(.bottom, 60)
    }

}

#Preview {
    ManagerInfoView()
}
