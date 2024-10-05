import Foundation

class FlightService {
    
    func getFlights(completion: @escaping (Result<[Flight], Error>) -> Void) {
        
        //Simular os dados retornados de uma API
        guard let jsonData = JsonData.mockedFlights.data(using: .utf8) else {
            completion(.failure(NSError(domain: "JSON Inválido", code: 0, userInfo: nil)))
            return
        }
        do {
            let flightData = try JSONDecoder().decode(FlightData.self, from: jsonData)
            completion(.success(flightData.flights))
        } catch {
            completion(.failure(error))
        }
    }
}
