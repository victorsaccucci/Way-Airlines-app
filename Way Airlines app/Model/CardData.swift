import Foundation

//Objeto avião
struct CardObject: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var image: String
}

//Representação os aviões no carrossel
var airplanesCards: [CardObject] = [
    .init(title: "Boeing 737", image: "boeing737"),
    .init(title: "Airbus A320", image: "airbusA320"),
    .init(title: "Boeing 747", image: "boeing747"),
    .init(title: "Boeing 777", image: "boeing777"),
    .init(title: "Airbus A380", image: "airbusA380")
]

//Representação dos aeroports no carrossel
var airportsCards: [CardObject] = [
    .init(title: "JFK - John F. Kennedy International Airport", image: "airportJFK"),
    .init(title: "LAX - Los Angeles International Airport", image: "airportLAX"),
    .init(title: "ORD - O'Hare International Airport", image: "airportORD"),
    .init(title: "MIA - Miami International Airport", image: "airportMIA"),
    .init(title: "SFO - San Francisco International Airport", image: "airportSFO"),
    .init(title: "SEA - Seattle-Tacoma International Airport", image: "airportSEA"),
    .init(title: "ATL - Hartsfield-Jackson Atlanta International Airport", image: "airportATL"),
    .init(title: "DFW - Dallas/Fort Worth International Airport", image: "airportDFW"),
    .init(title: "BOS - Logan International Airport", image: "airportBOS")
]
