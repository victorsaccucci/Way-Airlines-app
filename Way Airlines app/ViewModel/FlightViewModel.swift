import Foundation

class FlightViewModel: ObservableObject {
    
    @Published var flightData: FlightData?

    //Decodificar JSON de voos
    func loadFlights() {
        guard let jsonData = JsonData.mockedFlights.data(using: .utf8) else {
            print("Error, could not convert mockedFlights to Data")
            return
        }

        let decoder = JSONDecoder()

        do {
            let data = try decoder.decode(FlightData.self, from: jsonData)
            self.flightData = data
        } catch {
            print("Error decoding flights JSON: \(error)")
        }
    }
}
