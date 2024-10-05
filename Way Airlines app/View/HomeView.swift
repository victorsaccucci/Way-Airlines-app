import SwiftUI

struct HomeView: View {
    
    @StateObject private var flightViewModel = FlightViewModel()
    
    // Filtro selecionado e definido "todos" como padrão
    @State private var selectedFilter: String = "Todos"
    
    // Opções de filtro
    let filterOptions = ["Todos", "Concluídos", "À Realizar", "Cancelados", "Em voo"]
    
    //Quantidade de resultados
    var filteredFlights: [Flight] {
        if let flights = flightViewModel.flightData?.flights {
            return filterFlights(flights: flights)
        } else {
            return []
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.grayBackground1, .grayBackground2]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        VStack {
                            // Filtro de busca
                            Menu {
                                ForEach(filterOptions.indices, id: \.self) { index in
                                    Button {
                                        // Atualiza o filtro selecionado
                                        selectedFilter = filterOptions[index]
                                    } label: {
                                        HStack {
                                            Image(systemName: iconForOption(at: index))
                                                .font(.system(size: 13))
                                                .foregroundColor(.black)
                                            
                                            Text(filterOptions[index])
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            } label: {
                                HStack {
                                    HStack(alignment: .bottom) {
                                        //passar o resultado do filtro
                                        Text("(\(filteredFlights.count))")
                                            .font(.system(size: 22))
                                            .foregroundColor(.black)
                                        
                                        Text("Resultados")
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Spacer()
                                    HStack {
                                        
                                        Text("Filtrar")
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 16))
                                        
                                        Image(systemName: "line.3.horizontal.decrease.circle")
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 20))
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.4))
                                    .clipShape(Capsule())
                                }
                            }
                        }
                        .padding()
                        
                        //Verificar se a lista é nula
                        if let flights = flightViewModel.flightData?.flights {
                            
                            //Filtra os voos com base na opção selecionada
                            let filteredFlights = filterFlights(flights: flights)
                            
                            if filteredFlights.isEmpty {
                                HStack {
                                    Text("Nenhum voo em andamento no momento")
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .foregroundColor(.black)
                                    Image(systemName: "airplane")
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .foregroundColor(.black)
                                }.padding(20)
                            }
                            
                            ForEach(filteredFlights, id: \.flight_id) { flight in
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    HStack {
                                        Text("\(flight.status)")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                            .foregroundColor(flight.status == "CANCELADO" ? .orange : .green)
                                        
                                        Image(systemName: flight.status == "CONCLUIDO" ? "checkmark" : (flight.status == "CANCELADO" ? "xmark" : ""))
                                            .font(.system(size: 14))
                                            .fontWeight(.bold)
                                            .foregroundColor(flight.status == "CANCELADO" ? .orange : .green)
                                    }
                                    
                                    
                                    Text("Data: \(flight.start_date)")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 14))
                                    
                                    //Usando a função privada para exibir o local de partida e destino
                                    createLocationText(title: "Partida", airport: flight.departure_airport, time: flight.departure_time)
                                    createLocationText(title: "Destino", airport: flight.arrival_airport, time: flight.arrival_time)
                                    
                                    Text("Aeronave: \(flight.airplane_name)")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 14))
                                }
                                .padding()
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.blueBackground1, .blueBackground2]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.5), radius: 4, x: 0, y: 2)
                                .frame(height: 200)
                                .padding(.horizontal)
                            }
                        } else {
                            // Exibir mensagem caso a lista não possua dados
                            Text("Voos não encontrados.")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("Consulta de voos")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                flightViewModel.loadFlights()
            }
        }
    }
    
    // Função privada para criar o texto de localização
    private func createLocationText(title: String, airport: String, time: String) -> some View {
        Text("\(title): \(airport) - \(time)")
            .font(.system(size: 14))
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 4)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    // Filtra os voos com base na opção selecionada
    private func filterFlights(flights: [Flight]) -> [Flight] {
        
        //Os últimos 3 dados do JSON de voos tiveram
        //a data de inicio (start_date) alteradas para o mês de dezembro para simular
        //voos que ainda vão acontecer.
        
        //Converter a data atual para String e comparar no terceiro Caso do Switch Case
        //para filtrar voos que irão acontecer.
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDate = Date()
        let currentDateString = dateFormatter.string(from: currentDate)
        
        
        return flights.filter { flight in
            
            switch selectedFilter {
            case "Concluídos":
                return flight.status == "CONCLUIDO"
            case "Cancelados":
                return flight.status == "CANCELADO"
            case "Em voo":
                return flight.status == "EM_VOO"
            case "À Realizar":
                return flight.start_date > currentDateString
            default:
                return true
            }
        }
    }
    
    //Exibindo ícoones para as opções de filtro
    private func iconForOption(at index: Int) -> String {
        switch index {
        case 0:
            return "list.bullet.clipboard"
        case 1:
            return "checkmark"
        case 2:
            return "calendar.badge.clock"
        case 3:
            return "xmark"
        case 4:
            return "airplane.departure"
        default:
            return "questionmark"
        }
    }
}

#Preview {
    HomeView()
}
