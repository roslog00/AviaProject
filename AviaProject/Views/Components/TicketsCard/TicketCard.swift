//
//  TicketCard.swift
//  AviaProject
//
//  Created by Вероника Гера on 26.07.2023.
//

import SwiftUI

struct TicketCard: View {
    
    //State propertys for ticket's card
    @State var availableTicketsCount : Int
    @State var departureDateTime: String
    @State var arrivalDateTime : String
    @State var passengersCount : Int = 0
    @State var fromCityIATA : String = ""
    @State var toCityIATA : String = ""
    @State var currency : String
    @State var fromCity : String = ""
    @State var airlane : String
    @State var toCity : String = ""
    @State var price : Int
    
    //Create ticket's card view
    var body: some View {
        VStack(alignment: .leading, spacing: getAdaptiveWidth((-10))) {
            VStack(alignment: .leading, spacing: 0) {
                priceAndAirline()
                
                cityAndCardView()
            }
            .padding(.horizontal, 0)
            .padding(.top, 0)
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .cornerRadius(10)
        }.onAppear {
            Task {
                do{
                    try await changeValue()
                } catch {
                    print("Cancel changing with error - \(error)")
                }
            }
        }
        .padding(0)
        .frame(width: getAdaptiveWidth(343), alignment: .topLeading)
        .background(Color.white)
        .cornerRadius(10)

        
    }
}

extension TicketCard {
    func changeValue() async throws {
        passengersCount = try await APIServices().fetchData().passengersCount
        fromCityIATA = try await APIServices().fetchData().origin.iata
        toCityIATA = try await APIServices().fetchData().destination.iata
        fromCity = try await APIServices().fetchData().origin.name
        toCity = try await APIServices().fetchData().destination.name
    }
}

struct TicketCard_Preview: PreviewProvider {
    static var previews: some View {
        TicketCard(availableTicketsCount: 9, departureDateTime: "2023-09-03 10:10", arrivalDateTime: "2023-09-03 11:45", currency: "RUB", airlane: "Аэрофлот", price: 12000)
    }
}
