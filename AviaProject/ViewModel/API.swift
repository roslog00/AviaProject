//
//  API.swift
//  AviaProject
//
//  Created by Вероника Гера on 25.07.2023.
//

import Foundation

//Network services with fetching data from API
struct APIServices {
    static let shared = APIServices()
    
    //Computed property url
    static var url: URL? {
        let tunnel = "https://"
        let server = "nu.vsepoka.ru"
        let endPoint = "/api"
        let parametrs = "/search?origin=MOW&destination=LED"
        
        let urlString = tunnel + server + endPoint + parametrs
        
        return URL(string: urlString)
    }
}

extension APIServices {
    //Get data from network
    func fetchData() async throws -> FlightResult {
        
        //Check URL
        guard let url = APIServices.url else {
            throw NetworkingErrors.badUrl
        }
        print(url)
        
        //Create a response
        let response = try await URLSession.shared.data(from: url)
        
        print(response.0)
        //Create a decoder
        let decoder = JSONDecoder()
        
        let result = try decoder.decode(FlightResult.self, from: response.0)
        return try decoder.decode(FlightResult.self, from: response.0)
    }
}

