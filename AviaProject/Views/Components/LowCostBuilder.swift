//
//  LowCostBuilder.swift
//  AviaProject
//
//  Created by Вероника Гера on 27.07.2023.
//

import Foundation
import SwiftUI

extension TicketList {
    
    //Create a scroll view using viewbuilder
    
    @ViewBuilder
    func lowCostBuilder(tickets: [FlightTicket]) -> some View {
        //Scroll View
        ScrollView(showsIndicators: false) {
            
            //Get tickets from an array and work with them
            ForEach(result) { ticketsData in
                
                //Сompare the value in the loop with the first value in the sorted array
                if ticketsData.id == sortTickets(flights: tickets).first?.id {
                    //Ticket card with low price mark
                    
                    Button(action: {
                        
                        detailViewToggle.toggle()
                        
                    }, label: {
                        VStack(alignment: .leading) {
                            TicketCard(availableTicketsCount: ticketsData.availableTicketsCount, departureDateTime: ticketsData.departureDateTime, arrivalDateTime: ticketsData.arrivalDateTime, currency: ticketsData.price.currency, airlane: ticketsData.airline, price: ticketsData.price.value)
                            
                            LowCost().offset(x: getAdaptiveWidth(10),y: getAdaptiveHeight((-185)))
                                
                        }.padding(.top, getAdaptiveWidth((20)))
                    }).fullScreenCover(isPresented: $detailViewToggle, content: {
                        BuyTicketView(ticketsDepartureDateTime: ticketsData.departureDateTime, ticketsArrivalDateTime: ticketsData.arrivalDateTime, ticketsAirlane: ticketsData.airline, ticketsPrice: ticketsData.price.value)
                    })
                    
                    Spacer(minLength: getAdaptiveWidth((-15)))
                    
                } else {
                    //Other tickets
                    Button(action: {
                        
                        detailViewToggle.toggle()
                        
                    }, label: {
                        TicketCard(availableTicketsCount: ticketsData.availableTicketsCount, departureDateTime: ticketsData.departureDateTime, arrivalDateTime: ticketsData.arrivalDateTime, currency: ticketsData.price.currency, airlane: ticketsData.airline, price: ticketsData.price.value)
                    }).fullScreenCover(isPresented: $detailViewToggle, content: {
                        BuyTicketView(ticketsDepartureDateTime: ticketsData.departureDateTime, ticketsArrivalDateTime: ticketsData.arrivalDateTime, ticketsAirlane: ticketsData.airline, ticketsPrice: ticketsData.price.value)
                    })
                    
                    Spacer(minLength: getAdaptiveWidth(12))
                }
            }
        }.frame(width: getAdaptiveWidth(311))
    }
}
