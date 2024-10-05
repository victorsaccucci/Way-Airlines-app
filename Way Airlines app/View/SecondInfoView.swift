import SwiftUI

struct SecondInfoView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.grayBackground1, .grayBackground2]), startPoint: .top, endPoint: .bottom)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("imageInfoSecond")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: min(geometry.size.width - 40, 900), height: min(geometry.size.height - 40, 700))
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 50)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .mask {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    .gray,
                                    .gray,
                                    .gray,
                                    .gray,
                                    .gray.opacity(0.9),
                                    .gray.opacity(0.6),
                                    .gray.opacity(0.1),
                                    .gray.opacity(0),
                                    .clear,
                                    .clear,
                                    .clear
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SecondInfoView()
}
