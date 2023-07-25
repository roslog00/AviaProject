//
//  BuyTicketView.swift
//  AviaProject
//
//  Created by Вероника Гера on 28.07.2023.
//

import SwiftUI

struct BuyTicketView: View {
    
    @State var alertToggle : Bool = false
    
    @State var ticketsDepartureDateTime: String
    @State var ticketsArrivalDateTime : String
    @State var ticketsFromCityIATA : String = ""
    @State var ticketsPassengerCount : Int = 1
    @State var ticketsToCityIATA : String = ""
    @State var ticketsFromCity : String = ""
    @State var ticketsAirlane : String
    @State var ticketsToCity : String = ""
    @State var ticketsPrice : Int
    
    var body: some View {
        ZStack {
            Color(red: 0.94, green: 0.95, blue: 0.96).ignoresSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .center, spacing: 4) {
                    Text("\(ticketsPrice) ₽")
                        .font(.system(size: 34))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                        .frame(maxWidth: .infinity, alignment: .top)
                    
                    
                    Text("Лучшая цена за 1 чел")
                        .font(.system( size: 13))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                        .frame(maxWidth: .infinity, alignment: .top)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .top)
                
                VStack(alignment: .leading, spacing: getAdaptiveWidth(16)) {
                    Text("\(ticketsFromCity) — \(ticketsToCity)")
                        .font(.system(size: 17).weight(.bold))
                        .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    VStack(alignment: .leading, spacing: getAdaptiveWidth(4)) {
                        HStack(alignment: .center, spacing: getAdaptiveWidth(12)) {
                            Image(airlineLogo(airlineString: ticketsAirlane))
                            
                            Text("\(ticketsAirlane)")
                                .font(.system(size: 15).weight(.semibold))
                              .foregroundColor(Color(red: 0.05, green: 0.07, blue: 0.11))
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        cityAndDateDetialView()
                    }
                    .padding(.horizontal, 0)
                    .padding(.top, 0)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(Color(.white))
                    .cornerRadius(10)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
                Button(action: {
                    alertToggle.toggle()
                }, label: {
                    HStack(alignment: .center) {
                        Text("Купить билет за \(ticketsPrice) ₽")
                            .font(.system(size: 17).weight(.semibold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .padding(.horizontal, getAdaptiveWidth(16))
                    .padding(.vertical, 0)
                    .frame(width: getAdaptiveWidth(343), height: getAdaptiveHeight(48), alignment: .center)
                    .background(Color(red: 1, green: 0.44, blue: 0.2))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 8)
                })
            }.alert(isPresented: $alertToggle, content: {
                Alert(title:
                      Text("Билет куплен за \(ticketsPrice) ₽")
                    .font(.system( size: 17).weight(.semibold)))
                        
            })
            .padding(0)
            .frame(width: getAdaptiveWidth(343), alignment: .topLeading)
            .onAppear{
                Task {
                    try await changeValue()
                }
            }
            .onDisappear{
                ticketsDepartureDateTime = ""
                ticketsArrivalDateTime = ""
                ticketsAirlane = ""
                ticketsPrice = 0
                
            }
        }
    }
}

extension BuyTicketView {
    func changeValue() async throws {
        ticketsPassengerCount = try await APIServices().fetchData().passengersCount
        ticketsFromCityIATA = try await APIServices().fetchData().origin.iata
        ticketsToCityIATA = try await APIServices().fetchData().destination.iata
        ticketsFromCity = try await APIServices().fetchData().origin.name
        ticketsToCity = try await APIServices().fetchData().destination.name
    }
}


struct BuyTicketView_Preview: PreviewProvider {
    static var previews: some View {
        BuyTicketView(ticketsDepartureDateTime: "13:00", ticketsArrivalDateTime: "14:40", ticketsFromCityIATA: "MOW", ticketsToCityIATA: "LED", ticketsFromCity: "Moscow", ticketsAirlane: "Победа", ticketsToCity: "Санкт-Петербург", ticketsPrice: 13750)
    }
}
