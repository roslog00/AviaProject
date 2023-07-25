//
//  ResultAPI.swift
//  AviaProject
//
//  Created by Вероника Гера on 25.07.2023.
//

import Foundation

//A cast for JSON parsing
struct FlightResult: Codable {
    let passengersCount: Int
    let origin: City
    let destination: City
    let results: [FlightTicket]
    
    enum CodingKeys: String, CodingKey {
        case passengersCount = "passengers_count"
        case origin
        case destination
        case results
    }
}

struct City: Codable {
    let iata: String
    let name: String
}

struct FlightTicket: Codable, Identifiable {
    let id: String
    let departureDateTime: String
    let arrivalDateTime: String
    let price: Price
    let airline: String
    let availableTicketsCount: Int
    var isCheapest: Bool = false
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case departureDateTime = "departure_date_time"
        case arrivalDateTime = "arrival_date_time"
        case price
        case airline
        case availableTicketsCount = "available_tickets_count"
    }
    
}

struct Price: Codable {
    let currency: String
    let value: Int
}
