import Foundation

class FlightViewModel: ObservableObject {
    
    @Published var flightData: FlightData?
    
    private let flightService = FlightService()
    
    func loadFlights() {
        flightService.getFlights { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let flights):
                    self?.flightData = FlightData(flights: flights)
                case .failure(let error):
                    print("Erro ao carregar voos: \(error.localizedDescription)")
                }
            }
        }
    }
}
