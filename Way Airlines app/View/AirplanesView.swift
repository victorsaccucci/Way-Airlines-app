import SwiftUI

struct AirplanesView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.grayBackground1, .grayBackground2]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.vertical){
                    VStack {
                        
                        //Carrossel de aeroportos
                        HStack {
                            Text("Aeroportos")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                            
                            Image(systemName: "mappin")
                                .font(.system(size: 20))
                                .foregroundStyle(Color.black)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.top, 20)
                        
                        
                        GeometryReader(content: { geometry in
                            let size = geometry.size
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 5 ){
                                    ForEach(airportsCards) { airport in
                                        GeometryReader(content: { proxy in
                                            let cardSize = proxy.size
                                            let minX = min((proxy.frame(in: .scrollView).minX * 1.4), proxy.size.width * 1.4  )
                                            Image(airport.image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .offset(x: -minX)
                                                .frame(width: proxy.size.width * 2.5)
                                                .frame(width: cardSize.width, height: cardSize.height)
                                                .overlay(content: {
                                                    OverlayView(airport)
                                                })
                                                .clipShape(.rect(cornerRadius: 15))
                                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 8, x: 5, y: 10)
                                        })
                                        .frame(width: size.width - 60 , height: size.height - 50)
                                        .scrollTransition(.interactive, axis: .horizontal) {
                                            view, phase in
                                            view
                                                .scaleEffect(phase.isIdentity ? 1 : 0.90)
                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                                .scrollTargetLayout()
                                .frame(height: size.height, alignment: .top)
                                
                            }
                            .scrollTargetBehavior(.viewAligned)
                            .scrollIndicators(.hidden)
                            
                        })
                        .frame(height: 500)
                        .padding(.horizontal, -15)
                        .padding(.top, 20)
                        
                        //Carrossel de viões
                        HStack {
                            Text("Aeronaves")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                            Image(systemName: "airplane")
                                .font(.system(size: 20))
                                .foregroundStyle(Color.black)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                       
                        
                        GeometryReader(content: { geometry in
                            let size = geometry.size
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 5 ){
                                    ForEach(airplanesCards) { airplane in
                                        GeometryReader(content: { proxy in
                                            let cardSize = proxy.size
                                            Image(airplane.image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: cardSize.width, height: cardSize.height)
                                                .overlay(content: {
                                                    OverlayView(airplane)
                                                })
                                                .clipShape(.rect(cornerRadius: 15))
                                                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.15), radius: 8, x: 5, y: 10)
                                        })
                                        .frame(width: size.width + 100, height: 240)
                                        .scrollTransition(.interactive, axis: .horizontal) {
                                            view, phase in
                                            view
                                                .scaleEffect(phase.isIdentity ? 1 : 0.90)
                                        }
                                    }
                                }
                                .padding(.horizontal, 12)
                                .scrollTargetLayout()
                                .frame(height: size.height, alignment: .top)
                                
                            }
                            .scrollTargetBehavior(.viewAligned)
                            .scrollIndicators(.hidden)
                            
                        })
                        .frame(height: 260)
                        .padding(.horizontal, -15)
                        .padding(.top, 10)
                    }
                }.scrollIndicators(.hidden)
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func OverlayView(_ card: CardObject) -> some View {
        ZStack(alignment: .bottomLeading, content: {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.3),
                .black.opacity(0.5),
                .black
            ],startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(card.title)
                    .font(.system(size: 16))
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                    .padding()
            })
        })
    }
}
#Preview {
    AirplanesView()
}
