import Foundation

//Objeto que representa um voo
struct Flight: Codable {
    let flight_id: String
    let status: String
    let completion_status: String
    let start_date: String
    let end_date: String
    let departure_time: String
    let arrival_time: String
    let departure_airport: String
    let arrival_airport: String
    let airplane_name: String
}

struct FlightData: Codable {
    let flights: [Flight]
}
